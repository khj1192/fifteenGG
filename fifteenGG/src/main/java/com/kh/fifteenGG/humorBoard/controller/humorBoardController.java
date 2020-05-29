package com.kh.fifteenGG.humorBoard.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kh.fifteenGG.common.util.Utils;
import com.kh.fifteenGG.humorBoard.model.service.humorBoardService;
import com.kh.fifteenGG.humorBoard.model.vo.Comment;
import com.kh.fifteenGG.humorBoard.model.vo.humorBoard;
import com.kh.fifteenGG.member.model.vo.Member;

import oracle.net.aso.i;

@Controller
public class humorBoardController {

	@Autowired
	humorBoardService humorBoardService;

	@RequestMapping("/humorBoard/humorBoardList.do")
	public String selecthumorBoardList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		if (member != null) {

			System.out.println(member);
			int userNo = member.getUserNo();
			session.setAttribute("userNo", userNo);

		}
		/* 한 페이지당 보여줄 게시글 수 */
		int numPerPage = 10;

		/* 페이지 처리된 리스트 가져오기 */
		List<Map<String, String>> list = humorBoardService.selectList(cPage, numPerPage);

		int totalContents = humorBoardService.selectTotalContents();

		// 페이지 계산 HTML 추가하기
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "humorBoardList.do");

		System.out.println(pageBar);
		model.addAttribute("list", list)
			  .addAttribute("totalContents", totalContents)
			  .addAttribute("numPerPage", numPerPage)
			  .addAttribute("pageBar", pageBar);

		return "humorBoard/humorBoardList";
	}

	@RequestMapping("/humorBoard/humorForm.do")
	public String humorForm() {
		return "humorBoard/humorForm";
	}

	@RequestMapping("/humorBoard/humorFormEnd.do")
	public String insertBoard(humorBoard humorboard, Model model) {
		int result = 0;

		result = humorBoardService.insertBoard(humorboard);
		System.out.println("humorboard확인 :" + humorboard);

		String msg = "";
		String loc = "/humorBoard/humorBoardList.do";

		if (result > 0) {
			msg = "게시글 추가 성공!";
		} else {
			msg = "게시글 추가 실패!";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping(value = "/humorBoard/ckImageUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> fileUpload(@RequestParam(value = "upload", required = false) MultipartFile[] upFiles,
			HttpServletRequest request) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		// 1. 저장할 폴더 설정
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");

		// 3. 만약 저장할 폴더가 없다면 직접 만들기
		File dir = new File(savePath);
		if (dir.exists() == false)
			dir.mkdirs();

		/********** Multipart 파일 업로드 시작 **********/

		for (MultipartFile f : upFiles) {
			if (!f.isEmpty()) {
				// 파일 이름 재생성해서 저장하기
				String originalFileName = f.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				// sample.jpg --> .jpg

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rndNum = (int) (Math.random() * 1000);

				String renamedFileName = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + "." + ext;
				// --> 20191230_154500_1.jpg

				try {

					f.transferTo(new File(savePath + "/" + renamedFileName));

					File humorBFile = new File(savePath + "/" + renamedFileName);
					System.out.println("file : " + humorBFile);

					map.put("uploaded", 1);
					map.put("fileName", renamedFileName);
					map.put("url", request.getContextPath() + "/resources/upload/" + renamedFileName);
					map.put("humorBFile", humorBFile);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		/********** Multipart 파일 업로드 끝 **********/

		return map;
	}

	/*
	 * @RequestMapping(value="/humorBoard/ckImageUpload.do",
	 * method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String fileUpload(HttpServletRequest req,
	 * HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws
	 * Exception { JsonObject json = new JsonObject(); PrintWriter printWriter =
	 * null; OutputStream out = null; MultipartFile file =
	 * multiFile.getFile("upload"); if(file != null){ if(file.getSize() > 0 &&
	 * StringUtils.isNotBlank(file.getName())){
	 * if(file.getContentType().toLowerCase().startsWith("image/")){ try{ String
	 * fileName = file.getName(); System.out.println("fileName " + fileName); byte[]
	 * bytes = file.getBytes(); String uploadPath =
	 * req.getServletContext().getRealPath("/resources/upload"); File uploadFile =
	 * new File(uploadPath); if(!uploadFile.exists()){ uploadFile.mkdirs(); }
	 * 
	 * fileName = UUID.randomUUID().toString(); uploadPath = uploadPath + "/" +
	 * fileName; out = new FileOutputStream(new File(uploadPath)); out.write(bytes);
	 * 
	 * printWriter = resp.getWriter(); resp.setContentType("text/html"); String
	 * fileUrl = req.getContextPath() + "/resources/upload/" + fileName;
	 * 
	 * // json 데이터로 등록 // {"uploaded" : 1, "fileName" : "test.jpg", "url" :
	 * "/img/test.jpg"} // 이런 형태로 리턴이 나가야함. json.addProperty("uploaded", 1);
	 * json.addProperty("fileName", fileName); json.addProperty("url", fileUrl);
	 * 
	 * printWriter.println(json); }catch(IOException e){ e.printStackTrace();
	 * }finally{ if(out != null){ out.close(); } if(printWriter != null){
	 * printWriter.close(); } } } } } return null; }
	 */
	@RequestMapping("/humorBoard/humorView.do")
	public String selectOneBoard(@RequestParam("bno") int humorbNo,
			Model model) {
		System.out.println("humorbNo : " + humorbNo);
		// System.out.println("humorWriter : " + humorWriter);
		humorBoard hb = humorBoardService.selectOne(humorbNo);
		// hb.setHumorWriter(humorWriter);
		System.out.println("hb : " + hb);

		int humorBoardCount = humorBoardService.readCount(humorbNo);

		hb.setHumorBoardCount(humorBoardCount);

		System.out.println("조회수 확인 : " + humorBoardCount);
		model.addAttribute("humorBoard", hb);

		return "humorBoard/humorView";
	}

	@RequestMapping("/humorBoard/humorUpdateView.do")
	public String humorUpdateView(@RequestParam int humorbNo, Model model) {

		model.addAttribute("humorBoard", humorBoardService.selectOne(humorbNo));

		return "humorBoard/humorUpdateView";
	}

	@RequestMapping("/humorBoard/humorUpdate.do")
	public String humorUpdate(humorBoard humorboard, Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles, HttpServletRequest request,
			@RequestParam String humorTitle, @RequestParam String humorContent) {

		int humorbNo = humorboard.getHumorbNo();

		humorBoard originBoard = humorBoardService.selectOne(humorbNo);

		System.out.println(originBoard);

		originBoard.setHumorTitle(humorTitle);
		originBoard.setHumorContent(humorContent);
		// originBoard.setHumorContent(imgTag);

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");

		int result = humorBoardService.updateBoard(originBoard);

		String msg = "";
		String loc = "/humorBoard/humorBoardList.do";

		if (result > 0) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/humorBoard/humorDelete.do")
	public String humorDelete(int humorbNo, Model model, HttpSession session) {

		String savePath = session.getServletContext().getRealPath("/resources/upload");

		humorBoard originBoard = humorBoardService.selectOne(humorbNo);

		int result = humorBoardService.deleteBoard(humorbNo);

		String msg = "";
		String loc = "/humorBoard/humorBoardList.do";

		if (result > 0) {

			String mainImg = originBoard.getHumorContent();
			Pattern p = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			Matcher m = p.matcher(mainImg);
			// ([2*][0-9a-z])\w+
			String imgTag = null;

			if (m.find()) {
				imgTag = m.group(0);
				System.out.println(
						"imgTag : " + imgTag.substring(imgTag.indexOf("upload/") + 7, imgTag.indexOf("\" style")));

				String imageName = imgTag.substring(imgTag.indexOf("upload/") + 7, imgTag.indexOf("\" style"));

				new File(savePath + "/" + imageName).delete();

			}

			msg = "게시글 삭제 성공!";

		} else {
			msg = "게시글 삭제 실패!";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/humorBoard/cmtWrite.do")
	@ResponseBody
	public int insertCmt(@RequestParam int bno, @RequestParam String cmtContent, HttpSession session) {
		Comment cmt = new Comment();
		cmt.setHumorBno(bno);
		cmt.setCmtContent(cmtContent);
		Member member = (Member) session.getAttribute("member");
		cmt.setNickName(member.getNickName());
		cmt.setUserNo(member.getUserNo());

		return humorBoardService.insertComment(cmt);

	}

	@RequestMapping(value = "/humorBoard/cmtList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity selectCmtList(@RequestParam int bno, HttpSession session) {
		HttpHeaders responseHeaders = new HttpHeaders();
		Comment cmt = new Comment();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		cmt.setHumorBno(bno);
		List<Comment> commentList = humorBoardService.selectCmtList(cmt);

		if (commentList.size() > 0) {
			for (int i = 0; i < commentList.size(); i++) {
				HashMap hm = new HashMap();

				hm.put("comment", commentList.get(i).getCmtContent());
				hm.put("writer", commentList.get(i).getNickName());
				hm.put("date", commentList.get(i).getCmtDate());
                hm.put("cno", commentList.get(i).getCmtNo());
                hm.put("uno", commentList.get(i).getUserNo());
                
				hmlist.add(hm);
				System.out.println("hm : " + hm);
			}

		}

		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);

	}
	
	@RequestMapping("/humorBoard/hcommentDelete.do")
	   public String hcommentDelete(@RequestParam int cno , Model model, HttpSession session) {
	      
	      System.out.println("cno : " + cno);
	      
	      int result = humorBoardService.deleteCmt(cno);
	      
	      
	      String msg = "";
	      String loc = "";
	      
	      if(result > 0) {
	         msg = "댓글 삭제 성공!";
	      } else {
	         msg = "댓글 삭제 실패!";
	      }
	      
	      model.addAttribute("msg", msg)
	           .addAttribute("loc", loc);
	      
	      return "common/msg";
	   }
		
}

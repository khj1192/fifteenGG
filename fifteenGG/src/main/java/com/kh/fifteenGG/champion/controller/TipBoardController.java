package com.kh.fifteenGG.champion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fifteenGG.champion.model.service.TipBoardService;
import com.kh.fifteenGG.champion.model.vo.TipBoard;
import com.kh.fifteenGG.common.util.Utils;
import com.kh.fifteenGG.member.model.vo.Member;

@Controller
public class TipBoardController {
		
	@Autowired
	TipBoardService tipBoardService;
	

	@RequestMapping("/champion/tipBoard.do")
	public String tipBoard(TipBoard tipBoard, Model model, HttpSession httpSession,
			 				@RequestParam String championName ) {
		
		Member member = (Member) httpSession.getAttribute("member");
		
		
		tipBoard.setTipWriter(member.getUserNo());
		 tipBoard.setChampionName(championName); 
		
		/* System.out.println(tipBoard); */
		
		int result = tipBoardService.insertTipBoard(tipBoard);
		
		String msg = "";
		String loc="/champion/championDetail.do?name="+championName;
		if(result > 0) {
			msg="게시글이 등록되었습니다!";
		} else {
			msg="게시글을 다시 작성해주세요!";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}

	@RequestMapping("/champion/tipBoardList.do")
	@ResponseBody
	public Map<String, Object> tipBoardList(Model model, HttpSession session, String championName,
								@RequestParam(value="cPage", 
										   	  required=false, 
										   	  defaultValue="1") int cPage) {
		HashMap<String, Object> map = new HashMap();
		
		// 한 페이지당 보여줄 게시글 수
		int numPerPage = 10;
		
		// 페이지 처리된 리스트 가져오기
		
		List<Map<String,String>> list = tipBoardService.selectList(championName, cPage, numPerPage);
		
		// 챔피언 별 전체 게시글 수 가져오기
		int totalContents = tipBoardService.selectTotalContents(championName);
		
		// 페이지 계산 HTML을 추가하기
		String pageBar 
		  = Utils.getPageBar(totalContents, cPage, numPerPage, "championDetail.do?name="+championName);
		
		System.out.println("list 확인 : " + list);
		/*
		model.addAttribute("list", list)
        .addAttribute("totalContents", totalContents)
        .addAttribute("numPerPage", numPerPage)
        .addAttribute("pageBar", pageBar);
        */
		map.put("list", list);
		map.put("totalContents", totalContents);
		map.put("numPerPage", numPerPage);
		map.put("pageBar", pageBar);
        
		return map;
	}
	
	@RequestMapping("/champion/tipBoardView.do")
	public String selectOneTipBoard(@RequestParam("no") int tipBno, Model model, HttpSession session,
									@RequestParam("name") String name) {
		
		
		Member member = (Member) session.getAttribute("member");
		
		
		
		TipBoard b = tipBoardService.selectOne(tipBno);
		
		
			int tipreadCount = b.getTipreadCount();
			if(b != null) {
			
			 tipreadCount = tipBoardService.readCount(tipBno);
			 
			}
			
			b.setTipreadCount(tipreadCount);
		/* System.out.println("tipreadCount :" + tipreadCount); */
		
		model.addAttribute("tipboard", b)
			 .addAttribute("name", name);
		/*
		 * System.out.println("view페이지:" +b);
		 *  System.out.println(member);
		 */

		return "champion/tipBoardView";
	}
	
	@RequestMapping("/champion/tipBoardDelete.do")
	public String deleteOneTipBoard(int tipBno, Model model, HttpSession session) {
		
		
		
		int result = tipBoardService.deleteTipBoard(tipBno);
		
		String msg = "";
		String loc = "/";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/msg";
	}

	
}
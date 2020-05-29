package com.kh.fifteenGG.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fifteenGG.member.model.service.MemberService;
import com.kh.fifteenGG.member.model.vo.Member;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	// 암호화 용
	// web.xml에 설정해둔 context 파일을 연동 시켜야 함
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
    @RequestMapping("/member/joinMemberView.do")
    public String joinMemberView(){

        return "member/joinMember";
    }
    
    @RequestMapping("/member/loginMemberView.do")
    public String loginMemberView() {
    	
    	
    	return "member/loginMember";
    }
    
    @RequestMapping("/member/updateMemberView.do")
    public String updateMemberView() {
    	
    	return "member/updateMemberView";
    }
    
    // 이메일 인증 입력 페이지 맵핑 메소드
    @RequestMapping("/member/email.do")
    public String email() {
    	return "member/email";
    }
    
    // 이메일 컨트롤러 작성 부분 ---------------
    @Inject // 서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
    MemberService memberservice; // 서비스를 호출하기 위해 의존성을 주입
    
    // 로깅을 위한 변수
    private static final Logger logger =
    LoggerFactory.getLogger(MemberController.class);
    private static final String String = null;
    
    // mailSending코드
    @RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST)
    public String mailSending(HttpServletRequest request, String e_mail, 
    						  HttpSession session, Model model) throws IOException{
    	
    	
    	Random r = new Random();
    	int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분(난수)
    	
    	String setfrom = "fifteengg@gmail.com";
    	String tomail = e_mail; // 받는 사람 이메일
    	String title = "[15.GG]회원가입 인증 이메일 입니다."; // 제목
    	String content = 
    	
    	System.getProperty("line.separator")+
    	
    	"안녕하세요. 회원님 저희 15.GG를 방문해주셔서 감사합니다"
    	
    	+System.getProperty("line.separator")+
    	
    	 System.getProperty("line.separator")+
    	    
         " 인증번호는 " +dice+ " 입니다. "
         
         +System.getProperty("line.separator")+
         
         System.getProperty("line.separator")+
         
         "받으신 인증번호를 홈페이지에 입력해주세요."; // 내용
    	
    	try {
    		MimeMessage message = mailSender.createMimeMessage();
    		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    		
    		messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정상작동을 안함
    		messageHelper.setTo(tomail); // 받는 사람 이메일
    		messageHelper.setSubject(title); // 메일 제목은 생략이 가능하다
    		messageHelper.setText(content); // 메일 내용
    		
    		mailSender.send(message);
    		
    	}catch (Exception e){
    		System.out.println(e);
    	}
    	String loc = "/member/email_injeung.do";
    	String msg = "이메일이 발송되었습니다. 인증번호를 입력해주세요.";
    	session.setAttribute("dice", dice);
    	session.setAttribute("e_mail", e_mail);
  	
    	model.addAttribute("loc", loc).addAttribute("msg",msg);
    	
    	return "common/msg";
    }
    
    @RequestMapping("/member/email_injeung.do")
    public String email_injeung() {
    	
    	return "member/email_injeung";
    }
    
    // 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    // 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원 가입 페이지로 넘어가고,
    // 틀리면 다시 원래 페이지로 돌아오는 메소드
    @RequestMapping(value = "/member/join_injeung.do/{dice}", method = RequestMethod.POST)
    public String join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals, Model model) throws IOException{
    	
    	
    	System.out.println("마지막 : email_injeung : " + email_injeung);
    	
    	System.out.println("마지막 : dice : " + dice);
    	
    	model.addAttribute("e_mail_ack", true);
    	
    	return "member/joinMember";
    }
   

    @RequestMapping("/member/memberJoin.do")
    public String memberJoin(Member member, Model model) {

		String password = member.getPassword();
		System.out.println("암호화 전 비밀번호 : " + password);

		String encPassword = bCryptPasswordEncoder.encode(password);

		System.out.println("암호화 후 비밀번호 : " + encPassword);

		member.setPassword(encPassword);

    int result = memberService.insertMember(member);
    
    String msg = "";
    String loc = "/";
    
    if(result > 0) {
    	msg = "회원가입 성공";
    	loc = "/";
    }else {
    	msg = "회원가입 실패";
    	loc = "/";
    }
    
    model.addAttribute("msg", msg);
    model.addAttribute("loc", loc);
    model.addAttribute("member", member);
    
    
    return "common/msg";
    }
    
    @RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(Member member, HttpSession httpSession, Model model){
		ModelAndView mav = new ModelAndView();

		try {

			Member m = memberService.selectOneMember(member);

			String msg = "";
			String loc = "/";

			// bCryptPasswordEncoder.macthes() 함수를 이용하여
			// 로그인에서 입력한 비밀번호와 DB에 저장된 암호회된 비밀번호가 일치하는지 확인
			if( m != null && bCryptPasswordEncoder.matches(member.getPassword(), m.getPassword())) {
				msg = "로그인 성공";
				httpSession.setAttribute("member", m);
				mav.addObject("member", m);
			} else if (m != null) {
				msg = "비밀번호가 일치하지 않습니다.";
			} else {
				msg = "로그인 실패";
			}

			mav.addObject("msg", msg);
			mav.addObject("loc", loc);

			mav.setViewName("common/msg");

		}catch (Exception e){
			e.printStackTrace();
		}

		return mav;
	}
    
    @RequestMapping("/member/memberLogout.do")
    public String memberLogout(HttpSession session) {
    	
    	session.invalidate();
    	
    	return "redirect:/";
    }
    
    @RequestMapping("/member/memberUpdate.do")
    public String memberUpdate(HttpSession session, Member member, Model model) {
    	System.out.println(member);

		String password = member.getPassword();
		System.out.println("암호화 전 비밀번호 : " + password);

		String encPassword = bCryptPasswordEncoder.encode(password);

		System.out.println("암호화 후 비밀번호 : " + encPassword);

		member.setPassword(encPassword);
    	
    	int result = memberService.updateMember(member);
    	
    	String msg = "";
    	String loc = "/";
    	
    	if(result > 0) {
    		msg = "회원 정보 수정 성공";
			session.invalidate();
    	}else {
    		msg = "회원 정보 수정 실패";
    	}
    	
    	model.addAttribute("msg", msg);
    	model.addAttribute("loc", loc);
    	
    	return "common/msg";
    }
    
    
	
	  @RequestMapping("/member/memberDelete.do") public String
	  memberDelete(HttpSession session, Model model) {
	  
	  String email = ((Member)session.getAttribute("member")).getEmail();
	  
	  int result = memberService.deleteMember(email);
	  
	  String msg = ""; String loc = "/";
	  
	  if(result > 0) { msg = "회원 탈퇴 되었습니다."; loc = "/"; session.invalidate();
	  
	  } else { msg = "회원 탈퇴 실패"; }
	  
	  model.addAttribute("msg", msg) 
	  	   .addAttribute("loc", loc);
	  
	  return "common/msg"; 
	  
	  }
	
	  @RequestMapping("/member/checkIdDuplicate.do")
	  @ResponseBody 
	  public Map<String, Object> checkIdDuplicate(@RequestParam String nickName){
	  
	  boolean isUsable = memberService.checkIdDuplicate(nickName) == 0 ? true : false;
	  
	  Map<String, Object> map = new HashMap<String, Object>(); map.put("isUsable",
	  isUsable);
	  
	  return map; }
	 
}

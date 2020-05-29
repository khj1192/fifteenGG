package com.kh.fifteenGG.websocket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebsocketController {

	@RequestMapping("chatting.do")
	public String chatting(Model model, HttpServletRequest request) {
		
		model.addAttribute("host",request.getRemoteAddr());
		
		return "chat/chattingView";
	}
}

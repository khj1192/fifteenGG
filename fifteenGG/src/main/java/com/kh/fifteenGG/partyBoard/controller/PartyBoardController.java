package com.kh.fifteenGG.partyBoard.controller;


import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.fifteenGG.partyBoard.model.service.PartyBoardService;
import com.kh.fifteenGG.partyBoard.model.vo.PartyBoard;


@Controller
/* @RequestMapping("ajax") */
public class PartyBoardController {
	
	@Autowired 
	PartyBoardService partyBoardService;
	
	
	@RequestMapping("/partyBoard/partyBoardList.do")
	public String partyBoardList(PartyBoard partyBoard, Model model){
			
		List<PartyBoard> list = partyBoardService.partyBoardList(partyBoard);
        model.addAttribute("list", list); 
        int totalContent = partyBoardService.totalCountContent();
		
		return "partyBoard/partyBoard";
	}
	
	
	@RequestMapping("/partyBoard/indexPartyBoardList.do")
	public String indexPartyBoardList(PartyBoard partyBoard, Model model){
		
		List<PartyBoard> list = partyBoardService.indexPartyBoardList(partyBoard);
		model.addAttribute("list", list); 
		
		return "partyBoard/indexPartyBoard";
	}

	 
	@RequestMapping("/partyBoard/partyBoardInsert.do")
	public String insertPartyBoard(PartyBoard partyBoard, Model model) {
		
		int result = partyBoardService.insertParty(partyBoard);	
		
		String msg = "";
		String loc = "";
		
		System.out.println(result);
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);		
		return "redirect:/partyBoard/partyBoardList.do";
		
		
	}

	 
	@RequestMapping("/partyBoard/searchList.do")
	public String searchList(PartyBoard partyBoard , Model model ) {
		
		/*
		 * String pbRanktype = partyBoard.getPbRanktype(); String pbTier =
		 * partyBoard.getPbTier(); String pbPosition = partyBoard.getPbPosition();
		 */
		
		List<PartyBoard> searchList = partyBoardService.searchList(partyBoard);
		
		System.out.println("searchList : " + searchList);
		model.addAttribute("searchList", searchList);
		
		
		return "partyBoard/partySearchBoard";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

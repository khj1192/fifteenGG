package com.kh.fifteenGG.statisticsBoard.Contorller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.fifteenGG.statisticsBoard.model.service.StatisticsBoardService;
import com.kh.fifteenGG.statisticsBoard.model.vo.DataTablePackageBoard;
import com.kh.fifteenGG.statisticsBoard.model.vo.ObjectPercentage;


@Controller
public class StatisticsBoardController {
	
	@Autowired
	StatisticsBoardService statisticsBoardService;


	   @RequestMapping("/statisticsBoard/objectWinPercentageView.do")
	   public String objectWinPercentageView(ObjectPercentage objectPercentage, Model model) {
	      
	      List<ObjectPercentage> objectWinPercentage = statisticsBoardService.objectWinPercentage(objectPercentage);
	      System.out.println("objectWinPercentage 확인 : " + objectWinPercentage);
	      System.out.println("objectWinPercentage 타입 확인 : " + objectWinPercentage.getClass().getName());
	      System.out.println("objectWinPercentage 타입 확인 : " + objectWinPercentage.get(0));
	   
	      model.addAttribute("objectWinPercentage", objectWinPercentage.get(0));

	      return "statisticsBoard/objectPercentage";
	   }
	
	@RequestMapping("/statisticsBoard/dataTablePackageBoardView.do")
	public String dataTablePackageBoardView(DataTablePackageBoard dataTablePackageBoard, Model model) {
		List<DataTablePackageBoard> dataTablePackage = statisticsBoardService.dataTablePackage(dataTablePackageBoard);
		System.out.println("dataTablePackage 확인 : " + dataTablePackage);
		model.addAttribute("dataTablePackage", dataTablePackage);
		
		return "statisticsBoard/dataTablePackageBoard";
	}
	
	
}

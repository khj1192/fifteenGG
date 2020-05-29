package com.kh.fifteenGG.champion.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.fifteenGG.champion.model.service.PercentageService;
import com.kh.fifteenGG.champion.model.vo.Percentage;
import com.kh.fifteenGG.common.apiKey.ApiKey;
import com.merakianalytics.orianna.types.core.champion.ChampionRotation;
import com.merakianalytics.orianna.types.dto.staticdata.ChampionList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.fifteenGG.champion.model.service.DetailPercentageService;
import com.kh.fifteenGG.champion.model.service.PercentageService;
import com.kh.fifteenGG.champion.model.service.TipBoardService;
import com.kh.fifteenGG.champion.model.vo.ChampionRunRC;
import com.kh.fifteenGG.champion.model.vo.ChampionSpellRC;
import com.kh.fifteenGG.champion.model.vo.Percentage;
import com.kh.fifteenGG.champion.model.vo.TipBoard;
import com.kh.fifteenGG.common.util.Utils;
import com.merakianalytics.orianna.Orianna;
import com.merakianalytics.orianna.types.common.Region;
import com.merakianalytics.orianna.types.core.staticdata.Champion;
import com.merakianalytics.orianna.types.core.staticdata.Champions;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChampionController {

    @Autowired
    TipBoardService tipBoardService;

    @Autowired
    PercentageService percentageService;

    @Autowired
    DetailPercentageService detailpercentageService;

    private String apiKey = new ApiKey().getKey();

    @RequestMapping("/champion/championList.do")
    public String championList(Model model , Percentage percentage) {

        Orianna.loadConfiguration("config.json");
        Orianna.setRiotAPIKey(apiKey);

        Champions champions = Orianna.getChampions();

        List<Percentage> topFiveList = percentageService.winPercentTopFive();
        List<Percentage> topTenList = percentageService.winPercentTopTen();
        List<Percentage> jungleFiveList = percentageService.winPercentJungleFive();
        List<Percentage> jungleTenList = percentageService.winPercentJungleTen();
        List<Percentage> midFiveList = percentageService.winPercentMidFive();
        List<Percentage> midTenList = percentageService.winPercentMidTen();
        List<Percentage> adcFiveList = percentageService.winPercentAdcFive();
        List<Percentage> adcTenList = percentageService.winPercentAdcTen();
        List<Percentage> supportFiveList = percentageService.winPercentSupportFive();
        List<Percentage> supportTenList = percentageService.winPercentSupportTen();


        List<Percentage> champAll = percentageService.champAll();
        List<Percentage> supportAll = percentageService.supportAll();
        List<Percentage> adcAll = percentageService.adcAll();
        List<Percentage> topAll = percentageService.topAll();
        List<Percentage> midAll = percentageService.midAll();
        List<Percentage> jungleAll = percentageService.jungleAll();

        System.out.println("topList 확인 : " + topFiveList);

        model.addAttribute("champions", champions)
             .addAttribute("topFiveList", topFiveList)
             .addAttribute("topTenList", topTenList)
             .addAttribute("jungleFiveList", jungleFiveList)
             .addAttribute("jungleTenList", jungleTenList)
             .addAttribute("midFiveList", midFiveList)
             .addAttribute("midTenList", midTenList)
             .addAttribute("adcFiveList", adcFiveList)
             .addAttribute("adcTenList", adcTenList)
             .addAttribute("supportFiveList", supportFiveList)
             .addAttribute("supportTenList", supportTenList)
             .addAttribute("supportAll", supportAll)
             .addAttribute("adcAll", adcAll)
             .addAttribute("topAll", topAll)
             .addAttribute("midAll", midAll)
             .addAttribute("jungleAll", jungleAll)
        	 .addAttribute("champAll", champAll);



        // 정보 확인용
        /* System.out.println(champions); */

        return "champion/championList";
    }

    @RequestMapping("/champion/championDetail.do")
    public String championDetail(Model model ,@RequestParam String name, HttpSession session,
                                 TipBoard tipBoard , HttpSession httpSession
    ) {

        Orianna.loadConfiguration("config.json");
        Orianna.setRiotAPIKey(apiKey);

        Champions champions = Orianna.getChampions();
        Champion champion = Orianna.championNamed(name).get();

		/*System.out.println(champion); */
        /* model.addAttribute("champions", champions); */
        /* model.addAttribute("champion", champion); */
        session.setAttribute("champion", champion);
		/* System.out.println("name : " + name); */

       // 팁게시판 부분
        TipBoard tipboard = (TipBoard)httpSession.getAttribute("tipBoard");

       // 리스트로 불러올 부분
        List<TipBoard> list = tipBoardService.selectMainList(name);

        // 챔피언 스펠 승률 & 픽률
        List<ChampionSpellRC> spellList = detailpercentageService.spellPercentageList(name);

        // 챔피언 룬 승률 & 픽률
        List<ChampionRunRC> RunList = detailpercentageService.runRcList(name);

        // 챔피언 아이템 승률 & 픽률
        List<Object> itemList = detailpercentageService.itemList(name);
        List<Object> shoesList = detailpercentageService.shoesList(name);
        List<Object> startList = detailpercentageService.startList(name);
        // 차트
        List<Object> ChampChartList = detailpercentageService.champChart(name);
        List<Object> benPercent = detailpercentageService.benPerChart(name);


        int totalContents = tipBoardService.selectTotalMainContents(name);

        session.setAttribute("list", list);
        model.addAttribute("spellList",spellList)
        	 .addAttribute("RunList", RunList)
        	 .addAttribute("itemList", itemList)
        	 .addAttribute("shoesList", shoesList)
        	 .addAttribute("startList", startList)
        	 .addAttribute("ChampChartList", ChampChartList)
        	 .addAttribute("benPercent", benPercent);

		/*
		 * // 챔피언 스펠 승률 &픽률 확인 System.out.println("spellList : " + spellList); // 챔피언 룬
		 * 승률 & 픽률 확인 System.out.println("RunList : " + RunList); // 챔피언 아이템 승률 & 픽률 확인
		 * System.out.println("itemList" + itemList);
		 *
		 * System.out.println("shoesList"+ shoesList); // chartList
		 * System.out.println("ChampChartList" + ChampChartList);
		 * System.out.println("benPercent" + benPercent);
		 *
		 * System.out.println("Board List :"+ list);
		 * System.out.println("startList" +startList);
		 */
        return "champion/championDetail";

    }

    @RequestMapping("/champion/freeChampion.do")
    @ResponseBody
    public HashMap<String, Object> freeChampion(Model model){

        Orianna.loadConfiguration("config.json");
        Orianna.setRiotAPIKey(apiKey);

        ChampionRotation rotation = ChampionRotation.withRegion(Region.KOREA).get();

        List<String> freeChampImage = new ArrayList<>();
        List<String> freeChampName = new ArrayList<>();
        HashMap<String, Object> hashMap = new HashMap<>();

        for(Champion champion : rotation.getFreeChampions() ){
            freeChampImage.add(champion.getImage().getFull());
            freeChampName.add(champion.getName());
        }

        hashMap.put("freeChampImage", freeChampImage);
        hashMap.put("freeChampName", freeChampName);

        return hashMap;
    }
}

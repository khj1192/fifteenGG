package com.kh.fifteenGG.search.controller;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.fifteenGG.common.apiKey.ApiKey;
import com.kh.fifteenGG.partyBoard.model.service.PartyBoardService;
import com.kh.fifteenGG.partyBoard.model.vo.PartyBoard;
import com.kh.fifteenGG.search.model.service.SearchService;
import com.kh.fifteenGG.search.model.vo.league.LeagueEntry;
import com.kh.fifteenGG.search.model.vo.match.*;
import com.kh.fifteenGG.search.model.vo.summoner.Summoner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

@Controller
public class SummonerSearch {

    @Autowired
    SearchService searchService;
    @Autowired
    PartyBoardService partyBoardService;

    private String ApiKey = new ApiKey().getKey();

    // 검색 화면
    @RequestMapping("/search/SummonerSearch.do")
    public String SummonerSearch(@RequestParam String summonerName,
                                 @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

        int numPerPage = 5;
        int endPage = numPerPage * cPage;

        String serachName = summonerName.replaceAll(" ","%20");

        int result = 0;

        try {
            // 소환사 정보 뽑아오기
            String urlStr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + serachName + "?api_key=" + ApiKey;

            URL url1 = new URL(urlStr);
            BufferedReader br1 = new BufferedReader(new InputStreamReader(url1.openConnection().getInputStream()));

            String string1 = br1.readLine();

            Gson gson = new Gson();

            Summoner summoner = gson.fromJson(string1, Summoner.class);

            System.out.println(summoner.getName());

            //=====================================================================================================================//

            // 리그 정보 뽑아오기
            String urlstr2 = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + summoner.getId() + "?api_key=" + ApiKey;
            URL url2 = new URL(urlstr2);

            BufferedReader br2 = new BufferedReader(new InputStreamReader(url2.openConnection().getInputStream()));

            String string2 = br2.readLine();

            List<LeagueEntry> leagueEntry = gson.fromJson(string2, new TypeToken<List<LeagueEntry>>() {
            }.getType());

            if(leagueEntry.size() > 0){
                result = searchService.insertLeagueEntry(leagueEntry);
            }

            //=====================================================================================================================//

            // 매치 정보 가져오기

            // 모든 매치 정보수 카운트
//            int totalPage = searchService.totalPageCount(summonerName);

            // 매치 정보 가져오기
//            List map = searchService.selectSummonerMatch(summonerName, cPage, endPage);
//            HashMap<String, Object> myStat = searchService.selectMyStat(summonerName);


            cPage += 1;

            HashMap<String, Object> myStat = searchService.selectMyStat(summonerName);
            model.addAttribute("myStat", myStat);

            System.out.println(myStat);

            // 화면에 전달
            model.addAttribute("cPage", cPage);
            model.addAttribute("summoner", summoner);
            model.addAttribute("leagueEntry", leagueEntry);
//            model.addAttribute("matchViewList", map);
//            model.addAttribute("myStat", myStat);

        } catch (Exception e) {
            e.printStackTrace();
            return "common/errorPage";

        }

        return "summoner/summonerView";

    }

    // 매치 업데이트
    @RequestMapping("/search/UpdateMatch.do")
    public String UpdateMatch(Model model,@RequestParam String accountId, @RequestParam String summonerName){

        System.out.println(accountId);

        int result = 0;
        Gson gson = new Gson();

        try {
            // 매치 리스트 정보 뽑아오기
            String urlStr1 = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?api_key=" + ApiKey;

            URL url1 = new URL(urlStr1);

            BufferedReader br1 = new BufferedReader(new InputStreamReader(url1.openConnection().getInputStream()));

            String string1 = br1.readLine();

            MatchList matchList = gson.fromJson(string1, MatchList.class);

            List<MatchReference> mlist = matchList.getMatches();

            // 매치 상세 정보 저장 반복문
            System.out.println("반복문 시작");

            for (int i = 0; i < 15 ; i++) {

                String urlStr2 = "https://kr.api.riotgames.com/lol/match/v4/matches/" + mlist.get(i).getGameId() + "?api_key=" + ApiKey;

                URL url2 = new URL(urlStr2);
                BufferedReader br2 = new BufferedReader(new InputStreamReader(url2.openConnection().getInputStream()));

                String string2 = br2.readLine();

                Match match = gson.fromJson(string2, Match.class);

                // 타임라인 api 호출 및 저장
                String urlStr3 = "https://kr.api.riotgames.com/lol/match/v4/timelines/by-match/" + mlist.get(i).getGameId() + "?api_key=" + ApiKey;

                URL url3 = new URL(urlStr3);
                BufferedReader br3 = new BufferedReader(new InputStreamReader(url3.openConnection().getInputStream()));

                String string3 = br3.readLine();

                MatchTimeline matchTimeline = gson.fromJson(string3, MatchTimeline.class);

                // 매치타임라인 중 MatchFrame 배열로 담기
                List<MatchFrame> mfList = matchTimeline.getFrames();

                // match 저장 서비스 연결
                result = searchService.insertMatch(match, mfList);

                System.out.println("저장 확인 : " + result);

            }

            System.out.println("반복문 끝");

        }catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("summonerName", summonerName);

        // 업데이트 후 다시 리다이렉트로 SummonerSearch 컨트롤러로 전송
        return "redirect:/search/SummonerSearch.do";
    }


    // ajax 매치 조회
    @RequestMapping("/search/MatchSearch.do")
    @ResponseBody
    public HashMap<String, Object> MatchSearch(@RequestParam String summonerName,
                                               @RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
                                               @RequestParam String tierInfo ){

        HashMap<String, Object> hashMap = new HashMap<>();

        System.out.println("ajax 실행 확인 컨트롤러");

        int numPerPage = 5;
        int endPage = numPerPage * ( cPage + 1) ;

        String serachName = summonerName.replaceAll(" ","%20");

        cPage += 1;

        // 매치 정보 가져오기
        List<Object> list = searchService.selectSummonerMatch(summonerName, cPage, endPage);

        System.out.println("내 티어 정보 시작 : " + tierInfo );

        PartyBoard partyBoard = partyBoardService.SelectRcParty(tierInfo);

        System.out.println("추천파티정보 : "+partyBoard);

        System.out.println("matchViewList" + list);

        hashMap.put("partyBoard", partyBoard);
        hashMap.put("matchViewList", list);
        hashMap.put("cPage", cPage);

        return hashMap;
    }

}

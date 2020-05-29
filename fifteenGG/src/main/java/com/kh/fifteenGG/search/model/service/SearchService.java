package com.kh.fifteenGG.search.model.service;

import com.kh.fifteenGG.search.model.dao.SearchDAO;
import com.kh.fifteenGG.search.model.vo.league.LeagueEntry;
import com.kh.fifteenGG.search.model.vo.match.*;
import com.kh.fifteenGG.search.model.vo.view.MatchKDA;
import com.kh.fifteenGG.search.model.vo.view.TeamView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SearchService {

    @Autowired
    SearchDAO searchDAO;

    // 매치 업데이트
    public int insertMatch(Match match, List<MatchFrame> mfList) {
        int result = 0;
        HashMap<String, Object> hmap = new HashMap<>();

        // 기존 매치 정보와 비교
        hmap.put("gameId", match.getGameId());

        int checkMatch = searchDAO.checkMatch(hmap);

        // 기존 매치가 없다면
        if(checkMatch == 0){
            // 먼저 match 정보를 db에 저장.
            System.out.println("매치정보 업데이트 시작.");

            result = searchDAO.insertMatch(match);

            // 매치가 성공적으로 저장되었다면
            if(result > 0){
                // teamstat 저장 시작
                List<TeamStats> teamStats = match.getTeams();

                for(TeamStats t : teamStats){

                    // 팀스텟 저장
                    t.setGameId(match.getGameId());
                    result = searchDAO.insertTeamStats(t);

                    // 팀 밴 저장
                    List<TeamBans> teamBans = t.getBans();
                    for(TeamBans tb : teamBans){
                        tb.setGameId(match.getGameId());
                        tb.setTeamId(t.getTeamId());
                        result = searchDAO.insertTeamBans(tb);
                    }

                }
                // teamstat 저장 끝

                // participantIdentities 저장 시작
                List<ParticipantIdentity> PiList = match.getParticipantIdentities();

                for(ParticipantIdentity p : PiList){

                    // ParticipantIdentity 저장
                    p.setGameId(match.getGameId());
                    result = searchDAO.insertParticipantIdentity(p);

                    //player 저장
                    Player player = p.getPlayer();
                    player.setGameId(match.getGameId());
                    player.setParticipantId(p.getParticipantId());
                    result = searchDAO.insertPlayer(player);

                }
                // participantIdentities 저장 끝

                // participants 저장 시작
                List<Participant> participants = match.getParticipants();

                for(Participant participant : participants){
                    // participant 저장
                    participant.setGameId(match.getGameId());
                    result = searchDAO.insertParticipant(participant);

                    // participantTimeline 저장

                    ParticipantTimeline participantTimeline = participant.getTimeline();
                    participantTimeline.setGameId(match.getGameId());
                    result = searchDAO.insertParticipantTimeline(participantTimeline);

                    // participantStats 저장

                    // 저장전에 포지션을 확인하여 넣어준다.

                    ParticipantStats participantStats = participant.getStats();
                    participantStats.setGameId(match.getGameId());

                    // 포지션 처리
                    if(participantTimeline.getLane().equals("TOP")){
                        System.out.println(participantTimeline.getLane());
                        participantStats.setPosition(1);
                    }else if(participantTimeline.getLane().equals("MIDDLE")){
                        participantStats.setPosition(2);
                    }else if(participantTimeline.getLane().equals("JUNGLE")){
                        participantStats.setPosition(3);
                    }else if(participantTimeline.getLane().equals("BOTTOM") && participantTimeline.getRole().equals("DUO_CARRY")){
                        participantStats.setPosition(4);
                    }else if(participantTimeline.getLane().equals("BOTTOM") && participantTimeline.getRole().equals("DUO_SUPPORT")){
                        participantStats.setPosition(5);
                    }else {
                        participantStats.setPosition(6);
                    }

                    // 아이탬 정렬
                    ArrayList<Integer> itemList = new ArrayList();
                    itemList.add(participantStats.getItem0());
                    itemList.add(participantStats.getItem1());
                    itemList.add(participantStats.getItem2());
                    itemList.add(participantStats.getItem3());
                    itemList.add(participantStats.getItem4());
                    itemList.add(participantStats.getItem5());
                    Collections.sort(itemList);
                    Collections.reverse(itemList);
                    participantStats.setItem0(itemList.get(0));
                    participantStats.setItem1(itemList.get(1));
                    participantStats.setItem2(itemList.get(2));
                    participantStats.setItem3(itemList.get(3));
                    participantStats.setItem4(itemList.get(4));
                    participantStats.setItem5(itemList.get(5));

                    result = searchDAO.insertParticipantStats(participantStats);

                }

                // 좌표 저장
                for(MatchFrame matchFrame : mfList){
                    matchFrame.setGameId(match.getGameId());

                    Map<Integer, MatchParticipantFrame> matchParticipantFrame = matchFrame.getParticipantFrames();
                    for(int j = 1; j <= matchParticipantFrame.size() ; j++){
                        MatchPosition position = matchParticipantFrame.get(j).getPosition();

                        if(position != null){
                            position.setGameId(match.getGameId());
                            position.setTimestamp(matchFrame.getTimestamp());
                            position.setParticipantId(matchParticipantFrame.get(j).getParticipantId());

                            result = searchDAO.insertTimeLine(position);

                        }
                    }
                }

            } // 저장 끝

        }else {
            System.out.println("이미 존재하는 매치 입니다.");
        }

        return result;
    }

    // 매치 정보 불러와서 화면에 출력용 서비스
    public List<Object> selectSummonerMatch(String summonerName, int cPage, int endPage) {

        List<Object> list = new ArrayList<>();


        List<String> matchList = searchDAO.selectMatchList(summonerName, cPage, endPage);

        if(matchList.size() > 0){
            for(int i = 0 ; i < matchList.size() ; i++){
                String gameid = matchList.get(i);

                // 팀
                List<TeamView> team = searchDAO.selectTeam(gameid);

                list.add(team);

            }
        }

        return list;

    }

    public int insertLeagueEntry(List<LeagueEntry> leagueEntry) {

        int result = 0;

        for(int i = 0 ; i < leagueEntry.size(); i++ ){

            result = searchDAO.deleteLeagueEntry(leagueEntry.get(i).getSummonerName());

            result = searchDAO.insertLeagueEntry(leagueEntry.get(i));

        }

        return result;
    }

    // 검색한 놈 정보
    public HashMap<String, Object> selectMyStat(String summonerName) {

        HashMap<String, Object> myStat = new HashMap<>();
        int qualityPlay = 0;
        int trollPlay = 0;
        int totalCS = 0;
        int totalDuration = 0;
        int totalWin1 = 0;
        int totalWin0 = 0;
        int totalKDA = 0;
        List<MatchKDA> list  = searchDAO.selectMyStat(summonerName);

        System.out.println("myStat 확인 :" + list);

        for(MatchKDA m : list) {
            totalCS += m.getCs();
            totalDuration += m.getGameDuration();
            totalKDA += m.getKda();

            if(m.getWin() == 1) {
                totalWin1 += m.getWin();
            } else if (m.getWin() == 0) {
                totalWin0 += 1;
            }


            if( m.getKda() > 2.5) {
                qualityPlay += 1;
            }else if(m.getKda() < 1 && m.getKda() > 0 ) {
                trollPlay += 1;
            }else if (m.getKda() == 0) {
                qualityPlay += 1;
            }

        }

        myStat.put("list", list);
        myStat.put("qualityPlay", qualityPlay);
        myStat.put("trollPlay", trollPlay);
        myStat.put("totalCS", totalCS);
        myStat.put("totalDuration", totalDuration);
        myStat.put("totalWin1", totalWin1);
        myStat.put("totalWin0", totalWin0);
        myStat.put("totalKDA", totalKDA);

        // 내 게임 비율 , 모스트 챔프
        List<Object> list1 = searchDAO.selectMostChamp(summonerName);
        List<Object> list2 = searchDAO.selectMostQueueId(summonerName);
        List<Object> list3 = searchDAO.selectMostPosition(summonerName);

        myStat.put("MostChamp", list1);
        myStat.put("MostQueue", list2);
        myStat.put("MostPosition", list3);


        return myStat;
    }
}

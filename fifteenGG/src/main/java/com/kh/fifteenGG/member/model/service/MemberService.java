package com.kh.fifteenGG.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fifteenGG.member.model.dao.MemberDAO;
import com.kh.fifteenGG.member.model.dao.MemberDAO;
import com.kh.fifteenGG.member.model.vo.Member;

@Service
public class MemberService {


    @Autowired
    MemberDAO memberDAO;


    public int insertMember(Member member) {
        return memberDAO.insertMember(member);
    }


    public Member selectOneMember(Member member) {
        return memberDAO.selectOneMember(member);
    }


    public int updateMember(Member member) {
        return memberDAO.updateMember(member);
    }


    public int deleteMember(String email) {
        return memberDAO.deleteMember(email);
    }


    public int checkIdDuplicate(String nickName) {

        HashMap<String, Object> hmap = new HashMap();

        hmap.put("nickName", nickName);

        return memberDAO.checkIdDuplicate(hmap);

    }


}

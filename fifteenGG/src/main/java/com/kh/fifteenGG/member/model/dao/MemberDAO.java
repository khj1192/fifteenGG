package com.kh.fifteenGG.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fifteenGG.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertMember(Member member) {
		return sqlSession.insert("member-mapper.insertMember", member);
	}

	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member-mapper.selectOneMember", member);
	}

	public int updateMember(Member member) {
		return sqlSession.update("member-mapper.updateMember", member);
	}

	
	public int deleteMember(String email) { 
		return sqlSession.delete("member-mapper.deleteMember", email); 
	
	}

	
	 public int checkIdDuplicate(HashMap<String, Object> hmap) {
	 sqlSession.selectOne("member-mapper.checkIdDuplicate", hmap);
	 
	 return (Integer)hmap.get("result"); }
	 


}

package com.mvc.persitence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mvc.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sql;
	
	//mapper
	private static String namespace = "com.mappers.memberMapper";
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception{
		sql.insert(namespace + ".signup", vo);
	}
	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception{
		return sql.selectOne(namespace + ".signin", vo);
	}
}

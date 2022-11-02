package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(MemberDTO dto) {

		SqlSession session = sqlSessionFactory.openSession(true);
		System.out.println(dto.getM_Id());
		int row = session.insert("join", dto);
		session.close();

		return row;

	}

	public MemberDTO login(MemberDTO dto) {
		System.out.println("로그인성공");
		SqlSession session = sqlSessionFactory.openSession(true);

		MemberDTO info = session.selectOne("login", dto); // 받아온 객체가 MemberDTO 타입으로 sql 문장에서 id가 "login" 문장을 실행한다.
		session.close();

		return info;
	}

}
package com.yg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.dto.MemberDto;
@Repository
public class MemberDaoImpl implements MemberDao {
	//@Autowired
	private SqlSession sqlSession;
	
	public MemberDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insert(MemberDto dto) {
		sqlSession.insert("com.yg.mapper.MemberMapper.insertMember", dto);
	}

	@Override
	public Map<String, Object> select(MemberDto dto) {
		Map<String, Object> map = null;
		try {
			map = sqlSession.selectOne("com.yg.mapper.MemberMapper.selectMember", dto);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		return map;
	}

	@Override
	public void delete(int member_id) {
		sqlSession.delete("com.yg.mapper.MemberMapper.deleteMember", member_id);
	}

}

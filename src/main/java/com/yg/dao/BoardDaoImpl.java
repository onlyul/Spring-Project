package com.yg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yg.dto.BoardDto;
import com.yg.dto.SelectBoardDto;
@Repository
public class BoardDaoImpl implements BoardDao {
	//@Autowired
	private SqlSession sqlSession;
	
	public BoardDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertBoard(BoardDto dto) {
		sqlSession.insert("com.yg.mapper.boardMapper.insertBoard", dto);
	}

	@Override
	public SelectBoardDto selectBoard(int document_id) {
		return sqlSession.selectOne("com.yg.mapper.boardMapper.selectBoard", document_id);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList("com.yg.mapper.boardMapper.selectAllBoard");
	}

	@Override
	public void deleteBoard(int document_id) {
		sqlSession.delete("com.yg.mapper.boardMapper.deleteBoard", document_id);
	}
	
	@Override
	public void updateBoard(BoardDto dto) {
		sqlSession.update("com.yg.mapper.boardMapper.updateBoard", dto);
	}
}

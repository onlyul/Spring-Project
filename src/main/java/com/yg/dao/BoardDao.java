package com.yg.dao;

import java.util.List;
import java.util.Map;

import com.yg.dto.BoardDto;
import com.yg.dto.SelectBoardDto;

public interface BoardDao {
	void insertBoard(BoardDto dto);
	SelectBoardDto selectBoard(int document_id);
	List<Map<String, Object>> selectAll();
	void deleteBoard(int document_id);
	void updateBoard(BoardDto dto);
}

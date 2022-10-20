package com.yg.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yg.dto.BoardDto;
import com.yg.dto.SelectBoardDto;
@Service
public interface BoardService {
	void insertBoard(BoardDto dto);
	SelectBoardDto selectBoard(int document_id);
	List<Map<String, Object>> selectAll();
	void deleteBoard(int document_id);
	void updateBoard(BoardDto dto);
}

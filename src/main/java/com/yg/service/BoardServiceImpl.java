package com.yg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.BoardDao;
import com.yg.dto.BoardDto;
import com.yg.dto.SelectBoardDto;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao bdao;
	
	@Override
	public void insertBoard(BoardDto dto) {
		bdao.insertBoard(dto);
	}

	@Override
	public SelectBoardDto selectBoard(int document_id) {
		return bdao.selectBoard(document_id);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return bdao.selectAll();
	}

	@Override
	public void deleteBoard(int document_id) {
		bdao.deleteBoard(document_id);
	}
	
	@Override
	public void updateBoard(BoardDto dto) {
		bdao.updateBoard(dto);
	}
}

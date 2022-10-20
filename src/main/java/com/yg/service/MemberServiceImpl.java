package com.yg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yg.dao.MemberDao;
import com.yg.dto.MemberDto;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	public void insert(MemberDto dto) {
		dao.insert(dto);
	}

	@Override
	public Map<String, Object> select(MemberDto dto) {
		return dao.select(dto);
	}

	@Override
	public void delete(int member_id) {
		dao.delete(member_id);
	}

}

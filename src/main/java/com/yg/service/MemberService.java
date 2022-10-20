package com.yg.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yg.dto.MemberDto;
@Service
public interface MemberService {
	void insert(MemberDto dto);
	Map<String, Object> select(MemberDto dto);
	void delete(int member_id);
}

package com.yg.dao;

import java.util.List;
import java.util.Map;

import com.yg.dto.MemberDto;

public interface MemberDao {
	void insert(MemberDto dto);
	Map<String, Object> select(MemberDto dto);
	void delete(int member_id);
}

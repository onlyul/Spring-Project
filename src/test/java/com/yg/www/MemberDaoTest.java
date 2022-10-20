package com.yg.www;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yg.dao.MemberDao;
import com.yg.dto.MemberDto;
import com.yg.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDaoTest {
	@Autowired
	MemberDao dao;
	
//	@Autowired
//	MemberService svc;
	
	@Test
	public void testDaoNotNull() throws Exception {
		System.out.println(dao!=null);
	}
	
/*	
	@Test
	public void testInsertMember() throws Exception {
		svc.insert(new MemberDto("유라킹", "KingYR", 2222));
	}
*/
}

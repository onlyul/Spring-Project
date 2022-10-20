package com.yg.www;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yg.dao.BoardDao;
import com.yg.dto.SelectBoardDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoTest {
	@Autowired
	BoardDao dao;
	
//	@Autowired
//	BoardService bsvc;
	
/*	@Test
	public void testDaoNotNull() throws Exception {
		System.out.println(dao!=null);
	}
*/	
	
/*	@Test
	public void testInsertBoard() throws Exception {
		dao.insertBoard(new BoardDto("titleeeeeeeeee", "contenttttttttttt", 1));
	}
*/	
/*	@Test
	public void testselectAllBoard() throws Exception {
		List<Map<String, Object>> list = dao.selectAll();
		for(int i = 0; i<=list.size()-1; i++) {
			System.out.println(list.get(i));
		}
	}
*/	
	@Test
	public void testselectBoard() throws Exception {
		SelectBoardDto dto = dao.selectBoard(2);
		System.out.println(dto.getDocument_id() + dto.getContent() + dto.getCreation_Date() + dto.getHits() + dto.getName() + dto.getTitle() + dto.getWriter_id());
	}
	
}

package com.yg.www;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.yg.dto.BoardDto;
import com.yg.dto.MemberDto;
import com.yg.dto.NaverLoginBO;
import com.yg.dto.SelectBoardDto;
import com.yg.service.BoardService;
import com.yg.service.MemberService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberService svc;
	
	@Autowired
	BoardService bsvc;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {	
		 this.naverLoginBO = naverLoginBO;
	}
	
	//메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "home";
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws IOException, ParseException {	
		System.out.println("여기는 callback");
		System.out.println("paramMap:" + paramMap);
		Map <String, Object> resultMap = new HashMap<String, Object>();
		
		OAuth2AccessToken oauthToken;
		oauthToken = NaverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = NaverLoginBO.getUserProfile(oauthToken);
		System.out.println("apiResult =>"+apiResult);
		ObjectMapper objectMapper =new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		/** apiResult json 구조		
		  * {"resultcode":"00",
		  * "message":"success",
		  * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		  * **/
		System.out.println(apiJson);
		model.addAttribute("member_id", 2);
		model.addAttribute("id",apiJson.get("id"));
		model.addAttribute("name",apiJson.get("nickname"));
		model.addAttribute("manager", 0);
		model.addAttribute("result", apiResult);
		return "home";
	}
		
/*	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {	
		 System.out.println("여기는 logout");
		 session.invalidate();
		 return "redirect:index.jsp";
	}
*/		
	//회원가입페이지로 이동
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	//회원가입완료
	@RequestMapping(value = "/insertMember" , method = RequestMethod.POST)
	public String insertMember(MemberDto dto) {
		svc.insert(dto);
		return "home";
	}
	//로그인체크
	@RequestMapping(value = "/loginCheck" , method = RequestMethod.POST)
	public String loginCheck(MemberDto dto, HttpServletRequest request, RedirectAttributes redirectAttr, Model model) {
		HttpSession session = request.getSession();
		Map<String, Object> map = svc.select(dto);
		if(map != null) {
			int member_id = Integer.parseInt(map.get("member_id").toString());
			String name = (String) map.get("name");
			String id = (String) map.get("id");
			int pw = Integer.parseInt(map.get("password").toString());
			int manager = Integer.parseInt(map.get("manager").toString());
			session.setAttribute("member_id", member_id);
			session.setAttribute("name", name);
			session.setAttribute("id", id);
			session.setAttribute("manager", manager);
			return "home";
		}else {
			model.addAttribute("msg", "로그인 실패했다냥");
			return "home";
		}
	}
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
		return "home";
	}
	//회원탈퇴
	@RequestMapping("/memberOut")
	public String memberOut(int member_id, HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
		svc.delete(member_id);
		return "home";
	}
	//관리자만 볼 수 있는 멤버테이블(멤버당 게시글을 몇개썼는지 볼 수 있음)
	@RequestMapping("/management")
	public String management() {
		return "management";
	}
	
	//게시판으로 이동
	@RequestMapping("/board")
	public String board(int member_id, String id, String name, Model model) {
		model.addAttribute("member_id", member_id);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		//게시글정보
		/* List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>(); */
		List<Map<String, Object>> list = bsvc.selectAll();
		model.addAttribute("list", list);
		return "board";
	}
	//글쓰기 페이지로 이동
	@RequestMapping("/writing")
	public String writing(int member_id, Model model) {
		model.addAttribute("member_id", member_id);
		return "writing";
	}
	//게시글추가
	@RequestMapping(value = "/insertBoard" , method = RequestMethod.POST)
	public String insertBoard(HttpServletRequest request, BoardDto dto) {
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		dto.setWriter_id(member_id);
		dto.setTitle(title);
		dto.setContent(content);
		bsvc.insertBoard(dto);
		return "board";
	}
	//글하나씩 보는 거 //hits올라가는것도
	@RequestMapping("/reading")
	public String reading(int document_id, int member_id, String id, String name, Model model) {
		SelectBoardDto dto = bsvc.selectBoard(document_id);
		int writer_id = dto.getWriter_id();
		model.addAttribute("member_id", member_id);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		if(member_id == writer_id) {
			model.addAttribute("same", "same");
		}else {
			model.addAttribute("same", "no");
		}
		model.addAttribute("dto", dto);
		return "reading";
	}
	//글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(String document, int member_id, String id, String name, Model model) {
		int document_id = Integer.parseInt(document);
		bsvc.deleteBoard(document_id);
		model.addAttribute("member_id", member_id);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		//게시글정보
		List<Map<String, Object>> list = bsvc.selectAll();
		model.addAttribute("list", list);
		return "board";
	}
	//글 수정
	@RequestMapping(value = "/updateBoard" , method = RequestMethod.POST)
	public String updateBoard(String document, String title, String content, BoardDto dto, int member_id, String id, String name, Model model) {
		int document_id = Integer.parseInt(document);
		dto.setDocument_id(document_id);
		dto.setTitle(title);
		dto.setContent(content);
		bsvc.updateBoard(dto);
		model.addAttribute("member_id", member_id);
		model.addAttribute("id", id);
		model.addAttribute("name", name);
		SelectBoardDto sdto = bsvc.selectBoard(document_id);
		int writer_id = sdto.getWriter_id();
		if(member_id == writer_id) {
			model.addAttribute("same", "same");
		}else {
			model.addAttribute("same", "no");
		}
		model.addAttribute("dto", sdto);
		return "reading";
	}
	//채팅으로 이동
	@RequestMapping("/chatting")
	public String chatting() {
		return "chatting";
	}
}

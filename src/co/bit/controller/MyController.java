package co.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.day4.MemberVO;

public class MyController extends HttpServlet {
	private ArrayList<MemberVO> list;
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		list = new ArrayList<MemberVO>();
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//req.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		cmd= cmd==null?"":cmd;
		System.out.println("working");
		request.setCharacterEncoding("UTF-8");
		String url = "./mvc/home.jsp";
		if(cmd.equals("viewRegist")) {
			url = "./mvc/regist_member.jsp";
		} else if(cmd.equals("regist")){
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String zip1 = request.getParameter("zip1");
			String zip2 = request.getParameter("zip2");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String tool = request.getParameter("tool");
			String project = request.getParameter("project");
			String[] langs = request.getParameterValues("lang");
			String[] temp = {"","","",""};
			for(String index : langs){
				int idx = Integer.parseInt(index);
				temp[idx] = index;
			}
			//MemberVO 데이터 클래스를 만들어서 인스턴스를 하나 생성
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			name = new String(name.getBytes("iso-8859-1"),"UTF-8");
			vo.setName(name);
			//System.out.println(new Srting(name.getBytes("iso-8859-1"),"UTF-8"));
			vo.setEmail(email);
			vo.setZipcode(zip1+"-"+zip2);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setTool(tool);
			vo.setProject(project);
			vo.setLangs(temp);
			//out.print(vo);
		    list.add(vo);
			System.out.println(list.size()+"번째 등록");
			request.setAttribute("message", "success");
			//response.sendRedirect("storage.jsp");
			url = "./mvc/home.jsp";
		} else if(cmd.equals("search")) {
			url = "./mvc/regist_mamber.jsp";
			String id = request.getParameter("id");
			MemberVO member = null;
			for(MemberVO vo : list) {
				if(vo.getId().equals(id)) {
					member = vo;
					break;
				}
			}
			if(member==null) {
				url=url+"?id"+id;
				}
			request.setAttribute("member",member);
		} else if(cmd.equals("searchAll")) {
			url = "./mvc/lsit.jsp";
			request.setAttribute("list", list);
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
}

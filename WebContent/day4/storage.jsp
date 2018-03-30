<%@page import="co.bit.controller.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터 저장소</title>
</head>
<body>
<!-- 
	회원정보의 저장
	회원정보의 검색이 가능해야 한다.
 -->
 <%!
 	ArrayList<MemberVO> list;
    public void jspInit(){
    	list = new ArrayList<MemberVO>();
    }
 %>
 <%
 	MemberVO vo = (MemberVO)session.getAttribute("vo");
 	String id = request.getParameter("id");
 	if(id!=null){
 		for(MemberVO temp : list){
 			if(temp.getId().equals(id)){
 				System.out.println(temp);
 				break;
 			}
 		}
 	} else {
	 	list.add(vo);
	 	System.out.println(vo.getName()+"님이 등록되었습니다. \n 등록인원 "+list.size());
 	}
 	response.sendRedirect("read.jsp");
 %>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="co.bit.controller.FileDataService"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서비스페이지</title>
</head>
<body>
<!-- 
	service페이지에 연결하여 result페이지에 Date객체를 전달하여 현재시간을 출력하는
	코드작성하시오
	1. form 태그 작성
 -->
 <%
 	FileDataService fds = new FileDataService();
 	//Date date = fds.getDateTime(); 
 	//session.setAttribute("date", date);
 	//response.sendRedirect("result.jsp");
 	String path = 
 			application.getRealPath("WEB-INF/file/Abc1115.txt");
 	ArrayList list = fds.getFileData(path);
 	session.setAttribute("list", list);
 	response.sendRedirect("result.jsp");
 %>
</body>
</html>
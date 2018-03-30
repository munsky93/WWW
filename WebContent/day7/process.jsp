<%@page import="kr.co.bit.day4.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Process</title>
</head>
<body>
<%
	out.print("process");
	MemberVO member = (MemberVO)session.getAttribute("member");
	System.out.println(member.getId()+" from other");
	String etc1 = request.getParameter("etc1");
	String etc2 = request.getParameter("etc2");
	System.out.println(etc1+"/"+etc2);
%>

</body>
</html>
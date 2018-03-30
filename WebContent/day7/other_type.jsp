<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다른 타입의 JSP</title>
</head>
<body>
<%
	//int a = 10/0;
	//out.print(a);
%>
<!-- MemberVO member = new MemberVO(); -->
<jsp:useBean id="member" class="kr.co.bit.day4.MemberVO" scope="session"></jsp:useBean>
<%
	member.setId("amdin");
	System.out.println(member.getId());
%>
<jsp:getProperty property="id" name="member"/>
<jsp:setProperty property="pw" name="member" value="1234"/>
<%
	System.out.println(member.getPw());
	//request.setAttribute("member", member);
%>
<jsp:forward page="process.jsp">
	<jsp:param value="data1" name="etc1"/>
	<jsp:param value="data2" name="etc2"/>
</jsp:forward>
</body>
</html>
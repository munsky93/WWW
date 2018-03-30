<%@page import="co.bit.controller.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
</head>
<body>
<%
	//Date date = (Date)session.getAttribute("date");
	//String now = String.format("%s:%s:%s", 
								//date.getHours(),date.getMinutes(),
								//date.getSeconds());
	//String now2 = date.getHours()+":"
	//				+date.getMinutes()+":"+date.getSeconds();
	//out.print(now);
%>
<%
	ArrayList<StudentVO> list = 
		(ArrayList<StudentVO>)session.getAttribute("list");
	//out.print(list.size());
	StringBuffer sb = new StringBuffer("<table>");
	StudentVO vo = null;
	for(int i=0;i<100;i++){
		vo = list.get(i);
		sb.append("<tr>");
		sb.append("<td>"+vo.getStdNo()+"</td>");
		sb.append("<td>"+vo.getEmail()+"</td>");
		sb.append("<td>"+vo.getKor()+"</td>");
		sb.append("<td>"+vo.getEng()+"</td>");
		sb.append("<td>"+vo.getMath()+"</td>");
		sb.append("<td>"+vo.getSci()+"</td>");
		sb.append("<td>"+vo.getHistory()+"</td>");
		sb.append("<td>"+vo.getTotal()+"</td>");
		sb.append("<td>"+vo.getMgrCode()+"</td>");
		sb.append("<td>"+vo.getAccCode()+"</td>");
		sb.append("<td>"+vo.getLocalCode()+"</td>");
		sb.append("</tr>");
	}
	sb.append("</table>");
	out.print(sb.toString());
%>
</body>
</html>

<%@page import="java.util.Arrays"%>
<%@page import="kr.co.bit.day4.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 회원정보의 내용을 출력한다. -->
<%
       ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
       StringBuffer sb = new StringBuffer("<table>");     
       for(MemberVO vo : list) {
    	   sb.append("<tr>");
    	   sb.append("<td>"+vo.getId()+"</td>");
    	   sb.append("<td>"+vo.getName()+"</td>");
    	   sb.append("<td>"+vo.getZipcode()+"</td>");
    	   sb.append("<td>"+vo.getAddr1()+" " +vo.getAddr2()+"</td>");
    	   sb.append("<td>"+Arrays.toString(vo.getLangs())+"</td>");
    	   sb.append("</tr>");
       }
       sb.append("</table>");
       out.print(sb.toString());

%>
</body>
</html>
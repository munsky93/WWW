<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드</title>
</head>
<body>
<%
	long maxSize = 50*1024*1024;
	long holdSize = maxSize/10;
	String path = "d:\\dev\\upload\\";
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setDefaultCharset("UTF-8");
	factory.setRepository(new File(path));
	
	factory.setSizeThreshold((int)holdSize);
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(maxSize);
	upload.setHeaderEncoding("UTF-8");
	List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
	Iterator<FileItem> i = items.iterator();
	while(i.hasNext()){
		FileItem item = (FileItem)i.next();
		if(item.isFormField()){
			String name = item.getFieldName();
			String value = item.getString();
			System.out.println(name+"/"+value);
		} else {
			String fileName = item.getName();
			System.out.println(fileName);
			int index = fileName.lastIndexOf("\\");
			fileName = index!=-1?fileName.substring(index+1):fileName;
			System.out.println(fileName);
			File file = new File(path+fileName);
			item.write(file); //업로드
		}
	}
	out.print("success");
%>
</body>
</html>
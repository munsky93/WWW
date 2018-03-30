package kr.co.bit.day7;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
											throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
											throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");
		resp.setContentType("text/html");
		String id = req.getParameter("id");
		System.out.println(id);
		PrintWriter out = resp.getWriter(); 
		out.print("<html><body><h1>Hello Servlet</h1></body></html>");
		ServletConfig config = getServletConfig();
		String data = config.getInitParameter("data");
		ServletContext ctx = getServletContext();
		String dbInfo = ctx.getInitParameter("dbInfo");
		System.out.println(dbInfo);
		System.out.println(data);
		
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy");
	}
}

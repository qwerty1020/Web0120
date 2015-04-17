package net.hb.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import  java.io.*;
import  java.util.*;

import  javax.servlet.http.*;
import  javax.servlet.*;

import net.hb.common.DBSQL;
import net.hb.common.DBbean;

@WebServlet("/detail.do")
public class EditPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doGet(1,2)");
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user(request,response);
		System.out.println("doPost(1,2)");
	} //end

	protected void user(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter  out = response.getWriter();
		  out.println("<h1>[DetailController.java]</h1>");
		  out.println("<img src='images/bar.gif'><p>");

		  
		  //twoList.jsp문서 제목클릭하면 
		  String data = request.getParameter("idx");
		  DBSQL  dbsql = new  DBSQL( );
		  DBbean bean = dbsql.dbDetail(data); 
		  //request.setAttribute("daum", bean);
		  request.setAttribute("bean", bean);//bean개체를 twoDetail.jsp
		  RequestDispatcher dis= request.getRequestDispatcher("twoDetail.jsp");
		  dis.forward(request, response);
	} //end
	
}//class END








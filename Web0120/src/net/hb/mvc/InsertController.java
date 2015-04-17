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

@WebServlet("/insert.do")
public class InsertController extends HttpServlet {
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
		  out.println("<font size=7><b>[InsertController.java]</b></font><br>");
		  out.println("<img src='images/aaa.gif'>");  out.println("<img src='images/aaa.gif'>");
		  out.println("<img src='images/aaa.gif'>");  out.println("<img src='images/aaa.gif'>");
		  out.println("<img src='images/aaa.gif'>");  
		  out.println("<img src='images/bar.gif'><p>");
		  
		  //two.jsp�������� �Ѿ���� ����Ÿ 
	   int data1=Integer.parseInt(request.getParameter("sabun"));
	   String data2=request.getParameter("name");
	   String data3=request.getParameter("title");
	   int data4=Integer.parseInt(request.getParameter("pay"));

	   System.out.println("�Ѿ�»��=" + data1 );
	   System.out.println("�Ѿ���̸�=" + data2 );
	   System.out.println("�Ѿ������=" + data3 );
	   System.out.println("<�Ѿ�±޿�=" + data4 );
	   
	   //DBSQL.java���� dbInsert(DBbean)�Լ��� data1~data4�ѱ⼼�� 
	   DBSQL  dbsql = new  DBSQL( );
		  DBbean  bean = new DBbean( );
		  bean.setSabun(data1);  bean.setName(data2);
		  bean.setTitle(data3);  bean.setPay(data4);
		 
		  dbsql.dbInsert(bean);
		  System.out.println("InsertController.java ���强��");  
		  response.sendRedirect("list.do"); //list.do=ListController.java
	} //user end=========================================================
	
}//class END














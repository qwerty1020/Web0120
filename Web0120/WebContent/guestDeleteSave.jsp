<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestDeleteSave.jsp] </title> 
	<style type="text/css">
	   input,b{ font-size:20pt; font-weight:bold; }
	</style>
</head>
<%!
  private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
  private  Statement  ST; //�������  ST=CN.createStatement( )
  private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure����������
  private  ResultSet RS; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
  
  private  String sql; //insert~ , select,  delete, update ~
  private  int Gsabun; //����ʵ� 
  private  String Gname; //�̸��ʵ�
  private  String Gtitle; //�����ʵ�
  private  int total=27; //���ڵ尹��
 
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� 
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
    CN=DriverManager.getConnection(url, "system","oracle"); //2�ܰ� 
  	//out.println("<h1>DB���� ���� ����!!!!! </h1>");
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB���� ���� ����</h1>");
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>
 <font size=7 color=blue>[guestDeleteSave.jsp] </font><p>
 <%
   try{
   	 //delete ~~, select~~  =>��ɾ� Statement STó�� => PST�����غ����� 
   	 String data = request.getParameter("sabun"); 
	 sql="delete from guest where sabun = " + data ;
     out.println("<h1>" + sql + "</h1>");
     ST=CN.createStatement(); //3�ܰ� ��ɾ����
     ST.executeUpdate(sql); //4�ܰ�  ����ó�� ��¥ ����
     //insert~~, delete where~, update set where~~ =>����Update( )
     //select����������  =>����Query( )
     System.out.println("guestDeleteSave.jsp " + data +" ��� ��������") ; 
	 response.sendRedirect("guestList.jsp");
  }catch(Exception ex){ 
    System.out.println("��������: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>

 <p>
 <h1>
 	<a href="guest.jsp">����Ÿ�Է�</a> &nbsp;
 	<a href="guestDelete.jsp">����Ÿ����</a> &nbsp;
 	<a href="guestList.jsp">����Ÿ���</a> 
 </h1>
 
</body>
</html>







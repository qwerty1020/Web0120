<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestReply_del.jsp] </title> 
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
 <font size=7 color=blue>[guestReply_del.jsp] </font><p>
 <%
   try{ 
   	 String data = request.getParameter("idx"); 
	 sql="delete from  guestreply where num = " + data ;
    
     ST=CN.createStatement(); 
     ST.executeUpdate(sql); 
     System.out.println( data +" ��ۻ�� ��������") ; 
	 response.sendRedirect("guestList.jsp");
  }catch(Exception ex){ 
    System.out.println("��ۻ�� ��������: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>

 
</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestEditSave.jsp] </title> 
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
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
    CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
  	//out.println("<h1>DB���� ���� ����!!!!! </h1>");
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB���� ���� ����</h1>");
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>
 <font size=7 color=blue>[guestEditSave.jsp-�ܵ�����X] </font><p>
 <%
   //guestEdit.jsp�������� ������ ����Ÿ�� �Ѿ�Ϳ�
   int data1=Integer.parseInt(request.getParameter("sabun"));
   String data2=request.getParameter("name");
   String data3=request.getParameter("title");
   int data4=Integer.parseInt(request.getParameter("pay"));
 
  try{
	 //sql="~~~ set name=?,title=?,nalja=sysdate,pay=? where sabun=?" ;
	 sql="update guest set name=?, title=?, nalja=sysdate, pay=? where sabun=?  " ;
	 PST=CN.prepareStatement(sql); //sql�������� �̸��� ������ 
	     PST.setString(1 , data2);	
	 	 PST.setString(2, data3);
	 	 PST.setInt(3, data4);
	 	 PST.setInt(4, data1);
	 PST.executeUpdate(); //��¥ ��������
	 response.sendRedirect("guestList.jsp");
	 out.println("<h1>guest���̺� �������� </h1>");
	 System.out.println("<h1>guest���̺� �������� </h1>");
  }catch(Exception ex){ 
    System.out.println("��������: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>

</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestDetail.jsp] </title> 
	<style type="text/css">
	    input, b{ font-size:16pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt; color:black;  font-weight:bold; text-decoration:none;}
		a:hover{font-size:20pt;  color:red; font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<%!
	private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
	private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
	private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure����������
	private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
	
	private  String sql; //insert~ , select,  delete, update ~
	private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
	private  int Gsabun, Gpay; //���,�޿��ʵ� 
	private  String Gname, Gtitle; //�̸�, �����ʵ�
	private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
	private  int total=0, Gtotal=0; //���ڵ尹��
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
 
 <table width='800'  border='1' cellspacing="0">
 <%
  try{   
   String data = request.getParameter("idx"); 
   sql="select * from  guest  where sabun = " + data ; //select~~������  
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   if(RS.next()==true){
 	Gsabun = RS.getInt("sabun");
 	Gname = RS.getString("name");
 	Gtitle = RS.getString("title");
 	Gpay = RS.getInt("pay");
 %>
  <tr bgcolor="yellow"  height='50'  align="center">
 	<td>���</td>  <td>����</td>  <td>��¥</td> <td>�޿�</td>      
  </tr>
  
  <tr  align="center">
  	<td colspan=4>
  		<font size=7 color=red face="�ü�ü">
  		 	<%= Gname %>���� �󼼵���Ÿ ���  
  		 </font>
  	</td>
  </tr>
 
   <tr height=50 align="center">
 		<td> <%= Gsabun %> </td>
 		<td> <%= RS.getString("title")  %> </td>
 		<td> <%= RS.getDate("nalja")  %> </td>
 		<td> <%= RS.getInt("pay") %> </td>
 	</tr>
 
 <%  	
   }//if end
  }catch(Exception ex){  }
 %>
 
   <tr  align="center">
  	<td colspan=4 height='50'>
  		<a href="guestEdit.jsp?sabun=<%= Gsabun %>&name=<%= Gname %>&title=<%= Gtitle %>&pay=<%= Gpay %>">[����Ÿ����]</a> &nbsp;
 		<a href="guestDelete.jsp">[����Ÿ����]</a> &nbsp;
 		<a href="guestList.jsp">[����Ÿ���]</a> 
 		<a href="guest.jsp">[����Ÿ�Է�]</a> &nbsp;
  	</td>
  </tr>
</table>
 
 
 <p><br><br>
 	<!-- ��۴ޱ� ����  -->
 	<jsp:include page="guestReply.jsp" flush="false">
 		<jsp:param value="<%= Gsabun %>" name="Gsabun" />
 		<jsp:param value="<%= Gname %>" name="Gname" />
 		<jsp:param value="<%= Gtitle %>" name="Gtitle" />
 	</jsp:include>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestReply.jsp] </title> 
	<style type="text/css">
	    input, b, textarea{ font-size:14pt; font-weight:bold;}
		td,th{ font-size:14pt; font-weight:bold; font-family:�������; }
		a{font-size:14pt; color:black;  font-weight:bold; text-decoration:none;}
		a:hover{font-size:16pt;  color:red; font-weight:bold; text-decoration:underline;}  
	</style>
	
	<script type="text/javascript">
		function del( code ){
		  location.href="guestReply_del.jsp?idx=" + code ;
		}
	</script>
	
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
	
	private  int  Gnum; //��������ȣ �������� 
	private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
	private  int total=0, Gtotal=0; //���ڵ尹��
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle");
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("����: " + ex.toString() );
  }
%>
<body>
<%
String data1 = request.getParameter("Gsabun");
String data2 = request.getParameter("Gname");
String data3 = request.getParameter("Gtitle"); //�����ص� �˴ϴ�

System.out.println( "guestReply.jsp Gsabun=" + data1);
System.out.println( "guestReply.jsp Gname=" + data2);
System.out.println( "guestReply.jsp Gtitle=" + data3);
%>

 
 <table width='800'  border='1' cellspacing="0">
 <!-- 2015-01-16-�ݿ��� �߰��ڵ� -->
 <form  method="get" action="guestReply_insert.jsp">
 	<input type="hidden"  name="sabun"  value="<%= data1 %>">
 	<tr>
 		<td width=150>�̸�:</td>
 		<td width=600>
 		 	<input type="text"  name="writer" size="60">    
 		 </td>
 		
 		<td rowspan=2>
 		  <input type="submit"  value=" ������� "  style="height:72pt;"> 
 		 </td>
 	</tr>
 	<tr>
 		<td>����:</td>
 		<td>
 		  <textarea  name="content" cols="80" rows=4></textarea>  
 		 </td>
 		 <td></td>
 	</tr>
 </form>
 </table>
 
 <p><br><br>
 <table width='800'  border='1' cellspacing="0">
   <tr  bgcolor="pink"  height='40'  align="center">
 	 <td>�г���</td>  <td colspan=2>����ǥ�� ����</td>       
   </tr>
 <%   
  try{    
   sql3 = "select * from  guestreply where sabun = " + data1  ;
   System.out.println( sql3);
   ST3 = CN.createStatement();
   RS3 = ST3.executeQuery(sql3);
   while( RS3.next()==true) {
   	Gnum = RS3.getInt("num");
   	Gwriter = RS3.getString("writer");
   	Gcontent = RS3.getString("content");
   	
 %>
  <tr>
 	<td width=200> <%= Gwriter %></td>  
 	<td width=500> <%= Gcontent %></td>
 	<td width=300> 
 	   <a href="guestReply_del.jsp?idx=<%= Gnum %>">����1</a>
 	   <input type="button"  onClick="del(<%= Gnum %>)" value="����2" style="font-size:10pt">
 	   <input type="button"  onClick="javascript:location.href='guestReply_del.jsp?idx=<%= Gnum %>'" value="����3" style="font-size:10pt">
 	 </td>       
  </tr>
  
<%
   }//while end
  }catch(Exception ex){  }
%>
</table>

 </body>
</html>







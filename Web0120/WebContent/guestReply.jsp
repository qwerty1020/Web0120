<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestReply.jsp] </title> 
	<style type="text/css">
	    input, b, textarea{ font-size:14pt; font-weight:bold;}
		td,th{ font-size:14pt; font-weight:bold; font-family:맑은고딕; }
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
	private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure쿼리문실행
	private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") 조회한결과
	
	private  String sql; //insert~ , select,  delete, update ~
	private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
	private  int Gsabun, Gpay; //사번,급여필드 
	private  String Gname, Gtitle; //이름, 제목필드
	
	private  int  Gnum; //시퀀스번호 가져오기 
	private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
	private  int total=0, Gtotal=0; //레코드갯수
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; 
    CN=DriverManager.getConnection(url, "system","oracle");
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	System.out.println("에러: " + ex.toString() );
  }
%>
<body>
<%
String data1 = request.getParameter("Gsabun");
String data2 = request.getParameter("Gname");
String data3 = request.getParameter("Gtitle"); //생략해도 됩니다

System.out.println( "guestReply.jsp Gsabun=" + data1);
System.out.println( "guestReply.jsp Gname=" + data2);
System.out.println( "guestReply.jsp Gtitle=" + data3);
%>

 
 <table width='800'  border='1' cellspacing="0">
 <!-- 2015-01-16-금요일 추가코드 -->
 <form  method="get" action="guestReply_insert.jsp">
 	<input type="hidden"  name="sabun"  value="<%= data1 %>">
 	<tr>
 		<td width=150>이름:</td>
 		<td width=600>
 		 	<input type="text"  name="writer" size="60">    
 		 </td>
 		
 		<td rowspan=2>
 		  <input type="submit"  value=" 댓글저장 "  style="height:72pt;"> 
 		 </td>
 	</tr>
 	<tr>
 		<td>내용:</td>
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
 	 <td>닉네임</td>  <td colspan=2>내용표시 삭제</td>       
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
 	   <a href="guestReply_del.jsp?idx=<%= Gnum %>">삭제1</a>
 	   <input type="button"  onClick="del(<%= Gnum %>)" value="삭제2" style="font-size:10pt">
 	   <input type="button"  onClick="javascript:location.href='guestReply_del.jsp?idx=<%= Gnum %>'" value="삭제3" style="font-size:10pt">
 	 </td>       
  </tr>
  
<%
   }//while end
  }catch(Exception ex){  }
%>
</table>

 </body>
</html>







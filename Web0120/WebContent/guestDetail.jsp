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
	private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
	private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
	private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
	private  CallableStatement  CST ; //storedProcedure쿼리문실행
	private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") 조회한결과
	
	private  String sql; //insert~ , select,  delete, update ~
	private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
	private  int Gsabun, Gpay; //사번,급여필드 
	private  String Gname, Gtitle; //이름, 제목필드
	private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
	private  int total=0, Gtotal=0; //레코드갯수
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 드라이브로드
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB서버정보기술 430페이지 12라인
    CN=DriverManager.getConnection(url, "system","oracle"); //32라인 
  	//out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB서버 연결 실패</h1>");
  	System.out.println("에러: " + ex.toString() );
  }
%>

<body>
 
 <table width='800'  border='1' cellspacing="0">
 <%
  try{   
   String data = request.getParameter("idx"); 
   sql="select * from  guest  where sabun = " + data ; //select~~조건절  
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   if(RS.next()==true){
 	Gsabun = RS.getInt("sabun");
 	Gname = RS.getString("name");
 	Gtitle = RS.getString("title");
 	Gpay = RS.getInt("pay");
 %>
  <tr bgcolor="yellow"  height='50'  align="center">
 	<td>사번</td>  <td>제목</td>  <td>날짜</td> <td>급여</td>      
  </tr>
  
  <tr  align="center">
  	<td colspan=4>
  		<font size=7 color=red face="궁서체">
  		 	<%= Gname %>님의 상세데이타 출력  
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
  		<a href="guestEdit.jsp?sabun=<%= Gsabun %>&name=<%= Gname %>&title=<%= Gtitle %>&pay=<%= Gpay %>">[데이타수정]</a> &nbsp;
 		<a href="guestDelete.jsp">[데이타삭제]</a> &nbsp;
 		<a href="guestList.jsp">[데이타출력]</a> 
 		<a href="guest.jsp">[데이타입력]</a> &nbsp;
  	</td>
  </tr>
</table>
 
 
 <p><br><br>
 	<!-- 댓글달기 연습  -->
 	<jsp:include page="guestReply.jsp" flush="false">
 		<jsp:param value="<%= Gsabun %>" name="Gsabun" />
 		<jsp:param value="<%= Gname %>" name="Gname" />
 		<jsp:param value="<%= Gtitle %>" name="Gtitle" />
 	</jsp:include>
</body>
</html>







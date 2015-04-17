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
  private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
  private  Statement  ST; //정적명령  ST=CN.createStatement( )
  private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure쿼리문실행
  private  ResultSet RS; //RS=ST.executeQuery("select") 조회한결과
  
  private  String sql; //insert~ , select,  delete, update ~
  private  int Gsabun; //사번필드 
  private  String Gname; //이름필드
  private  String Gtitle; //제목필드
  private  int total=27; //레코드갯수
 
%>

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1단계 
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB서버정보기술 430페이지 12라인
    CN=DriverManager.getConnection(url, "system","oracle"); //2단계 
  	//out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  	System.out.println("<h1>DB서버 연결 성공!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB서버 연결 실패</h1>");
  	System.out.println("에러: " + ex.toString() );
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
     System.out.println( data +" 댓글사번 삭제성공") ; 
	 response.sendRedirect("guestList.jsp");
  }catch(Exception ex){ 
    System.out.println("댓글사번 삭제실패: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>

 
</body>
</html>







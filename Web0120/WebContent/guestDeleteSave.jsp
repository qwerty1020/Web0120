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
 <font size=7 color=blue>[guestDeleteSave.jsp] </font><p>
 <%
   try{
   	 //delete ~~, select~~  =>명령어 Statement ST처리 => PST변경해보세요 
   	 String data = request.getParameter("sabun"); 
	 sql="delete from guest where sabun = " + data ;
     out.println("<h1>" + sql + "</h1>");
     ST=CN.createStatement(); //3단계 명령어생성
     ST.executeUpdate(sql); //4단계  삭제처리 진짜 수행
     //insert~~, delete where~, update set where~~ =>실행Update( )
     //select쿼리문장은  =>실행Query( )
     System.out.println("guestDeleteSave.jsp " + data +" 사번 삭제성공") ; 
	 response.sendRedirect("guestList.jsp");
  }catch(Exception ex){ 
    System.out.println("삭제실패: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>

 <p>
 <h1>
 	<a href="guest.jsp">데이타입력</a> &nbsp;
 	<a href="guestDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="guestList.jsp">데이타출력</a> 
 </h1>
 
</body>
</html>







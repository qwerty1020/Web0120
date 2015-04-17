<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestSave.jsp] </title> 
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
  private  int total=0; //레코드갯수
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
 <font size=7 color=blue>[guestSave.jsp-단독실행X] </font><p>
<%
   int data1=Integer.parseInt(request.getParameter("sabun"));
   String data2=request.getParameter("name");
   String data3=request.getParameter("title");
   int data4=Integer.parseInt(request.getParameter("pay"));
 
  try{
  	sql="select count(*) as cnt from guest  where sabun = " + data1 ; 
  	ST=CN.createStatement();
  	RS=ST.executeQuery(sql);
  	if(RS.next()==true){
  		total=RS.getInt("cnt");
  	}
  	
   if(total>0){ //id=계정=사번 이미 존재한다는 의미 
%>
  <script type="text/javascript">
  	alert("<%= data1 %>사번은 이미 등록었습니다");
  	location.href="guest.jsp";
  </script>
  	
<%  			
   }else{ 
		 sql="insert into guest values( ?, ?, ?, sysdate, ?)" ;
		 PST = CN.prepareStatement(sql); 
		  	PST.setInt( 1, data1);
		  	PST.setString( 2, data2);
		  	PST.setString( 3, data3);
		  	PST.setInt( 4, data4);
		 PST.executeUpdate(); //진짜 저장처리
		 response.sendRedirect("guestList.jsp");
		 out.println("<h1>guest테이블 저장성공 </h1>");
		 System.out.println("<h1>guest테이블 저장성공 </h1>");
    }
  }catch(Exception ex){ 
    System.out.println("저장실패: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>
<font size=7>
	넘어온사번:  <%= data1 %>  <br>
	넘어온이름:  <%= data2 %> <br>
	넘어온제목:  <%= data3 %> <br>
	넘어온급여:  <%= data4 %> <p>
</font>

 <h1>
 	<a href="guest.jsp">데이타입력</a> &nbsp;
 	<a href="guestDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="guestList.jsp">데이타출력</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







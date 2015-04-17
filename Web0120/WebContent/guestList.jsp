<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestList.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:16pt;  color:red;font-weight:bold; text-decoration:underline;}  
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
  private  int Gsabun; //사번필드 
  private  String Gname, Gtitle; //이름, 제목필드
  private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
  private  int total=0, Gtotal=0; //레코드갯수
  
  /////////////////나중에 페이징관련 필드 기술////////////////////////
  private  String  pnum ;
  private  int pageNUM=1 ;
  private  int  pagesize=10, limit=10 , start=1, end=10;
  private  int pagecount=1, startpage=1,  temp=0 ;
  private  String skey="", sval="", sqry="" ; //아래쪽 검색연결 필드 
  private  String pageReturn=""  ; //검색시 페이지클릭
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
 
 <%
 try{
  //검색
  skey = request.getParameter("keyfield");//name,title,content
  sval = request.getParameter("keyword"); //사용자가 직접입력
  if(sval=="" || sval==null) {
     skey="" ;  sval=""; 
     pageReturn="";
     sqry = " where  name like '%%'" ;
  }else {  
  	 pageReturn = "&keyfield=" + skey + "&keyword=" + sval;
     sqry = " where " + skey.trim() + " like '%" + sval + "%'" ;
  } 
 	
   sql="select count(*) as cnt  from guest " + sqry ;
   ST=CN.createStatement();
   RS=ST.executeQuery(sql); //RS가 기억하는 값 9
   if(RS.next()==true){
   	 total = RS.getInt("cnt") ;
   }
 }catch(Exception ex){ }
 %>
 
 <table width='900'  border='1'>
  <tr align="right">
     <td colspan=6> 
      <font size=7>레코드갯수: <%= total %> </font> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
     </td>
  </tr>
  
 <tr bgcolor="yellow"  height='50'  align="center">
 	<td>글번호</td>   <td>사번</td>   <td>이름</td>   
 	<td>제목</td>     <td>날짜</td>   <td>급여</td>      
 </tr>
 <%
  try{   
   //sql="select  rownum as rn , sabun, name, title, nalja, pay  from  guest " ; //430페이지 15라인
   pnum = request.getParameter("pageNUM");
   if(pnum=="" || pnum==null) pnum ="1";
   pageNUM = Integer.parseInt(pnum);
   
   if( total%pagesize==0){ pagecount = total/pagesize; }
   else { pagecount = (total/pagesize) + 1 ;  }
   
   start = (pageNUM-1)*pagesize + 1 ;  //[1] => 1
   end = pageNUM*pagesize ;    //[1] => 10 
   
 sql="select * from  ("  ;
 sql+=" select rownum as rn, sabun,name,title,nalja, pay from  " ;
 sql+=" ( select * from  guest  order by sabun ) " + sqry  ; 
 sql+=" ) where rn between " + start + " and " + end ;
    
   System.out.println( sql  );
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   
   //[29]클릭한상태에서 [이전] [이후] 이동하기 위해서 시작페이지 21
   temp = (pageNUM-1)%limit ;    //29-1%10 => 8
   startpage = pageNUM-temp;     //28-8
   
   while(RS.next()==true){
 	Gsabun = RS.getInt("sabun");
 	Gname = RS.getString("name");
 	Gtitle = RS.getString("title");
 //////////////////////////////////////////////////////////////////
 sql3="select count(*) as cnt from guestreply where sabun=" + Gsabun;
 ST3=CN.createStatement();
 RS3=ST3.executeQuery(sql3);
 if(RS3.next()==true){
   Gtotal=RS3.getInt("cnt");	
 }
 //////////////////////////////////////////////////////////////////
 %>
 	<tr
 		onMouseOver="style.backgroundColor='#00FFFF' "
 		onMouseOut="style.backgroundColor=''"
 	>
 		<td> <%= RS.getInt("rn") %> </td>
 		<td> <%= Gsabun %> </td>
 		<td> <%= Gname %> </td>
 		<td>
 		 <a href="guestDetail.jsp?idx=<%= Gsabun %>"> <%= Gtitle %> </a>
 		 <%
 		  if(Gtotal>0) {
 		  %>
 		   <font color=red>[<%= Gtotal %>]</font>
 		 <%}%>
 		 </td>
 		<td> <%= RS.getDate("nalja")  %> </td>
 		<td> <%= RS.getInt("pay") %> </td>
 	</tr>
 
 <%  	
   }//whil end
  }catch(Exception ex){  }
 %>
 <tr align="center">
 	<td colspan=6 style="font-size:20pt;">
<%
   //[이전]
   if((startpage-limit) > 0 ) {
   	//out.println("<a ~~~" + (startpage-1) +"'>[이전]</a>") ;
   	out.println("<a href='guestList.jsp?pageNUM=" + (startpage-1) +"'>[이전]</a>") ;
   }
   		
	for(int i=startpage ; i< (startpage+pagesize); i++){
	   if(i==pageNUM){
	   	 out.println("<font color=red>[" + i + "]</font>") ;
	   }else{
	   	out.println("<a href='guestList.jsp?pageNUM=" + i + pageReturn +"'>[" + i + "]</a>") ;
	   }	
	   if(i>=pagecount)break;
	} //for end
	
	//[다음]
  if((startpage+limit) <= pagecount ) {
   	//out.println("<a ~~~" + (startpage+10) +"'>[다음]</a>") ;
   	out.println("<a href='guestList.jsp?pageNUM=" + (startpage+10) +"'>[다음]</a>") ;
   }
%> 		 		
 	</td>
 </tr>

<p>
    <tr align="center">
	<form  action="guestList.jsp">
	 	<td  colspan=6>
	 		검색: &nbsp;
	 		<select name="keyfield">
	 			<option value="name" selected>이름검색</option>
	 			<option value="title"> 제 목</option>
	 			<option value="content"> 내 용</option>
	 		</select>
	 		<input type="text"  name="keyword" value="">
	 		<input type="submit"  value=" 검 색 ">
		</td>			
	</form>
	</tr>	
</table>


<p><br>
 <h1>
 	<a href="guest.jsp">데이타입력</a> &nbsp;
 	<a href="guestDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="guestList.jsp">데이타출력</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







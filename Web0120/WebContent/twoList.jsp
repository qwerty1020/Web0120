<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.common.DBbean"   %>

<html>
<head> <title> [twoList.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:24pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<%!  
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
 <font size=7 color=blue><b> [twoList.jsp]</b></font><br>
 
 <table width='800'  border='1'>
 
 <tr height='50' >
 	<td colspan=5  align="center">
 		<img src="images/bar.gif">
 	</td>      
 </tr>
 
 <tr bgcolor="yellow"  height='50'  align="center">
 	<td>사번</td>     <td>이름</td>   
 	<td>제목</td>     <td>날짜</td>   <td>급여</td>      
 </tr>
 
 	<c:forEach var="bean"  items="${naver}">
 	<tr  
 	   onMouseOver="style.backgroundColor='#00FFFF' "
 	   onMouseOut="style.backgroundColor='' "
 	>
 		<td> ${bean.sabun} </td>
 		<td> ${bean.name} </td>
 		<td> <a href="detail.do?idx=${bean.sabun}"> ${bean.title} </a></td>
 		<td> <fmt:formatDate value="${bean.nalja}" pattern="yyyy년-MM월-dd일"/>  </td>
 		<td> ${bean.pay} </td>
    </tr> 	
    </c:forEach>
 </table>

<p>
 <h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="two.jsp">[데이타입력]</a> &nbsp;
 	<a href="twoDelete.jsp">[데이타삭제]</a> &nbsp;
 	<a href="list.do">[데이타출력]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







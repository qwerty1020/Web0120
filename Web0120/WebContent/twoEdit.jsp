<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head> <title> [twoDetail.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:20pt; font-weight:bold; font-family:궁서체; }
		a{font-size:24pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:16pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>

 <font size=7 color=blue>
 <b> 
   &nbsp;&nbsp;&nbsp;&nbsp;[twoEdit.jsp]
 </b>
 </font><br>
 
   <form method="get" action="edit.do">
 	 <b>수정사번:</b> 
        <input type=text  name="sabun" value="${bean.sabun}" readonly><br>
 	 <b>수정이름:</b> 
 	   <input type=text  name="name" value="${bean.name}"><br>
 	 <b>수정제목:</b> 
 	   <input type=text  name="title" value="${bean.title}"><br>
     <b>수정급여:</b> 
       <input type=text  name="pay" value="${bean.pay}"><p>
        &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="submit"  value="MVC2수정하기">
       <input type="reset" value="수정취소">
   </form>

<p>
 <h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="two.jsp">[데이타입력]</a> &nbsp;
 	<a href="twoDelete.jsp">[데이타삭제]</a> &nbsp;
 	<a href="list.do">[데이타출력]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [two.jsp] </title> 
	<style type="text/css">
	   b, input{ font-size:16pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:16pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:10pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>	
	
	
</head>

<body>
 <font size=7 color=blue>[two.jsp] </font><p>
	<form name="myform"   action="insert.do">
		<b>사번:</b> <input type=text name="sabun" size=10>	<br>
		<b>이름:</b> <input type=text name="name"> <br>
		<b>제목:</b> <input type=text name="title" value="snow"> <br>   
		<b>급여:</b> <input type=text name="pay" value="71"> <p>
		
		<input type="submit"   value="MVC2데이타저장"> &nbsp;
		<input type="reset"  value="입력취소">
	</form>
 <p>
 
 <h1>
 	<a href="two.jsp">데이타입력</a> &nbsp;
 	<a href="twoDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="twoList.jsp">데이타출력</a> 
 </h1>
 <p><br><br><br><br>
</body>
</html>







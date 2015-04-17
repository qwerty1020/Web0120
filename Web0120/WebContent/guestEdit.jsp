<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [guestEdit.jsp] </title> 
	<style type="text/css">
	    input, b{ font-size:16pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt; color:black;  font-weight:bold; text-decoration:none;}
		a:hover{font-size:20pt;  color:red; font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<body>
 <%
   	String data1= request.getParameter("sabun");
  	String data2= request.getParameter("name");
  	String data3= request.getParameter("title");
  	String data4= request.getParameter("pay");
 %> 	
 
 
	<form name="myform"   action="guestEditSave.jsp">
		<b>수정사번:</b> 
		<input type=text name="sabun" value="<%= data1 %>"  readonly > <br>
		<b>수정이름:</b> 
		<input type=text name="name"  value="<%= data2 %>"> <br>
		<b>수정제목:</b> 
		<input type=text name="title" value="<%= data3 %>"> <br>   
		<b>수정급여:</b> 
		<input type=text name="pay" value="<%= data4 %>"> <p>
		
		<input type="submit"   value="데이타수정"> &nbsp;
		<input type="reset"  value="수정취소">
	</form>
 <p>
 
 <h1>
 	<a href="guest.jsp">데이타입력</a> &nbsp;
 	<a href="guestDelete.jsp">데이타삭제</a> &nbsp;
 	<a href="guestList.jsp">데이타출력</a> 
 </h1>
 <p><br><br><br><br>
</body>
</html>







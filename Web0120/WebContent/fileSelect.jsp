<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [fileSelect.jsp] </title> 
	<style type="text/css">
	    input,b{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:20pt; font-weight:bold;}
		a{font-size:20pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:20pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<body>
 <font size=7 color=blue>[fileSelect.jsp] </font><p>
 
 	<form  method="post" enctype="multipart/form-data" action="fileUpload.jsp">
 	  <b>사번:</b> <input type=text name="sabun" value="2234"> <br>	
 	  <b>이름:</b> <input type=text name="name" value="LEE"> <br>
 	  
 	  <b>파일:</b> <input type="file"    name="file_good" > <br>
 	               <input type="hidden"  name="idx" value="78"> <p>
 	  <input type="submit"  value=" 파일업로드 ">
 	  <input type="reset"   value=" 취 소" >
 	</form>

</body>
</html>







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
		<b>�������:</b> 
		<input type=text name="sabun" value="<%= data1 %>"  readonly > <br>
		<b>�����̸�:</b> 
		<input type=text name="name"  value="<%= data2 %>"> <br>
		<b>��������:</b> 
		<input type=text name="title" value="<%= data3 %>"> <br>   
		<b>�����޿�:</b> 
		<input type=text name="pay" value="<%= data4 %>"> <p>
		
		<input type="submit"   value="����Ÿ����"> &nbsp;
		<input type="reset"  value="�������">
	</form>
 <p>
 
 <h1>
 	<a href="guest.jsp">����Ÿ�Է�</a> &nbsp;
 	<a href="guestDelete.jsp">����Ÿ����</a> &nbsp;
 	<a href="guestList.jsp">����Ÿ���</a> 
 </h1>
 <p><br><br><br><br>
</body>
</html>







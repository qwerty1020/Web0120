<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [guest.jsp] </title> 
	<style type="text/css">
	    input{ font-size:10pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:10pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:10pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>	
	
	<script type="text/javascript">
	   function  notice( ){
		   window.open("popup.jsp", "title", "toobar=no, menubar=no, width=380, height=600, left=200, top=100 ") ;
	   }//notice end
	   
	   function  check( ){
		   if(myform.sabun.value==""){
			   alert("����� �����Դϴ�");
			   myform.sabun.focus( );
			   return ;
		   }
		   open("openID.jsp", "title", "toobar=no, menubar=no, width=400, height=150, left=400, top=300 ") ;
	   }//check end 
	   
	   
	   function  zipcheck( ){
		   if(myform.zipcode.value==""){
			   alert("�����ȣ�Է¶� �����Դϴ�");
			   myform.zipcode.focus( );
			   return ;
		   }
		   open("zipCheck.jsp", "title", "toobar=no, menubar=no, width=700, height=250, left=400, top=300 ") ;
	   }//check end 
	   
	</script>
</head>

<body>
 <font size=7 color=blue>[guest.jsp] </font><p>
	<form name="myform"   action="guestSave.jsp">
		<b>���:</b> 
		<input type=text name="sabun" size=10>
		<input type="button"  onClick="check( )"  value="�ߺ�üũ">
		<br>
		
		<b>�̸�:</b> <input type=text name="name"> <br>
		<b>����:</b> <input type=text name="title" value="snow"> <br>   
		<b>�޿�:</b> <input type=text name="pay" value="71"> <p>
		
		<b>����:</b> 
		<input type=text name="zipcode" size=10  value="121-743">
		<input type="button"  onClick="zipcheck( )"  value="����ã��">
		<br>
		<b>�ּ�:</b> <input type=text name="address" size=20> <p>
		
		<input type="submit"   value="����Ÿ����"> &nbsp;
		<input type="reset"  value="�Է����">
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







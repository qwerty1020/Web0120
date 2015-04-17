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
			   alert("사번이 공백입니다");
			   myform.sabun.focus( );
			   return ;
		   }
		   open("openID.jsp", "title", "toobar=no, menubar=no, width=400, height=150, left=400, top=300 ") ;
	   }//check end 
	   
	   
	   function  zipcheck( ){
		   if(myform.zipcode.value==""){
			   alert("우편번호입력란 공백입니다");
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
		<b>사번:</b> 
		<input type=text name="sabun" size=10>
		<input type="button"  onClick="check( )"  value="중복체크">
		<br>
		
		<b>이름:</b> <input type=text name="name"> <br>
		<b>제목:</b> <input type=text name="title" value="snow"> <br>   
		<b>급여:</b> <input type=text name="pay" value="71"> <p>
		
		<b>우편:</b> 
		<input type=text name="zipcode" size=10  value="121-743">
		<input type="button"  onClick="zipcheck( )"  value="우편찾기">
		<br>
		<b>주소:</b> <input type=text name="address" size=20> <p>
		
		<input type="submit"   value="데이타저장"> &nbsp;
		<input type="reset"  value="입력취소">
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







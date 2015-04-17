<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [guestDelete.jsp] </title> 
	<style type="text/css">
	    input{ font-size:10pt; font-weight:bold;}
		td,th{ font-size:10pt; font-weight:bold;}
		a{font-size:10pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:10pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
	
	<script type="text/javascript">
	   function numberCheck( ){
		  var a = myform.sabun.value;
		  var mylen = myform.sabun.value.length;
		  var i=0;
		  for(i=0; i<mylen; i++){
			if(a.charAt(i)<'0' || a.charAt(i) > '9'){
				alert("숫자가 아닙니다");
				 myform.sabun.value = myform.sabun.value.substring(0,i);  
				 myform.sabun.focus( );
			}//if end
		  }//for end
	   } //numberCheck end
	   
	   function  move( ){
		   var str=myform.sabun.value;
		   var size=myform.sabun.value.length ; 
		   if(str=="") { 
			   alert("삭제할 사번=비번 입력하세요");
			   myform.sabun.focus( );
			   return ;
		    }
		   
		   if( size != 4 ){
			   alert("삭제할 사번자릿수 4자리입니다");
			   myform.sabun.value=""; //ta.setText("");
			   myform.sabun.focus( );
			   return ;
		   }
		   document.myform.submit( ); //input type=submit같은역할
	   } //move end
	</script>
</head>
<body>
  <form name="myform" action="guestDeleteSave.jsp">
	<b><font color=red>삭제할사번: </font></b> 
	<input type=text name="sabun" onKeyUp="numberCheck( )" > 
	<input type="button" onClick="move( )"  value=" 삭 제  "> 
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







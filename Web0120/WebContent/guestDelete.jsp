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
				alert("���ڰ� �ƴմϴ�");
				 myform.sabun.value = myform.sabun.value.substring(0,i);  
				 myform.sabun.focus( );
			}//if end
		  }//for end
	   } //numberCheck end
	   
	   function  move( ){
		   var str=myform.sabun.value;
		   var size=myform.sabun.value.length ; 
		   if(str=="") { 
			   alert("������ ���=��� �Է��ϼ���");
			   myform.sabun.focus( );
			   return ;
		    }
		   
		   if( size != 4 ){
			   alert("������ ����ڸ��� 4�ڸ��Դϴ�");
			   myform.sabun.value=""; //ta.setText("");
			   myform.sabun.focus( );
			   return ;
		   }
		   document.myform.submit( ); //input type=submit��������
	   } //move end
	</script>
</head>
<body>
  <form name="myform" action="guestDeleteSave.jsp">
	<b><font color=red>�����һ��: </font></b> 
	<input type=text name="sabun" onKeyUp="numberCheck( )" > 
	<input type="button" onClick="move( )"  value=" �� ��  "> 
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







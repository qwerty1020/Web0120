<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head> <title> [openID.jsp] </title> 
	<style type="text/css">
	   input,b{ font-size:14pt; font-weight:bold; }
	</style>
	
	<script type="text/javascript">
	  function  send( ){
		subform.userid.value=opener.myform.sabun.value;
		subform.userid.focus( );
	  }
	</script>
</head>
<body bgcolor=yellow  onLoad="send( )">
  <form name="subform" action="openIDSave.jsp">
	<b><font color=red>���̵�: </font></b> 
	<input type=text name="userid"  > 
	<input type="submit"   value=" Ȯ ��  "> 
  </form>
 
</body>
</html>







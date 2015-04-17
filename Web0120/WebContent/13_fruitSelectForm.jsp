<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head> <title> [13_fruitSelectForm.jsp] </title>
<meta charset="UTF-8" >
 
</head>
<body>
 <font size=7 color=blue>[13_fruitSelectForm.jsp] </font><p>
 <form action="13_fruitSelect.jsp">
 	<label for="fruit">과일을 선택하세요</label>
 	<select id="fruit"  name="fruit">
 		<option value="1"> 사과 </option>
 		<option value="2"> 메론 </option>
 		<option value="3"> 바나나 </option>
 	</select>
 	<input type="submit"  value=" 전 송 ">
 </form> 

</body>
</html>







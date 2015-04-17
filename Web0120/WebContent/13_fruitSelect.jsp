<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head> <title> [13_fruitSelect.jsp] </title>
<meta charset="UTF-8" >
 
</head>
<body>
 <font size=7 color=blue>[13_fruitSelect.jsp] </font><p>
 <c:choose>
 	<c:when test="${param.fruit==1}">
 		<span style="color:red;  font-size:26pt; "> 사과애플 </span>
 	</c:when>
 	
 	<c:when test="${param.fruit==2}">
 		<span style="color:green;  font-size:26pt; "> 녹색메론 </span>
 	</c:when>
 	
 	 <c:when test="${param.fruit==3}">
 		<span style="color:#FF00FF; font-size:26pt; "> 노란바나나 </span>
 	</c:when>
 </c:choose> 

</body>
</html>







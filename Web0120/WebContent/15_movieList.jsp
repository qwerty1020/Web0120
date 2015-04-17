<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head> <title> [13_movieLst.jsp] </title>
<meta charset="UTF-8" >
 		<style type="text/css">
 			th,td, li{ font-size:26pt; font-weight:bold; }
 		</style>
</head>
<body>
 <font size=7 color=blue> <b> [13_movieList.jsp] </b></font><p>
 <%
 	String[ ] data = {"조선명탐정", "스텔라", "국제시장", "테이큰3", "킹콩" };
    request.setAttribute("nate", data);
    //pageContext.setAttribute("daum",movieList);
 %>
 <table  border="1" width=800>
 	<tr bgcolor=yellow>
 		<th>index</th>  <th>count</th>  <th>title</th>
 	</tr>
 	<c:forEach var="city" items="${nate}" varStatus="i">
 		<tr>
 			<td> ${i.index} </td>
 			<td> ${i.count} </td>
 			<td> ${city} </td>
 		</tr>
 	</c:forEach>
 </table>

 <p>
 <ul type="square">
	<c:forEach var="city"  items="${nate}" varStatus="j">
		<c:choose>
			<c:when test="${j.first}">
				<li style="font-weight:bold; color:red;">${city}</li>
			</c:when>
			<c:otherwise>
				<li>${city}</li>
			</c:otherwise>
		</c:choose>
	</c:forEach> 	
 </ul>
 	
<p><hr>
<!-- 366~367페이지  table태그 그냥 구구단-->
<c:set  var="dan"  value="${7}"/>
<c:catch>
  <c:forEach var="gugu" begin="1"  end="9" step="1">
		<font size=6><b> ${dan}*${gugu}=${dan*gugu}</b></font><br>
  </c:forEach>
</c:catch>

<p><hr>


 <c:set  var="a"    value="${1200}"/>
 <c:set  var="now"  value="<%= new java.util.Date( ) %>" />
 
 <% request.getParameter("UTF-8"); %>
 <fmt:requestEncoding value="UTF-8" />
 
 
 <font size=6><b>
   <fmt:formatDate value="${now}" type="date" pattern="yyyy년-MM월-dd일" />
 </b></font><br>

</body>
</html>




















<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head> <title> [twoDetail.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:20pt; font-weight:bold; font-family:�ü�ü; }
		a{font-size:24pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:16pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<%!  
  private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
  private  int Gsabun; //����ʵ� 
  private  String Gname, Gtitle; //�̸�, �����ʵ�
  private  String Gwriter, Gcontent; //�������, ��۳����ʵ�
  private  int total=0, Gtotal=0; //���ڵ尹��
  
  /////////////////���߿� ����¡���� �ʵ� ���////////////////////////
  private  String  pnum ;
  private  int pageNUM=1 ;
  private  int  pagesize=10, limit=10 , start=1, end=10;
  private  int pagecount=1, startpage=1,  temp=0 ;
  private  String skey="", sval="", sqry="" ; //�Ʒ��� �˻����� �ʵ� 
  private  String pageReturn=""  ; //�˻��� ������Ŭ��
%>
 <font size=7 color=blue>
 <b> 
  &nbsp;&nbsp;&nbsp;&nbsp;[twoDetail.jsp]
 </b></font><br>
 
 <table width='800'  border='1'>
 <tr bgcolor="yellow"  height='60'  align="center">
 	<td>���</td>     <td>�̸�</td>   
 	<td>����</td>     <td>��¥</td>   <td>�޿�</td>      
 </tr> 
 <tr height='60'>
 	<td> ${bean.sabun } </td>
 	<td> ${bean.name } </td>
 	<td> ${bean.title } </td>
 	<td> <fmt:formatDate value="${bean.nalja}" pattern="yyyy-MM-dd"/> </td>
 	<td> ${bean.pay  } </td>
 </tr> 	
</table>

<p>
 <h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="two.jsp">[����Ÿ�Է�]</a> &nbsp;
 	<a href="twoDelete.jsp">[����]</a> &nbsp;
 	<a href="editPre.do?idx=2234">[����]</a> &nbsp;
 	<a href="list.do">[����Ÿ���]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>
<%@ page import="net.hb.common.DBbean"   %>

<html>
<head> <title> [twoListCOPY.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:24pt;  color:red;font-weight:bold; text-decoration:underline;}  
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
 <font size=7 color=blue><b> [twoListCOPY.jsp]</b></font><br>
 
 <table width='800'  border='1'>
 <tr bgcolor="yellow"  height='50'  align="center">
 	<td>���</td>     <td>�̸�</td>   
 	<td>����</td>     <td>��¥</td>   <td>�޿�</td>      
 </tr>
 <%
  try{   
  	 //563������   23���� JSTL�±� ��ȯ 
     List list = (List)request.getAttribute("naver");
     for(int i=0; i<list.size(); i++){
     	DBbean bean = (DBbean)list.get(i);
     	Gsabun = bean.getSabun();
     	Gtitle =  bean.getTitle();
 %>
 	<tr>
 		<td> <%= bean.getSabun() %> </td>
 		<td> <%= bean.getName() %> </td>
 		<td> <a href="detail.do?idx=<%= Gsabun %>"> <%= Gtitle %> </a></td>
 		<td> <%= bean.getNalja() %> </td>
 		<td> <%= bean.getPay() %> </td>
    </tr> 	
 <%    	
     }//for end
  }catch(Exception ex){  }
 %>
</table>

<p>
 <h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<a href="two.jsp">[����Ÿ�Է�]</a> &nbsp;
 	<a href="twoDelete.jsp">[����Ÿ����]</a> &nbsp;
 	<a href="list.do">[����Ÿ���]</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







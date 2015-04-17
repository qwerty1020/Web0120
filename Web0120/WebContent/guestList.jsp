<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestList.jsp] </title> 
	<style type="text/css">
	    input, select, option{ font-size:20pt; font-weight:bold;}
		td,th{ font-size:16pt; font-weight:bold;}
		a{font-size:16pt;color:black; font-weight:bold; text-decoration:none;}
		a:hover{font-size:16pt;  color:red;font-weight:bold; text-decoration:underline;}  
	</style>
</head>
<%!
  private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
  private  Statement  ST, ST2, ST3; //�������  ST=CN.createStatement( )
  private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure����������
  private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
  
  private  String sql; //insert~ , select,  delete, update ~
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

<%
  try{
  	Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
    CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
  	//out.println("<h1>DB���� ���� ����!!!!! </h1>");
  	System.out.println("<h1>DB���� ���� ����!!!!! </h1>");
  }catch(Exception ex){
  	//out.println("<h1>DB���� ���� ����</h1>");
  	System.out.println("����: " + ex.toString() );
  }
%>

<body>
 
 <%
 try{
  //�˻�
  skey = request.getParameter("keyfield");//name,title,content
  sval = request.getParameter("keyword"); //����ڰ� �����Է�
  if(sval=="" || sval==null) {
     skey="" ;  sval=""; 
     pageReturn="";
     sqry = " where  name like '%%'" ;
  }else {  
  	 pageReturn = "&keyfield=" + skey + "&keyword=" + sval;
     sqry = " where " + skey.trim() + " like '%" + sval + "%'" ;
  } 
 	
   sql="select count(*) as cnt  from guest " + sqry ;
   ST=CN.createStatement();
   RS=ST.executeQuery(sql); //RS�� ����ϴ� �� 9
   if(RS.next()==true){
   	 total = RS.getInt("cnt") ;
   }
 }catch(Exception ex){ }
 %>
 
 <table width='900'  border='1'>
  <tr align="right">
     <td colspan=6> 
      <font size=7>���ڵ尹��: <%= total %> </font> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
     </td>
  </tr>
  
 <tr bgcolor="yellow"  height='50'  align="center">
 	<td>�۹�ȣ</td>   <td>���</td>   <td>�̸�</td>   
 	<td>����</td>     <td>��¥</td>   <td>�޿�</td>      
 </tr>
 <%
  try{   
   //sql="select  rownum as rn , sabun, name, title, nalja, pay  from  guest " ; //430������ 15����
   pnum = request.getParameter("pageNUM");
   if(pnum=="" || pnum==null) pnum ="1";
   pageNUM = Integer.parseInt(pnum);
   
   if( total%pagesize==0){ pagecount = total/pagesize; }
   else { pagecount = (total/pagesize) + 1 ;  }
   
   start = (pageNUM-1)*pagesize + 1 ;  //[1] => 1
   end = pageNUM*pagesize ;    //[1] => 10 
   
 sql="select * from  ("  ;
 sql+=" select rownum as rn, sabun,name,title,nalja, pay from  " ;
 sql+=" ( select * from  guest  order by sabun ) " + sqry  ; 
 sql+=" ) where rn between " + start + " and " + end ;
    
   System.out.println( sql  );
   ST=CN.createStatement();
   RS=ST.executeQuery(sql);
   
   //[29]Ŭ���ѻ��¿��� [����] [����] �̵��ϱ� ���ؼ� ���������� 21
   temp = (pageNUM-1)%limit ;    //29-1%10 => 8
   startpage = pageNUM-temp;     //28-8
   
   while(RS.next()==true){
 	Gsabun = RS.getInt("sabun");
 	Gname = RS.getString("name");
 	Gtitle = RS.getString("title");
 //////////////////////////////////////////////////////////////////
 sql3="select count(*) as cnt from guestreply where sabun=" + Gsabun;
 ST3=CN.createStatement();
 RS3=ST3.executeQuery(sql3);
 if(RS3.next()==true){
   Gtotal=RS3.getInt("cnt");	
 }
 //////////////////////////////////////////////////////////////////
 %>
 	<tr
 		onMouseOver="style.backgroundColor='#00FFFF' "
 		onMouseOut="style.backgroundColor=''"
 	>
 		<td> <%= RS.getInt("rn") %> </td>
 		<td> <%= Gsabun %> </td>
 		<td> <%= Gname %> </td>
 		<td>
 		 <a href="guestDetail.jsp?idx=<%= Gsabun %>"> <%= Gtitle %> </a>
 		 <%
 		  if(Gtotal>0) {
 		  %>
 		   <font color=red>[<%= Gtotal %>]</font>
 		 <%}%>
 		 </td>
 		<td> <%= RS.getDate("nalja")  %> </td>
 		<td> <%= RS.getInt("pay") %> </td>
 	</tr>
 
 <%  	
   }//whil end
  }catch(Exception ex){  }
 %>
 <tr align="center">
 	<td colspan=6 style="font-size:20pt;">
<%
   //[����]
   if((startpage-limit) > 0 ) {
   	//out.println("<a ~~~" + (startpage-1) +"'>[����]</a>") ;
   	out.println("<a href='guestList.jsp?pageNUM=" + (startpage-1) +"'>[����]</a>") ;
   }
   		
	for(int i=startpage ; i< (startpage+pagesize); i++){
	   if(i==pageNUM){
	   	 out.println("<font color=red>[" + i + "]</font>") ;
	   }else{
	   	out.println("<a href='guestList.jsp?pageNUM=" + i + pageReturn +"'>[" + i + "]</a>") ;
	   }	
	   if(i>=pagecount)break;
	} //for end
	
	//[����]
  if((startpage+limit) <= pagecount ) {
   	//out.println("<a ~~~" + (startpage+10) +"'>[����]</a>") ;
   	out.println("<a href='guestList.jsp?pageNUM=" + (startpage+10) +"'>[����]</a>") ;
   }
%> 		 		
 	</td>
 </tr>

<p>
    <tr align="center">
	<form  action="guestList.jsp">
	 	<td  colspan=6>
	 		�˻�: &nbsp;
	 		<select name="keyfield">
	 			<option value="name" selected>�̸��˻�</option>
	 			<option value="title"> �� ��</option>
	 			<option value="content"> �� ��</option>
	 		</select>
	 		<input type="text"  name="keyword" value="">
	 		<input type="submit"  value=" �� �� ">
		</td>			
	</form>
	</tr>	
</table>


<p><br>
 <h1>
 	<a href="guest.jsp">����Ÿ�Է�</a> &nbsp;
 	<a href="guestDelete.jsp">����Ÿ����</a> &nbsp;
 	<a href="guestList.jsp">����Ÿ���</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*"   %>
<%@ page import="java.sql.*"   %>

<html>
<head> <title> [guestSave.jsp] </title> 
	<style type="text/css">
	   input,b{ font-size:20pt; font-weight:bold; }
	</style>
</head>
<%!
  private  Connection CN; //db������������ id/pass, CN���� ��ɾ����  	
  private  Statement  ST; //�������  ST=CN.createStatement( )
  private  PreparedStatement  PST;//�̸������ϸ�ɾ� PST=CN.prepareStatement(sql);     
  private  CallableStatement  CST ; //storedProcedure����������
  private  ResultSet RS; //RS=ST.executeQuery("select") ��ȸ�Ѱ��
  
  private  String sql; //insert~ , select,  delete, update ~
  private  int Gsabun; //����ʵ� 
  private  String Gname; //�̸��ʵ�
  private  String Gtitle; //�����ʵ�
  private  int total=0; //���ڵ尹��
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
 <font size=7 color=blue>[guestSave.jsp-�ܵ�����X] </font><p>
<%
   int data1=Integer.parseInt(request.getParameter("sabun"));
   String data2=request.getParameter("name");
   String data3=request.getParameter("title");
   int data4=Integer.parseInt(request.getParameter("pay"));
 
  try{
  	sql="select count(*) as cnt from guest  where sabun = " + data1 ; 
  	ST=CN.createStatement();
  	RS=ST.executeQuery(sql);
  	if(RS.next()==true){
  		total=RS.getInt("cnt");
  	}
  	
   if(total>0){ //id=����=��� �̹� �����Ѵٴ� �ǹ� 
%>
  <script type="text/javascript">
  	alert("<%= data1 %>����� �̹� ��Ͼ����ϴ�");
  	location.href="guest.jsp";
  </script>
  	
<%  			
   }else{ 
		 sql="insert into guest values( ?, ?, ?, sysdate, ?)" ;
		 PST = CN.prepareStatement(sql); 
		  	PST.setInt( 1, data1);
		  	PST.setString( 2, data2);
		  	PST.setString( 3, data3);
		  	PST.setInt( 4, data4);
		 PST.executeUpdate(); //��¥ ����ó��
		 response.sendRedirect("guestList.jsp");
		 out.println("<h1>guest���̺� ���强�� </h1>");
		 System.out.println("<h1>guest���̺� ���强�� </h1>");
    }
  }catch(Exception ex){ 
    System.out.println("�������: " + ex.toString()); 	
    response.sendRedirect("guestList.jsp");
  }
 %>
<font size=7>
	�Ѿ�»��:  <%= data1 %>  <br>
	�Ѿ���̸�:  <%= data2 %> <br>
	�Ѿ������:  <%= data3 %> <br>
	�Ѿ�±޿�:  <%= data4 %> <p>
</font>

 <h1>
 	<a href="guest.jsp">����Ÿ�Է�</a> &nbsp;
 	<a href="guestDelete.jsp">����Ÿ����</a> &nbsp;
 	<a href="guestList.jsp">����Ÿ���</a> 
 </h1>
 <p><br><br><br><br>
 <p><br><br><br><br>
</body>
</html>







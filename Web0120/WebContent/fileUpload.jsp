<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head> <title> [fileUpload.jsp] </title> 
</head>
<body>
 <font size=7 color=blue>[fileUpload.jsp] </font><p>

  <%
	ServletContext ct = config.getServletContext();
    String realPath = ct.getRealPath("filesave");
    
    
    int size = 10*1024*1024;
    DefaultFileRenamePolicy  dp = new DefaultFileRenamePolicy( );
    
    File  file = new File( realPath );
    file.mkdir();
   
    MultipartRequest mr = null ;
    mr = new MultipartRequest( request, realPath, size, "euc-kr" , dp);
  	int data1 = Integer.parseInt( mr.getParameter("sabun") );
  	String data2 = mr.getParameter("name");
  	String data3 = mr.getFilesystemName("file_good");
  	String data4 = mr.getParameter("idx");
  %> 	
  <font size=5>
  	<b>
  		�Ѿ�»��: <%= data1 %><br>
  		�Ѿ���̸�: <%= data2 %><br>
  		�Ѿ������: <%= data3 %><br>
  		�Ѿ�»���: <%= data4 %><p>
  	</b>
  </font> <br>
  
   <h3>���: <%= realPath %></h3>
   
  <a href="fileDownload.jsp?file_name=<%= data3 %>">
  	 <img src="<%= request.getContextPath()%>/filesave/<%=data3 %>"   border="0" width=500 height=300 alt="�׸�"  >           
  </a>
  	
  	<br>    
	<h1>
		<a href="fileSelect.jsp">[���ϼ���fileSelect.jsp]</a>
	</h1>
</body>
</html>







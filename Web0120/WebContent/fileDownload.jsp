<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head> <title> [fileDownload.jsp] </title> 
</head>
<body>
 <font size=7 color=blue>[fileDownload.jsp] </font><p>

 <%
	ServletContext ct = config.getServletContext();
    String realPath = ct.getRealPath("filesave");
    byte[ ]  b = new  byte[4096]; // 4*1024*12024
    
    String fileName = request.getParameter("file_name");
    String sFilePath = realPath + "\\" + fileName;
    System.out.println( sFilePath ); 
   
   try{
   	FileInputStream  in2  =  new  FileInputStream(sFilePath); 
   	String  sMimeType = this.getServletContext().getMimeType(sFilePath);
   	out.println("<h2>" + sMimeType + "</h2>");
   	if(sMimeType==null) sMimeType="application/octet-stream";
   	response.setContentType(sMimeType);
    System.out.println( sMimeType ); 
    String  sEncoding = new  String( fileName.getBytes("euc-kr"), "8859_1");
   	response.setHeader("Content-Disposition", "attachment;filename=" + sEncoding);
    
   	ServletOutputStream  out2 = response.getOutputStream();
   	int  numRead=0;
   	
   	while((numRead = in2.read(b, 0, b.length )) != -1  ) {
   	  out2.write(b, 0, numRead);
   	}//while end
   	
   	in2.close(); out2.close();
   }catch(Exception ex){ }
 %> 
  
  <p><h1>
	<a href="fileSelect.jsp">[파일선택fileSelect.jsp]</a>
  </h1>
</body>
</html>







package net.hb.common;

import  java.sql.*;

public class DB {
		public static  Connection  getConnection( ){
			 Connection CN = null ;
		  try{
		   	 Class.forName("oracle.jdbc.driver.OracleDriver");//1�ܰ� ����̺�ε�
		     String url="jdbc:oracle:thin:@127.0.0.1:1521:XE"; //DB����������� 430������ 12����
		     CN=DriverManager.getConnection(url, "system","oracle"); //32���� 
		  	 System.out.println("DB���� ���� ����!!!!!");
		  }catch(Exception ex){
		  	 System.out.println("����: " + ex.toString() );
		  }
			 return CN;
		}//end
}//class end

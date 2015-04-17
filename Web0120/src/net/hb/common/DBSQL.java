package net.hb.common;

import  java.sql.*;
import  java.util.*;  //List, ArrayList, Date
import  java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class DBSQL {
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
			 
			 private  String  pnum ;
			 private  int pageNUM=1 ;
			 private  int  pagesize=10, limit=10 , start=1, end=10;
			 private  int pagecount=1, startpage=1,  temp=0 ;
			 private  String skey="", sval="", sqry="" ; //�Ʒ��� �˻����� �ʵ� 
			 private  String pageReturn=""  ; //�˻��� ������Ŭ��
	
				public  DBSQL( ){
					//CN=DB.getConnection(); �ּ�ó���ϼ���
					
					//2��° META-INF/context.xml���� <Resource name="jdbc/snow"
				 try{
					Context ct = new InitialContext();
					DataSource ds =(DataSource)ct.lookup("java:comp/env/jdbc/snow");
					CN=ds.getConnection();
					System.out.println("<=========DBSQL( )������ DBCP ���Ἲ��=========>\n");
				 }catch(Exception ex){System.out.println("�������: " + ex.toString()); }	
					
				}//DBSQL������ end
				
			public void  dbInsert(DBbean bean){//InsertController.javaȣ��
				try{
					sql="insert into guest values(?, ?, ?, sysdate, ?)" ; 
					PST=CN.prepareStatement(sql);
									PST.setInt(1, bean.getSabun());
									PST.setString(2, bean.getName());
									PST.setString(3, bean.getTitle());
									PST.setInt(4, bean.getPay());
					PST.executeUpdate(); 
					System.out.println("dbInsert(DBbean) ���强��\n");
				}catch(Exception ex){System.out.println( ex.toString()) ; }
			}//end==========================================================
		
			public List<DBbean>  dbSelect( ){ //ListController.javaȣ��
				List<DBbean>  list = new ArrayList( );
				try{
						sql ="select * from guest order by sabun " ;
						ST = CN.createStatement();
						RS = ST.executeQuery(sql);
						while(RS.next()==true){
							 DBbean  bean  = new  DBbean( );
							 bean.setSabun( RS.getInt("sabun"));
							 bean.setName( RS.getString("name"));
							 bean.setTitle( RS.getString("title"));
							 bean.setNalja( RS.getDate( "nalja"));
							 bean.setPay( RS.getInt("pay"));
							 list.add(bean);//add����� bean��ü����
						}//while end
				}catch(Exception ex){System.out.println( ex.toString()) ; }
				return list ; 
			}//dbSelect( ) end==============================================
			
			public  DBbean  dbDetail(String data ){//DetailController.javaȣ��
				DBbean  bean  = new  DBbean( );
				try{
					sql ="select * from guest where sabun = " + data ;
					ST = CN.createStatement();
					RS = ST.executeQuery(sql);
					if(RS.next()==true){
						 bean.setSabun( RS.getInt("sabun"));
						 bean.setName( RS.getString("name"));
						 bean.setTitle( RS.getString("title"));
						 bean.setNalja( RS.getDate( "nalja"));
						 bean.setPay( RS.getInt("pay"));
					}//if end
				}catch(Exception ex){System.out.println( ex.toString()) ; }
				return bean;
			}//dbDetail(String)end
			
			public  void  dbDelete(String data ){//DeleteController.javaȣ��
				try{
			    
					//sql ="select * from guest where sabun = ? " ;
					//PST = CN.prepareStatement(sql);
					//PST.setString(1,data);
					//PST.executeUpdate(); //�Ű����� ����
					
					sql ="select * from guest where sabun = " + data ; 
					ST=CN.createStatement();
					ST.executeUpdate(sql);
				
					
					System.out.println(data + "��������");
				}catch(Exception ex){System.out.println ( "����: " + ex.toString()) ;} 
			}//dbDetele(String)end
}//class end




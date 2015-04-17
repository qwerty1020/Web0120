package net.hb.common;

import  java.sql.*;
import  java.util.*;  //List, ArrayList, Date
import  java.io.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class DBSQL {
			 private  Connection CN; //db서버연결정보 id/pass, CN참조 명령어생성  	
			 private  Statement  ST, ST2, ST3; //정적명령  ST=CN.createStatement( )
			 private  PreparedStatement  PST;//미리컴파일명령어 PST=CN.prepareStatement(sql);     
			 private  CallableStatement  CST ; //storedProcedure쿼리문실행
			 private  ResultSet RS, RS2, RS3 ; //RS=ST.executeQuery("select") 조회한결과
			 
			 private  String sql; //insert~ , select,  delete, update ~
			 private  String sql2="",  sql3=""; //select   count(*)  as cnt  from  guestreply  where  sabun=2234 ;
			 private  int Gsabun; //사번필드 
			 private  String Gname, Gtitle; //이름, 제목필드
			 private  String Gwriter, Gcontent; //댓글저자, 댓글내용필드
			 private  int total=0, Gtotal=0; //레코드갯수
			 
			 private  String  pnum ;
			 private  int pageNUM=1 ;
			 private  int  pagesize=10, limit=10 , start=1, end=10;
			 private  int pagecount=1, startpage=1,  temp=0 ;
			 private  String skey="", sval="", sqry="" ; //아래쪽 검색연결 필드 
			 private  String pageReturn=""  ; //검색시 페이지클릭
	
				public  DBSQL( ){
					//CN=DB.getConnection(); 주석처리하세요
					
					//2번째 META-INF/context.xml문서 <Resource name="jdbc/snow"
				 try{
					Context ct = new InitialContext();
					DataSource ds =(DataSource)ct.lookup("java:comp/env/jdbc/snow");
					CN=ds.getConnection();
					System.out.println("<=========DBSQL( )생성자 DBCP 연결성공=========>\n");
				 }catch(Exception ex){System.out.println("연결실패: " + ex.toString()); }	
					
				}//DBSQL생성자 end
				
			public void  dbInsert(DBbean bean){//InsertController.java호출
				try{
					sql="insert into guest values(?, ?, ?, sysdate, ?)" ; 
					PST=CN.prepareStatement(sql);
									PST.setInt(1, bean.getSabun());
									PST.setString(2, bean.getName());
									PST.setString(3, bean.getTitle());
									PST.setInt(4, bean.getPay());
					PST.executeUpdate(); 
					System.out.println("dbInsert(DBbean) 저장성공\n");
				}catch(Exception ex){System.out.println( ex.toString()) ; }
			}//end==========================================================
		
			public List<DBbean>  dbSelect( ){ //ListController.java호출
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
							 list.add(bean);//add대상을 bean객체지정
						}//while end
				}catch(Exception ex){System.out.println( ex.toString()) ; }
				return list ; 
			}//dbSelect( ) end==============================================
			
			public  DBbean  dbDetail(String data ){//DetailController.java호출
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
			
			public  void  dbDelete(String data ){//DeleteController.java호출
				try{
			    
					//sql ="select * from guest where sabun = ? " ;
					//PST = CN.prepareStatement(sql);
					//PST.setString(1,data);
					//PST.executeUpdate(); //매개인자 없음
					
					sql ="select * from guest where sabun = " + data ; 
					ST=CN.createStatement();
					ST.executeUpdate(sql);
				
					
					System.out.println(data + "삭제성공");
				}catch(Exception ex){System.out.println ( "삭제: " + ex.toString()) ;} 
			}//dbDetele(String)end
}//class end




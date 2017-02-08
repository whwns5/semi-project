package semi.adminproduct;

import java.sql.*;
import java.sql.Date;
import java.util.*;
public class adminproductDAO {
	Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    public static final String USERS_HOME="I:/workspace/semi/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/ebbs/upload";
    public static final String USERS="I:/workspace/semi/myweb/WebContent/ebbs/upload";
	
	
	/**이벤트 등록 메서드*/
	public int eventWrite(String imgname,String subject, String content, String startdate, String enddate){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="insert into e_bbs values(e_bbs_idx.nextval,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, imgname);
			ps.setString(2, subject);
			ps.setString(3, content);
			ps.setString(4, startdate);
			ps.setString(5, enddate);
			
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**이벤트 리스트 */
	public ArrayList<adminproductDTO> eventList(int ecp, int ls){
		try{
			ArrayList<adminproductDTO> arr=new ArrayList<adminproductDTO>();
			adminproductDTO edto=null;
			conn=semi.db.semiDB.getConn();
			String sql="select * from (select rownum as rnum,a.* from "
					+ "(select * from e_bbs)a)b "
					+ "where rnum>=("+ecp+"-1)*"+ls+"+1 and rnum<="+ecp+"*"+ls+" order by idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				do{
					int idx=rs.getInt("idx");
					String imgname=rs.getString("imgname");
					String subject=rs.getString("subject");
					String content=rs.getString("content");
					String startdate=rs.getString("startdate");
					String enddate=rs.getString("enddate");
					Date writedate=rs.getDate("writedate");
					
					edto=new adminproductDTO(idx, imgname, subject, content, startdate, enddate , writedate);
					arr.add(edto);
				}while(rs.next());
			}
			System.out.println("dao="+arr.size());
			return arr;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**이벤트 삭제 메서드*/               //구축중
	public int eventDelete(int idx){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="delete e_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
		    
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**이벤트 수정 메서드*/
	public int eventUpdate(int idx, String subject, String content, String imgname){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="update e_bbs set subject=?,content=?,imgname=?,writedate=sysdate where idx=?";
			ps=conn.prepareStatement(sql);
		    ps.setString(1, subject);
		    ps.setString(2, content);
		    ps.setString(3, imgname);
		    ps.setInt(4, idx);
			int count=ps.executeUpdate();
			
			 
			return count;
		}catch(Exception e){
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**이벤트 목록 상세보기 메서드*/
	public EbbsDTO eventContent(int idx){
		try{
			
			EbbsDTO edto=null;
			conn=semi.db.semiDB.getConn();
			String sql="select * from e_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			if(rs.next()){
				do{
					
					String imgname=rs.getString("imgname");
					String subject=rs.getString("subject");
					String content=rs.getString("content");
					String startdate=rs.getString("startdate");
					String enddate=rs.getString("enddate");
					Date writedate=rs.getDate("writedate");
					
					edto=new EbbsDTO(idx, imgname, subject, content, startdate, enddate , writedate);
					
				}while(rs.next());
			}
			
			return edto;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**총게시물수 관련 메서드*/
	public int getTotalCnt(){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="select count(*) from e_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			
			return count;
		}catch(Exception e){
			e.printStackTrace();
			return 1;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
}

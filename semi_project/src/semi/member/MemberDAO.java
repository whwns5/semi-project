package semi.member;

import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int NOT_ID=1; //상수를 사용 final을 붙임으로써 값을 바꿀수 없게 함
	public static final int	NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public MemberDAO(){
		System.out.println("MemberDAO()객체 생성됨!!");
	}
	
	/**회원 가입 관련 메서드*/
	public int memberJoin(MemberDTO dto){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="insert into member_table(member_id,member_name,member_pwd,member_sex,member_email,member_tel,member_addr)"
					+ " values(?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getMember_id());
			ps.setString(2, dto.getMember_name());
			ps.setString(3, dto.getMember_pwd());
			ps.setString(4, dto.getMember_sex());
			ps.setString(5, dto.getMember_email());
			ps.setString(6, dto.getMember_tel());
			ps.setString(7, dto.getMember_addr());
			
			int count=ps.executeUpdate();
			System.out.println("2");
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	/**아이디 중복검사 관련 메서드*/
	public boolean idCheck(String userid){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="select member_id from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			rs=ps.executeQuery();
			return rs.next();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	/**회원 탈퇴 관련 메서드*/
	public int memberdel(String member_id,String member_pwd){
		try{
			conn=semi.db.semiDB.getConn();
			
			String sql="delete from member_table where member_id=? and member_pwd=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			ps.setString(2, member_pwd);
			int count=ps.executeUpdate();
			return count;			
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	
	public int loginCheck(String member_id, String member_pwd){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="select member_pwd from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id.toUpperCase());
			
			rs=ps.executeQuery();
			
			if(rs.next()){
				String db_pwd=rs.getString("member_pwd");
				if(member_pwd.equals(db_pwd)){
					return LOGIN_OK;
				}else{
					return NOT_PWD;
				}
			}else{
				return NOT_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
}



























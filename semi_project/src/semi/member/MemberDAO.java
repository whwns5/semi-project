package semi.member;

import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO(){
		System.out.println("MemberDAO()객체 생성됨!!");
	}
	
	/**회원 가입 관련 메서드*/
	public int memberJoin(MemberDTO dto){
		try{
			conn=semi.db.semiDB.getConn();
			
			String sql="insert into member_table(member_id,member_name,member_pwd,member_birthday,member_sex,member_email,member_tel,member_addr)"
					+ " values(?,?,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getMember_id());
			ps.setString(2, dto.getMember_name());
			ps.setString(3, dto.getMember_pwd());
			ps.setDate(4, dto.getMember_birthday());
			ps.setString(5, dto.getMember_sex());
			ps.setString(6, dto.getMember_email());
			ps.setString(7, dto.getMember_tel());
			ps.setString(8, dto.getMember_addr());
			
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}finally{
			try{
				
			}catch(Exception e2){
				
			}
		}
	}
}

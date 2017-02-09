package semi.member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import semi.member.MemberDTO;
import semi.product.ProductDTO;
import semi.sql.Sql;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int NOT_ID=1; //상수를 사용 final을 붙임으로써 값을 바꿀수 없게 함
	public static final int	NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public MemberDAO(){
	
	}
	
	/**회원 가입 관련 메서드*/
	public int memberJoin(MemberDTO dto){
		try{
			
			conn=semi.db.semiDB.getConn();
			String sql="insert into member_table values(member_table_idx.NEXTVAL, "
					+ "?, " // member_id
					+ "'고객', " // member_type
					+ "?, " // member_name
					+ "?, " // member_pwd
					+ "?, " // member_sex
					+ "?, " // member_email
					+ "?, " // member_tel
					+ "?, " // member_addr
					+ "NULL)"; // member_coupon
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getMember_id());
			ps.setString(2, dto.getMember_name());
			ps.setString(3, dto.getMember_pwd());
			ps.setString(4, dto.getMember_sex());
			ps.setString(5, dto.getMember_email());
			ps.setString(6, dto.getMember_tel());
			ps.setString(7, dto.getMember_addr());
			
			int count = ps.executeUpdate();
			return 1;
			
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
	/**로그인 관련 메서드*/
	public int loginCheck(String member_id, String member_pwd){
		try {
			conn=semi.db.semiDB.getConn();
			String sql="select member_pwd from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			
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
	/**로그인 정보 저장 메서드*/
	public String getUserInfo1(String member_id){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="select member_name from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
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
	/**회원 정보 보기 관련 메서드*/
	public MemberDTO[] userInfo(String member_id)
	{
		
		try 
		{
			conn=semi.db.semiDB.getConn();
			String sql="select * from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_id);
			rs=ps.executeQuery();
	
			Vector<MemberDTO> v = new Vector<MemberDTO>();
			if(rs.next()){
			String id = rs.getString("member_id");
			String type = rs.getString("member_type");
			String name = rs.getString("member_name");
			String pwd = rs.getString("member_pwd");
			String sex = rs.getString("member_sex");
			String email = rs.getString("member_email");
			String tel = rs.getString("member_tel");
			String addr = rs.getString("member_addr");
			String coupon = rs.getString("member_coupon");
			MemberDTO mDto = new MemberDTO(id, type, name, pwd, sex, email, tel, addr, coupon);
			v.add(mDto);
		
			}
		
			MemberDTO[] dto=new MemberDTO[v.size()];
			v.copyInto(dto);
			return dto;
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		finally
		{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	/**회원정보 수정 관련 메서드*/
	public int memberChange(MemberDTO dto){
		try{
			conn=semi.db.semiDB.getConn();
			String sql="update member_table set "
					+ "member_name=?, "
					+ "member_pwd=?, "
					+ "member_sex=?, "
					+ "member_addr=?, "
					+ "member_tel=?, "
					+ "member_email=? "
					+ "where member_id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, dto.getMember_name());
			ps.setString(2, dto.getMember_pwd());
			ps.setString(3, dto.getMember_sex());
			ps.setString(4, dto.getMember_addr());
			ps.setString(5, dto.getMember_tel());
			ps.setString(6, dto.getMember_email());
			ps.setString(7, dto.getMember_id());
			
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
	
	/**1명의 회원정보 불러오기*/
	public MemberDTO memberGet(String member_ids){
		try{
			MemberDTO dto=null;
			conn=semi.db.semiDB.getConn();
			String sql="select * from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, member_ids);
			rs=ps.executeQuery();
			if(rs.next()){
				String member_id=rs.getString("member_id");
				String member_name=rs.getString("member_name");
				String member_type=rs.getString("member_type");
				String member_pwd=rs.getString("member_pwd");
				String member_sex=rs.getString("member_sex");
				String member_email=rs.getString("member_email");
				String member_tel=rs.getString("member_tel");
				String member_addr=rs.getString("member_addr");
				String member_coupon=rs.getString("member_coupon");
				dto=new MemberDTO(member_id, member_type, member_name, member_pwd, member_sex, member_email, member_tel, member_addr, member_coupon);
			}
			return dto;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			}catch(Exception e2){
				
			}
		}
	}
	/* 회원검색 관련 메서드 */
	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue) {
		try {
			conn = semi.db.semiDB.getConn();
			String sql = "select * from member_table where " + fkey + "=?";
			
			// 임파라미터는 value값에만 적용된다.
			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			while (rs.next()) {
				int idx = rs.getInt("member_idx");
				String id = rs.getString("member_id");
				String name = rs.getString("member_name");
				String pwd = rs.getString("member_pwd");
				String sex=rs.getString("member_sex");
				String email=rs.getString("member_email");
				String tel = rs.getString("member_tel");
				String addr = rs.getString("member_addr");
				
				MemberDTO dto = new MemberDTO(idx,id,name,pwd,sex,email,tel,addr);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}

	}

	
	/**사용자 정보 획득 관련 메서드*/
	public String getUserInfo(String userid){
		try{
			conn = semi.db.semiDB.getConn();
			String sql="select member_name from member_table where member_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){
				
			}
		}
	}
	/**사원삭제*/
	public int empDel(MemberDTO dto){
		try{
			conn = semi.db.semiDB.getConn();
			String sql="delete from member_table where member_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,dto.getMember_idx());
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
	public int updateContent(MemberDTO dto){
		try{
			
			//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&" + dto.getAddr());
			conn = semi.db.semiDB.getConn();
			String sql="update member_table set member_name=?,member_addr=?,member_tel=?,member_id=?,member_email=?,member_pwd=?,member_sex=? where member_idx =?";
			//update jsp_member set name='jang',idx=1,addr='서울',tel='010-2929-3993',id='kkkk' where id ='hong'
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getMember_name());
			
			ps.setString(2, dto.getMember_addr());
			
			ps.setString(3,dto.getMember_tel());
			
			ps.setString(4,dto.getMember_id());
			
			ps.setString(5, dto.getMember_email());
			
			ps.setString(6, dto.getMember_pwd());
			
			ps.setString(7, dto.getMember_sex());
			
			ps.setInt(8,dto.getMember_idx());
			
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
	/**회원리스트 관련메서드*/
	public ArrayList<MemberDTO> MemberList(){
		try{
			conn = semi.db.semiDB.getConn();
			
			String sql="select * from member_table";
			

			ps = conn.prepareStatement(sql);
			System.out.println("&&&&&&&&&&&&&&"+sql);
			rs = ps.executeQuery();
			
			ArrayList<MemberDTO> arr_mdto = new ArrayList<MemberDTO>();
			
			while(rs.next()){
				int member_idx = rs.getInt("member_idx");
				String member_id = rs.getString("member_id");
				String member_name = rs.getString("member_name");
				String member_pwd = rs.getString("member_pwd");
				String member_sex = rs.getString("member_sex");
				String member_email = rs.getString("member_email");
				String member_tel = rs.getString("member_tel");
				String member_addr = rs.getString("member_addr");
				
				
				
				MemberDTO mdto = new MemberDTO(member_idx, member_id, member_name,
						member_pwd, member_sex, member_email, member_tel, member_addr);
						
			
				arr_mdto.add(mdto);
			}
		
			return arr_mdto;

		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}





















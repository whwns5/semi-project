package semi.qna;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import semi.product.ProductDTO;
import semi.sql.Sql;

/** 
 * Q&A 관련 DAO
 * 
 * @author 조준현
 * @since 2017.01.31
 * */
public class QnaDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private final int ERROR = -1;
	
	public QnaDAO(){
		
	}
	
	/** 
	 * Q&A 조회 관련 메서드
	 * @param void
	 * @return ArrayList<QnaDTO>
	 * */
	public ArrayList<QnaDTO> qnaList(){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.QNA_SELECT_ALL);
			
			rs = ps.executeQuery();
			
			ArrayList<QnaDTO> arr_qdto = new ArrayList<QnaDTO>();
			
			while(rs.next()){
				int qna_idx = rs.getInt("qna_idx");
				String member_id = rs.getString("member_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				Date qna_regdate = rs.getDate("qna_regdate");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev = rs.getInt("qna_lev");
				int qna_sunbun = rs.getInt("qna_sunbun");
						
				QnaDTO qdto = new QnaDTO(qna_idx, member_id, qna_subject, qna_content, qna_regdate, qna_ref, qna_lev, qna_sunbun);
			
				arr_qdto.add(qdto);
			}
			
			return arr_qdto;

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
	/** 
	 * ref 최고값 조회 관련 메서드
	 * @param void
	 * @return int
	 * */
	public int getMaxRef(){
		try{
			
			ps = conn.prepareStatement(Sql.QNA_SELECT_MAX_REF);
			rs = ps.executeQuery();
			
			int max = 0; // 게시글이 아무것도 없을 시 max그룹함수는 null이 넘어 오므로 0으로 초기화
			if(rs.next()){
				max = rs.getInt(1);
			}
			
			return max;
			
		} catch (Exception e){
			e.printStackTrace();
			return 0;
		} finally {
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 입력 관련 메서드
	 * @param QnaDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int productAdd(QnaDTO qdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.QNA_INSERT);
			int maxRef = getMaxRef();
			ps.setString(1, qdto.getMember_id());
			ps.setString(2, qdto.getQna_subject());
			ps.setString(3, qdto.getQna_content());
			
			ps.setInt(4, maxRef+1); // 최고값에 +1을 하여 다음 ref를 지정한다.
			ps.setInt(5, 0);
			ps.setInt(6, 0);
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e){
			e.printStackTrace();
			return ERROR;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 순번 업데이트 관련 메서드
	 * @param ref, sun
	 * @return void
	 * */
	public void updateSun(int ref, int sun){
		try{
			ps = conn.prepareStatement(Sql.QNA_UPDATE_SUNBUN);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			ps.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			try{
				if(ps!=null)ps.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 댓글 입력 관련 메서드
	 * @param QnaDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int bbsReWrite(QnaDTO qdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			updateSun(qdto.getQna_ref(), qdto.getQna_sunbun() + 1);
		
			ps = conn.prepareStatement(Sql.QNA_INSERT_REPLY);
			ps.setString(1, qdto.getMember_id());
			ps.setString(2, qdto.getQna_subject());
			ps.setString(3, qdto.getQna_content());
			
			ps.setInt(4, qdto.getQna_ref()); // 답변글을 쓸때는								
			ps.setInt(5, qdto.getQna_lev() + 1); // 본문글과 같은 ref로 지정
			ps.setInt(6, qdto.getQna_sunbun() + 1); // l , s는 1씩 증가
			
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	}
}

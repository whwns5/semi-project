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
	 * Q&A 상품별 총 갯수 조회 관련 메서드
	 * @param product_idx
	 * @return count
	 * */
	public int getQnaTotalCnt(int product_idx){
		try{
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.QNA_PRODUCTIDX_TOTALCOUNT);
			
			ps.setInt(1, product_idx);
			
			rs = ps.executeQuery();
			
			rs.next(); // COUNT(*) 의 결과 값은 무조건 나오기 때문
			
			int count = rs.getInt(1);
			
			count = count == 0 ? 1 : count;
		
			return count;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 문의 내역 조회 관련 메서드
	 * @param product_idx
	 * @return count
	 * */
	public int getQnaUserTotalCnt(String member_id){
		try{
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.QNA_MEMBERID_TOTALCOUNT);
			
			ps.setString(1, member_id);
			
			rs = ps.executeQuery();
			
			rs.next(); // COUNT(*) 의 결과 값은 무조건 나오기 때문
			
			int count = rs.getInt(1);
			
			count = count == 0 ? 1 : count;
		
			return count;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 관리자 갯수 조회 관련 메서드
	 * @param product_idx
	 * @return count
	 * */
	public int getQnaAdminTotalCnt(){
		try{
			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.QNA_ADMIN_TOTALCOUNT);
			
			rs = ps.executeQuery();
			
			rs.next(); // COUNT(*) 의 결과 값은 무조건 나오기 때문
			
			int count = rs.getInt(1);
			
			count = count == 0 ? 1 : count;
		
			return count;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 조회 관련 메서드(페이징)
	 * @param product_idx, cp, listSize
	 * @return ArrayList<QnaDTO>
	 * */
	public ArrayList<QnaDTO> qnaList(int product_idx, int cp, int listSize){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.getQNA_PRODUCTIDX_SELECT_ALL_ORDERBY(cp, listSize));
			ps.setInt(1, product_idx);
			rs = ps.executeQuery();
			
			ArrayList<QnaDTO> arr_qdto = new ArrayList<QnaDTO>();
			
			while(rs.next()){
				int qna_idx = rs.getInt("qna_idx");
				int product_idx_temp = rs.getInt("product_idx");
				String member_id = rs.getString("member_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				int qna_state = rs.getInt("qna_state");
				Date qna_regdate = rs.getDate("qna_regdate");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev = rs.getInt("qna_lev");
				int qna_sunbun = rs.getInt("qna_sunbun");
						
				QnaDTO qdto = new QnaDTO(qna_idx, product_idx_temp, member_id, qna_subject, 
						qna_content, qna_state, qna_regdate, qna_ref, qna_lev, qna_sunbun);
				
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
	 * Q&A 관리자 조회 관련 메서드(페이징)
	 * @param product_idx, cp, listSize
	 * @return ArrayList<QnaDTO>
	 * */
	public ArrayList<QnaDTO> qnaAdminList(int cp, int listSize){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.getQNA_ADMIN_SELECT_ALL_ORDERBY(cp, listSize));
			rs = ps.executeQuery();
			
			ArrayList<QnaDTO> arr_qdto = new ArrayList<QnaDTO>();
			
			while(rs.next()){
				int qna_idx = rs.getInt("qna_idx");
				int product_idx_temp = rs.getInt("product_idx");
				String member_id = rs.getString("member_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				int qna_state = rs.getInt("qna_state");
				Date qna_regdate = rs.getDate("qna_regdate");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev = rs.getInt("qna_lev");
				int qna_sunbun = rs.getInt("qna_sunbun");
						
				QnaDTO qdto = new QnaDTO(qna_idx, product_idx_temp, member_id, qna_subject, 
						qna_content, qna_state, qna_regdate, qna_ref, qna_lev, qna_sunbun);
				
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
	 * Q&A 문의 내역 조회 관련 메서드(페이징)
	 * @param member_id, cp, listSize
	 * @return ArrayList<QnaDTO>
	 * */
	public ArrayList<QnaDTO> qnaUserList(String member_id, int cp, int listSize){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.getQNA_MEMBERID_SELECT_ALL_ORDERBY(cp, listSize));
			ps.setString(1, member_id);
			rs = ps.executeQuery();
			
			ArrayList<QnaDTO> arr_qdto = new ArrayList<QnaDTO>();
			
			while(rs.next()){
				int qna_idx = rs.getInt("qna_idx");
				int product_idx = rs.getInt("product_idx");
				String member_id_temp = rs.getString("member_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_content");
				int qna_state = rs.getInt("qna_state");
				Date qna_regdate = rs.getDate("qna_regdate");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev = rs.getInt("qna_lev");
				int qna_sunbun = rs.getInt("qna_sunbun");
						
				QnaDTO qdto = new QnaDTO(qna_idx, product_idx, member_id_temp, qna_subject, 
						qna_content, qna_state, qna_regdate, qna_ref, qna_lev, qna_sunbun);
				
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
	 * Q&A ref 최고값 조회 관련 메서드
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
	public int qnaWrite(QnaDTO qdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			int maxRef = getMaxRef();
			
			ps = conn.prepareStatement(Sql.QNA_INSERT);
			

			ps.setInt(1, qdto.getProduct_idx());
			ps.setString(2, qdto.getMember_id());
			ps.setString(3, qdto.getQna_subject());
			ps.setString(4, qdto.getQna_content());
			
			ps.setInt(5, maxRef+1); // 최고값에 +1을 하여 다음 ref를 지정한다.
			ps.setInt(6, 0);
			ps.setInt(7, 0);
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
	 * Q&A 답변 입력시 질문글 상태 변환 관련 메서드
	 * @param qna_idx
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int qnaQuestionStateUpdate(int qna_idx){
		try{
			ps = conn.prepareStatement(Sql.QNA_UPDATE_QUESTION_STATE);
			ps.setInt(1, qna_idx);
	
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try{
				if(ps!=null)ps.close();
			} catch (Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/** 
	 * Q&A 답변 입력 관련 메서드
	 * @param QnaDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int qnaReWrite(QnaDTO qdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			qnaQuestionStateUpdate(qdto.getQna_idx());
			updateSun(qdto.getQna_ref(), qdto.getQna_sunbun() + 1);
		
			ps = conn.prepareStatement(Sql.QNA_INSERT_REPLY);
			ps.setInt(1, qdto.getProduct_idx());
			ps.setString(2, qdto.getMember_id());
			ps.setString(3, qdto.getQna_subject());
			ps.setString(4, qdto.getQna_content());
			
			ps.setInt(5, qdto.getQna_ref()); // 답변글을 쓸때는								
			ps.setInt(6, qdto.getQna_lev() + 1); // 본문글과 같은 ref로 지정
			ps.setInt(7, qdto.getQna_sunbun() + 1); // l , s는 1씩 증가
			
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
	
	/** 
	 * Q&A 답변 입력 관련 메서드
	 * @param QnaDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int qnaDel(QnaDTO qdto){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.QNA_DELETE);
			
			ps.setInt(1, qdto.getQna_idx());
		
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

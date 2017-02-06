package semi.review;

import java.io.File;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.plaf.synth.SynthSeparatorUI;

import semi.qna.QnaDTO;
import semi.sql.Sql;

/** 
 * 리뷰 관련 DAO
 * 
 * @author 조준현
 * @since 2017.02.03
 * */
public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private final int ERROR = -1;
	
	public ReviewDAO(){

	}
	
	/** 
	 * 리뷰 상품별 총 갯수 조회 관련 메서드
	 * @param product_idx
	 * @return count
	 * */
	public int getReviewTotalCnt(int product_idx){
		try{

			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.REVIEW_PRODUCTIDX_TOTALCOUNT);
			
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
	 * 리뷰 조회 관련 메서드(페이징)
	 * @param product_idx, cp, listSize
	 * @return ArrayList<ReviewDTO>
	 * */
	public ArrayList<ReviewDTO> reviewList(int product_idx, int cp, int listSize){
		try{
			conn = semi.db.semiDB.getConn();
		
			ps = conn.prepareStatement(Sql.getREVIEW_PRODUCTIDX_SELECT_ALL_ORDERBY(cp, listSize));
			ps.setInt(1, product_idx);
			rs = ps.executeQuery();
			
			ArrayList<ReviewDTO> arr_rdto = new ArrayList<ReviewDTO>();
			
			while(rs.next()){
				int review_idx = rs.getInt("review_idx");
				int product_idx_temp = rs.getInt("product_idx");
				String member_id = rs.getString("member_id");
				String review_subject = rs.getString("review_subject");
				String review_content = rs.getString("review_content");
				Date review_regdate = rs.getDate("review_regdate");
				int review_grade = rs.getInt("review_grade");
				String review_img = rs.getString("review_img");
				int review_ref = rs.getInt("review_ref");
				int review_lev = rs.getInt("review_lev");
				int review_sunbun = rs.getInt("review_sunbun");
						
				ReviewDTO rdto = new ReviewDTO(review_idx, product_idx_temp, member_id,
						review_subject, review_content, review_regdate, review_grade,
						review_img, review_ref, review_lev, review_sunbun);
			
				arr_rdto.add(rdto);
			}
			
			return arr_rdto;

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
	 * 리뷰 ref 최고값 조회 관련 메서드
	 * @param void
	 * @return int
	 * */
	public int getMaxRef(){
		try{
			
			ps = conn.prepareStatement(Sql.REVIEW_SELECT_MAX_REF);
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
	 * 리뷰 테이블 입력 관련 메서드
	 * @param ReviewDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int reviewWrite(ReviewDTO rdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			int maxRef = getMaxRef();
			
			
			if(rdto.getReview_img() != null){
				String originalFileName = rdto.getReview_img();
				String fileType = originalFileName.substring(originalFileName.indexOf('.'), originalFileName.length());
			
				ps = conn.prepareStatement(Sql.getREVIEW_INSERT_IMAGE(rdto.getMember_id(), rdto.getProduct_idx(), fileType));
			} else {
				ps = conn.prepareStatement(Sql.REVIEW_INSERT);
			}

			ps.setInt(1, rdto.getProduct_idx());
			ps.setString(2, rdto.getMember_id());
			ps.setString(3, rdto.getReview_subject());
			ps.setString(4, rdto.getReview_content());
			ps.setInt(5, rdto.getReview_grade());
			
			ps.setInt(6, maxRef+1); // 최고값에 +1을 하여 다음 ref를 지정한다.
			ps.setInt(7, 0);
			ps.setInt(8, 0);
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
	 * 리뷰 테이블 순번 업데이트 관련 메서드
	 * @param ref, sun
	 * @return void
	 * */
	public void updateSun(int ref, int sun){
		try{
			
			ps = conn.prepareStatement(Sql.REVIEW_UPDATE_SUNBUN);
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
	 * 리뷰 댓글 입력 관련 메서드
	 * @param ReviewDTO
	 * @return int (실행횟수 혹은 에러)
	 * */
	public int reviewReWrite(ReviewDTO rdto){
		try{
			conn = semi.db.semiDB.getConn();
			
			updateSun(rdto.getReview_ref(), rdto.getReview_sunbun() + 1);
		
			ps = conn.prepareStatement(Sql.REVIEW_INSERT_REPLY);
			ps.setInt(1, rdto.getProduct_idx());
			ps.setString(2, rdto.getMember_id());
			ps.setString(3, rdto.getReview_subject());
			ps.setString(4, rdto.getReview_content());
			
			ps.setInt(5, rdto.getReview_ref()); // 답변글을 쓸때는	
			ps.setInt(6, rdto.getReview_lev() + 1); // 본문글과 같은 ref로 지정
			ps.setInt(7, rdto.getReview_sunbun() + 1); // l , s는 1씩 증가

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
	 * 리뷰 이미지명 도출 관련 메서드
	 * @param product_idx, member_idx
	 * @return review_img
	 * */
	public String reviewSearchImg(int product_idx, String member_idx){
		try{

			conn = semi.db.semiDB.getConn();
			
			ps = conn.prepareStatement(Sql.REVIEW_SELECT_IMG);
			
			ps.setInt(1, product_idx);
			ps.setString(2, member_idx);
			
			rs = ps.executeQuery();
			
			String review_img = ""; 
			while(rs.next()){
				review_img = rs.getString("review_img");
			}
			
			return review_img;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "";
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
}

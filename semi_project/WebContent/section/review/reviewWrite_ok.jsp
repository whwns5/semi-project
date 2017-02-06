<%@page import="semi.filecopy.FileCopy"%>
<%@page import="semi.review.ReviewDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page import="semi.path.Path"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<%
	int totalSize = 1024 * 1024 * 10; // 10MB
	String savepath = Path.COM_PROJECT_PATH + "/WebContent/img/temp";
	File f = new File(savepath);
	
	ReviewDTO rdto = null;
	int result = 0;
	
	try{
		MultipartRequest mr =  
				new MultipartRequest(request, savepath, totalSize, "utf-8", new DefaultFileRenamePolicy());

		rdto = new ReviewDTO();
		
		rdto.setProduct_idx(Integer.parseInt(mr.getParameter("product_idx")));
		rdto.setMember_id(mr.getParameter("member_id"));
		rdto.setReview_subject(mr.getParameter("review_subject"));
		rdto.setReview_content(mr.getParameter("review_content"));
		rdto.setReview_grade(Integer.parseInt(mr.getParameter("review_grade")));
		
		rdto.setReview_img(mr.getFilesystemName("review_img_file"));
	
		result = rdao.reviewWrite(rdto);
	
		if(result > 0 && rdto.getReview_img() != null){ // DB 입력 성공시..
			FileCopy fc = new FileCopy();
			String path = Path.COM_PROJECT_PATH + "/WebContent/img/temp";
			String beforName = mr.getFilesystemName("review_img_file");
			String afterName = rdao.reviewSearchImg(rdto.getProduct_idx(), rdto.getMember_id());
			File renameFile = fc.reName(path, beforName, afterName);
		
			fc.copy(renameFile, Path.COM_PROJECT_PATH + "/WebContent/img/review/" + renameFile.getName());
			fc.copy(renameFile, Path.SERVERBACKUP_PROJECT_PATH + "/img/review/" + renameFile.getName());
			fc.delete(renameFile);
		}
	} catch(Exception e) {
		e.printStackTrace();
	} 
%>
<%=result%>
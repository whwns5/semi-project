package semi.filecopy;

import java.io.*;

public class FileCopy {
	
	public File reName(String path, String beforName, String afterName){
		
		File beforeFile = new File(path, beforName);
		File afterFile = new File(path, afterName);

		beforeFile.renameTo(afterFile);
		
		return afterFile;
	}
	
	public void copy(File source, String target) {
		// 복사 대상이 되는 파일 생성
		File sourceFile = source;

		// 스트림 선언
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;

		try {
			// 스트림 생성
			inputStream = new FileInputStream(sourceFile);
			outputStream = new FileOutputStream(target);

			int bytesRead = 0;
			// 인풋스트림을 아웃픗스트림에 쓰기
			byte[] buffer = new byte[1024];
			while ((bytesRead = inputStream.read(buffer, 0, 1024)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 자원 해제
			try {
				outputStream.close();
			} catch (IOException ioe) {
			}
			try {
				inputStream.close();
			} catch (IOException ioe) {
			}
		}
	}
	
	public void delete(File source){
		File sourceFile = source;
		sourceFile.delete();
	}
}

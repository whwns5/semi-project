package productForCartTest;

import java.sql.*;
import java.text.SimpleDateFormat;

import semi.db.semiDB;

public class ProductManager {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	SimpleDateFormat sf = null;

	private static ProductManager instance = new ProductManager();

	public static ProductManager getInstance() {
		return instance;

	}
	
	private ProductManager(){
		sf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	}

	public void insert(Product dto) throws Exception{
		try{
			conn=semi.db.semiDB.getConn();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				
			}catch(Exception e2){
				
			}
		}
	}

}


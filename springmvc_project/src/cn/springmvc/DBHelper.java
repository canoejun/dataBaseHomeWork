package cn.springmvc;

import java.sql.*;

public class DBHelper {
	 public static final String url = "jdbc:mysql://localhost:3306/info_manage?useSSL=false";  
	    public static final String name = "com.mysql.jdbc.Driver";  
	    public static final String user = "root";  
	    public static final String password = "jun123";  
	  
	    public Connection conn = null;  
	    public PreparedStatement pst = null;  
	  
	    public DBHelper(String sql) {  
	        try {  
	            Class.forName(name);//
	            conn = DriverManager.getConnection(url, user, password);//
	            pst = conn.prepareStatement(sql);//
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    }  
	  
	    public void close() {  
	        try {  
	            this.conn.close();  
	            this.pst.close();  
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }  
	    }  

}
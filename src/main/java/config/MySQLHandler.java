package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLHandler {
    private static String url = "jdbc:mysql://localhost:3306/picture_collage";
    private static String user = "root";
    private static String password = "12341234";
	public static Connection getConn() {
    	Connection connection = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	connection = (Connection) DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if(connection==null) System.out.println("Connect failed!");
        return connection;
		
	}
}
// mvn clean package tomcat7:run

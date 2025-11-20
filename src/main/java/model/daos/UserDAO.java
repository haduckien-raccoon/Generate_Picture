package model.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import config.MySQLHandler;
import model.beans.User;

public class UserDAO {
	
	
	public static User findByUsername(String username) {
		User user = new User();
		try {
			Connection con = MySQLHandler.getConn();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM user where username = '" + username + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				int uid = rs.getInt("uid");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");

				user = new User(uid, username, password, fullname, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}
	
	public static User findByUsernameAndPassword(String username, String password) {
		try {
			Connection con = MySQLHandler.getConn();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM user WHERE username = '" + username + "' AND password = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				int uid = rs.getInt("uid");
				String fullname = rs.getString("fullname");
				String email = rs.getString("email");

				return new User(uid, username, password, fullname, email);
			}
			return null;
		} catch (Exception a) {
			a.printStackTrace();
			return null;
		}
	}
}

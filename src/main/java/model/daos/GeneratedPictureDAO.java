package model.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import config.MySQLHandler;
import model.beans.GeneratedPicture;

public class GeneratedPictureDAO {
	public static ArrayList<GeneratedPicture> findAllByUid(int uid) {
		ArrayList<GeneratedPicture> files = new ArrayList<GeneratedPicture>();
		try {
			Connection con = (Connection) MySQLHandler.getConn();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM generated_picture " + "WHERE uid = " + uid;

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int fid = rs.getInt("fid");
				String filename = rs.getString("filename");
				int status = rs.getInt("status");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				files.add(new GeneratedPicture(fid, uid, filename, status, timestamp));
			}
		} catch (Exception a) {
			a.printStackTrace();
			return null;
		}

		return files;
	}
	
	public static ArrayList<GeneratedPicture> findAllByQid(int qid) {
		ArrayList<GeneratedPicture> files = new ArrayList<GeneratedPicture>();
		try {
			Connection con = (Connection) MySQLHandler.getConn();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM generated_picture " + "WHERE qid = " + qid;

			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int fid = rs.getInt("fid");
				String filename = rs.getString("filename");
				int status = rs.getInt("status");
				int uid = rs.getInt("uid");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				files.add(new GeneratedPicture(fid, uid, filename, status, timestamp));
			}
		} catch (Exception a) {
			a.printStackTrace();
			return null;
		}

		return files;
	}
	
	public static void updateStatusByFid(int fid, int status) {
		try {
			Connection con = (Connection) MySQLHandler.getConn();
			Statement stmt = (Statement) con.createStatement();
			String sql = "UPDATE generated_picture SET status = " + status + " WHERE fid = " + fid;

			stmt.execute(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static GeneratedPicture findByFid(int fid) {
		GeneratedPicture file = new GeneratedPicture();
		try {
			Connection con = MySQLHandler.getConn();
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM generated_picture WHERE fid = " + fid + "";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				String fname = rs.getString("filename").split("\\.")[0] + ".docx";

				int uid = rs.getInt("uid");
				int status = 2;
				Timestamp timestamp = rs.getTimestamp("timestamp");
				file = new GeneratedPicture(fid, uid, fname, status, timestamp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return file;
	}

	public static int insert(String filename, int uid, int status, Timestamp timestamp,int qid) {
        int generatedKey = -1;
        try {
            Connection con = MySQLHandler.getConn();
            String sql = "INSERT INTO `generated_picture`(`uid`, `filename`, `status`, `timestamp`, `qid`) VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                pstmt.setInt(1, uid);
                pstmt.setString(2, filename);
                pstmt.setInt(3, status);
                pstmt.setTimestamp(4, timestamp);
                pstmt.setInt(5, qid);

                pstmt.executeUpdate();

                // Lấy giá trị của cột AUTO_INCREMENT
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedKey = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedKey;
	}

}

package model.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import config.MySQLHandler;
import model.beans.QueryTopic;

public class QueryTopicDAO {
	public static int insert(int uid, String queryTopic, int status, int shape, int width, int height, int variety, int smallImages, int largeImages, Timestamp timestamp) {
        try {
            Connection con = MySQLHandler.getConn();
            String sql = "INSERT INTO `query`(`uid`, `query_topic`, `status`, `shape`, `width`, `height`, `variety`, `small_images`, `large_images`, `timestamp`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)) {
                pstmt.setInt(1, uid);
                pstmt.setString(2, queryTopic);
                pstmt.setInt(3, status);
                pstmt.setInt(4, shape);
                pstmt.setInt(5, width);
                pstmt.setInt(6, height);
                pstmt.setInt(7, variety);
                pstmt.setInt(8, smallImages);
                pstmt.setInt(9, largeImages);
                pstmt.setTimestamp(10, timestamp);
                pstmt.executeUpdate();
             // Lấy giá trị được sinh tự động (AUTO_INCREMENT)
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return -1;
    }

    public static ArrayList<QueryTopic> findAllByUidOrderByTimestampDesc(int uid) {
        ArrayList<QueryTopic> queryTopics = new ArrayList<>();
        try {
            Connection con = MySQLHandler.getConn();
            String sql = "SELECT * FROM query WHERE uid = ? ORDER BY timestamp DESC";
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setInt(1, uid);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        int qid = rs.getInt("qid");
                        String queryTopicResult = rs.getString("query_topic");
                        int status = rs.getInt("status");
                        int shape = rs.getInt("shape");
                        int width = rs.getInt("width");
                        int height = rs.getInt("height");
                        int variety = rs.getInt("variety");
                        int smallImages = rs.getInt("small_images");
                        int largeImages = rs.getInt("large_images");
                        Timestamp timestamp = rs.getTimestamp("timestamp");
                        queryTopics.add(new QueryTopic(qid, queryTopicResult, status, shape, width, height, variety, smallImages, largeImages, timestamp));
                    }
                }
            }
        } catch (Exception a) {
            a.printStackTrace();
            return null;
        }
        return queryTopics;
    }

    public static QueryTopic findOneByQid(int qid) {
        QueryTopic queryTopic = null;
        try {
            Connection con = MySQLHandler.getConn();
            String sql = "SELECT * FROM query WHERE qid = ?";
            try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                pstmt.setInt(1, qid);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        String queryTopicResult = rs.getString("query_topic");
                        int status = rs.getInt("status");
                        int shape = rs.getInt("shape");
                        int width = rs.getInt("width");
                        int height = rs.getInt("height");
                        int variety = rs.getInt("variety");
                        int smallImages = rs.getInt("small_images");
                        int largeImages = rs.getInt("large_images");
                        Timestamp timestamp = rs.getTimestamp("timestamp");
                        return new QueryTopic(qid, queryTopicResult, status, shape, width, height, variety, smallImages, largeImages, timestamp);
                    }
                }
            }
        } catch (Exception a) {
            a.printStackTrace();
        }
        return queryTopic;
    }
    
	public static void updateStatusByFid(int qid, int status) {
		try {
			Connection con = (Connection) MySQLHandler.getConn();
			Statement stmt = (Statement) con.createStatement();
			String sql = "UPDATE query SET status = " + status + " WHERE qid = " + qid;

			stmt.execute(sql);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

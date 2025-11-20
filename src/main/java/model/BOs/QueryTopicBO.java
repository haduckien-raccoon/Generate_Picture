package model.BOs;

import java.util.ArrayList;

import model.beans.QueryTopic;
import model.daos.GeneratedPictureDAO;
import model.daos.QueryTopicDAO;

public class QueryTopicBO {
	public static ArrayList<QueryTopic> getAllQueryTopics(int uid) {
		ArrayList<QueryTopic> topics= QueryTopicDAO.findAllByUidOrderByTimestampDesc(uid);
		topics.stream().forEach(t-> {
			t.setGeneratedPictures(GeneratedPictureDAO.findAllByQid(t.getQid()));
		});
		return topics;
	}
}

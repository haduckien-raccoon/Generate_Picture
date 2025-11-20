package model.beans;

import java.sql.Timestamp;
import java.util.List;

public class QueryTopic {
	int qid;
	int uid;
	String query_topic;
	int status;
	int shape; 
	int width; 
	int height; 
	int variety; 
	int smallImages; 
	int largeImages;
	List<GeneratedPicture> generatedPictures;
	Timestamp timestamp;
	
	
	public QueryTopic(int qid, String query_topic, int status, int shape, int width, int height, int variety,
			int smallImages, int largeImages, Timestamp timestamp) {
		this.qid = qid;
		this.query_topic = query_topic;
		this.status = status;
		this.shape = shape;
		this.width = width;
		this.height = height;
		this.variety = variety;
		this.smallImages = smallImages;
		this.largeImages = largeImages;
		this.timestamp = timestamp;
	}

	public QueryTopic() {

	}

	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getQuery_topic() {
		return query_topic;
	}
	public void setQuery_topic(String query_topic) {
		this.query_topic = query_topic;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	public List<GeneratedPicture> getGeneratedPictures() {
		return generatedPictures;
	}
	public void setGeneratedPictures(List<GeneratedPicture> generatedPictures) {
		this.generatedPictures = generatedPictures;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getShape() {
		return shape;
	}

	public void setShape(int shape) {
		this.shape = shape;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getVariety() {
		return variety;
	}

	public void setVariety(int variety) {
		this.variety = variety;
	}

	public int getSmallImages() {
		return smallImages;
	}

	public void setSmallImages(int smallImages) {
		this.smallImages = smallImages;
	}

	public int getLargeImages() {
		return largeImages;
	}

	public void setLargeImages(int largeImages) {
		this.largeImages = largeImages;
	}
	
	
}

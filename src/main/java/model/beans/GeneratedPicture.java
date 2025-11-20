package model.beans;

import java.sql.Timestamp;

public class GeneratedPicture {
	int fid;
	int uid;
	String name;
	int qid;
	int status;
	Timestamp timestamp;
	public GeneratedPicture() {
	}
	public GeneratedPicture(int fid, int uid, String name, int status, Timestamp timestamp) {
		this.fid = fid;
		this.uid = uid;
		this.name = name;
		this.status = status;
		this.timestamp = timestamp;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	
	
	
	
}

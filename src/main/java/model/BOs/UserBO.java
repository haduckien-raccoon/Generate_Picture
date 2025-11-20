package model.BOs;

import model.daos.GeneratedPictureDAO;
import model.daos.UserDAO;
import java.util.ArrayList;
import model.beans.GeneratedPicture;
import model.beans.User;

public class UserBO {

	public static User getUser(String username) {
		return UserDAO.findByUsername(username);
	}
	
	public static ArrayList<GeneratedPicture> getProcessedFile(int uid) {
		return GeneratedPictureDAO.findAllByUid(uid);
	}
	
	public static User login(String username, String password) {
		return UserDAO.findByUsernameAndPassword(username, password);
	}
}

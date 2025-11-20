package model.BOs;

import model.daos.GeneratedPictureDAO;
import model.beans.GeneratedPicture;

public class GeneratedPictureBO {

	public static GeneratedPicture downloadFile(int fid) {
		return GeneratedPictureDAO.findByFid(fid);
	}

}

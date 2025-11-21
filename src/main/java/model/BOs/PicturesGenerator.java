package model.BOs;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import constants.FileStatus;
import constants.QueryStatus;
import model.beans.User;
import model.daos.GeneratedPictureDAO;
import model.daos.QueryTopicDAO;
import piccollape.DefaultShape;
import piccollape.Dimension;
import piccollape.Hexagon;
import piccollape.PixabayImageSearch;
import piccollape.ShapeManagement;
import piccollape.TextShape;

public class PicturesGenerator implements Runnable {
	User user;
	DefaultShape shape; 
	int width; 
	int height; 
	int variety; 
	int smallImages; 
	int largeImages;
	String topic;
	String colorHex;
	String artStyle; // "0": None, "1": TextShape, "2": Polaroid
    String artText;
	
	public PicturesGenerator(User user, DefaultShape shape, int width, int height, int variety, int smallImages,
			int largeImages, String topic, String colorHex, String artStyle, String artText) {
		this.user = user;
		this.shape = shape;
		this.width = width;
		this.height = height;
		this.variety = variety;
		this.smallImages = smallImages;
		this.largeImages = largeImages;
		this.topic = topic;
		this.colorHex = colorHex;
		this.artStyle = artStyle;
		this.artText = artText;
	}

	@Override
	public void run() {
		//download images source on Pixabay
		String foler=UUID.randomUUID().toString();
        File path = new File(System.getProperty("user.home") + "/"+foler);
        int qid=-1;
        try {
        	qid = QueryTopicDAO.insert(user.getUid(),topic, QueryStatus.PROCESSING,(shape instanceof Hexagon ? 1 : 0),width,height,variety,
        			smallImages,largeImages,Timestamp.valueOf(LocalDateTime.now()));
        	PixabayImageSearch.loadImagesOnDisk(path, topic, variety);
		} catch (Exception e) {
			e.printStackTrace();
			QueryTopicDAO.updateStatusByFid(qid, QueryStatus.RESOURCE_ERROR);
		}
        
        //generate picture
        int pid=-1;
        for(int i=0;i<largeImages;i++) {
			try {
		        String FILE_NAME="topic_"+UUID.randomUUID().toString();
		        pid= GeneratedPictureDAO.insert(FILE_NAME+".PNG", user.getUid(), FileStatus.PROCESSING, Timestamp.valueOf(LocalDateTime.now()),qid);
				
		        generate(FILE_NAME,path.getAbsolutePath(),System.getProperty("user.home")+"/image_users/user_"+user.getUid());
				
				GeneratedPictureDAO.updateStatusByFid(pid, FileStatus.SUCCESS);
			} catch (Exception e) {
				e.printStackTrace();
				GeneratedPictureDAO.updateStatusByFid(pid, FileStatus.GENERATE_ERROR);
			}
        }
        QueryTopicDAO.updateStatusByFid(qid, QueryStatus.SUCCESS);
        //delete folder containing downloaded images
        try {
			FileUtils.deleteDirectory(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void generate(String FILE_NAME,String PICTURES_DIR,String SAVED_TO_DIR) throws Exception {
		File saved_folder=new File(SAVED_TO_DIR);
		if(!saved_folder.exists()) {
			saved_folder.mkdirs();
		}
		boolean isPolaroid = "2".equals(artStyle);
        
        // Nếu chọn Style 1 (TextShape) -> Ghi đè shape hiện tại
		if ("1".equals(artStyle) && artText != null && !artText.isEmpty()) {
			// [FIX] Kiểm tra nếu height đang là số dòng (quá nhỏ, ví dụ < 50) do người dùng chọn Hexagon
            // thì tự động tính lại height theo pixel (ví dụ lấy 1/2 width) để vẽ chữ được đẹp
            if (this.height < 50) {
                this.height = this.width / 2;
            }
			this.shape = new TextShape(artText, width, height); 
	   }

        ShapeManagement m;
        int numImages = Objects.requireNonNull(new File(PICTURES_DIR).list((dir, name) -> (name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".jpeg") || name.toLowerCase().endsWith(".png")))).length;
        
        if (shape instanceof Hexagon) {
			int imagesToUse = Math.min(numImages, this.smallImages);
            // m = new ShapeManagement(new File(PICTURES_DIR), shape, new File(SAVED_TO_DIR), height, width, numImages);
			m = new ShapeManagement(new File(PICTURES_DIR), shape, new File(SAVED_TO_DIR), height, width, imagesToUse);
        } else {
        	// Ở đây sẽ dùng 'height' mới (đã được fix nếu là TextShape)
        	m = new ShapeManagement(new File(PICTURES_DIR), shape, new File(SAVED_TO_DIR), new Dimension(width, height));
        }

		// Chuyển đổi mã Hex sang đối tượng Color
        Color frameColor = null;
        if (this.colorHex != null && !this.colorHex.isEmpty()) {
            try {
                // Hỗ trợ cả có dấu # hoặc không
                String hex = this.colorHex.startsWith("#") ? this.colorHex : "#" + this.colorHex;
                frameColor = Color.decode(hex);
            } catch (NumberFormatException e) {
                System.out.println("Mã màu không hợp lệ, sẽ không vẽ khung.");
            }
        }

        m.run(FILE_NAME, smallImages, frameColor, isPolaroid, artText);
	}
	
}
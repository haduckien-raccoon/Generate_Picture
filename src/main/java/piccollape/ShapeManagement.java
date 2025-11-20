package piccollape;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class ShapeManagement {

	private final File workingDir;
	private final File savingDir;
	private final DefaultShape defaultShape;
	private final Dimension finalPictureDimension;

	public ShapeManagement(File workingDir, DefaultShape defaultShape, File savingDir,
			Dimension finalPictureDimension) {
		this.workingDir = workingDir;
		this.defaultShape = defaultShape;
		this.savingDir = savingDir;
		this.finalPictureDimension = finalPictureDimension;
	}

	public ShapeManagement(File workingDir, DefaultShape defaultShape, File savingDir, int rows, int width,
			int numImages) {
		this.workingDir = workingDir;
		this.defaultShape = defaultShape;
		this.savingDir = savingDir;
		this.finalPictureDimension = defaultShape.getFinalPictureSize(numImages, rows, width);
	}

	public void run(String name,int smallImages) {
		try {
			ImageManager imageManager = new ImageManager(workingDir);
			ArrayList<Image> images = imageManager.getImages();
			// change size of images
			// change bitmap of images
			// set coordinates in images
			Collections.shuffle(images);
			if (smallImages <= images.size()) {
				images = new ArrayList<Image>(images.subList(0, smallImages));
				// Use the randomImages list for further processing or displaying the images
			}
			Collections.shuffle(images);
			images = defaultShape.getCoordinates(finalPictureDimension, images);
			imageManager.writeImage(images, finalPictureDimension, savingDir, name, defaultShape);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

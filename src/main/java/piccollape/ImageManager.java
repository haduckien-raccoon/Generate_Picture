package piccollape;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;

public class ImageManager {

    private static final String FILE_TYPE = "PNG";

    private final File file;

    public ImageManager(File file) {
        this.file = file;
    }
    public ArrayList<Image> getImages() throws IOException {
        ArrayList<Image> imageL = new ArrayList<>();
        for (String name : readDir()) {
        	try {
        		imageL.add(new Image(new File(file.getAbsolutePath(), name)));
			} catch (Exception e) {
				e.printStackTrace();
			}
            
        }
        return imageL;
    }

    private String[] readDir() {
        return file.list((dir, name) -> (name.toLowerCase().endsWith(".jpg") || name.toLowerCase().endsWith(".jpeg") || name.toLowerCase().endsWith(".png")));
    }

    public void writeImage(ArrayList<Image> images, Dimension d, File savingDir, String name, DefaultShape shape, Color frameColor) throws IOException {
        BufferedImage image = new BufferedImage(d.getWidth(), d.getHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = image.createGraphics();
        for (int i = 0; i < images.size(); i++) {
            //logging
            // System.out.println("(" + (i + 1) + "/" + images.size() + " -> " + (Math.round((i+1) * 100.0 / images.size())) +"%) Adding at: " + images.get(i).getLeftTop());
            //write picture shape

            shape.writeShape(d, g, images.get(i), shape.createShapeMap(images.get(i), shape.getSize()));
        }
        //frame 
        if (frameColor != null) {
            g.setColor(frameColor); 
            
            int strokeWidth = 30;
            g.setStroke(new BasicStroke(strokeWidth));
    
            // Vẽ khung
            g.drawRect(strokeWidth / 2, strokeWidth / 2, d.getWidth() - strokeWidth, d.getHeight() - strokeWidth);
        }
        //save image
        ImageIO.write(image, FILE_TYPE, new File(savingDir.getAbsolutePath(), name + "." + FILE_TYPE ));
        //clean-up
        g.dispose();
        image.flush();
    }

}

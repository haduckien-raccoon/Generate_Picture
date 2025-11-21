package piccollape;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
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

    public void writeImage(ArrayList<Image> images, Dimension d, File savingDir, String name, DefaultShape shape, Color frameColor, 
                boolean isPolaroid, String textCaption
            ) throws IOException {
        // BufferedImage image = new BufferedImage(d.getWidth(), d.getHeight(), BufferedImage.TYPE_INT_ARGB);
        // Graphics2D g = image.createGraphics();
        int paddingSide = isPolaroid ? 40 : 0;
        int paddingBottom = isPolaroid ? 200 : 0; // Phần trắng ở dưới để ký tên
        int paddingTop = isPolaroid ? 40 : 0;

        int canvasW = d.getWidth() + (paddingSide * 2);
        int canvasH = d.getHeight() + paddingTop + paddingBottom;

        BufferedImage image = new BufferedImage(canvasW, canvasH, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = image.createGraphics();

        // 2. Nếu là Polaroid, tô nền trắng toàn bộ trước
        if (isPolaroid) {
            g.setColor(Color.WHITE);
            g.fillRect(0, 0, canvasW, canvasH);
            
            // Dịch chuyển tọa độ vẽ ảnh gốc vào giữa
            g.translate(paddingSide, paddingTop);
        }
        for (int i = 0; i < images.size(); i++) {
            //logging
            // System.out.println("(" + (i + 1) + "/" + images.size() + " -> " + (Math.round((i+1) * 100.0 / images.size())) +"%) Adding at: " + images.get(i).getLeftTop());
            //write picture shape

            shape.writeShape(d, g, images.get(i), shape.createShapeMap(images.get(i), shape.getSize()));
        }
        //frame 
        if (frameColor != null && !isPolaroid) {
            g.setColor(frameColor); 
            
            int strokeWidth = 30;
            g.setStroke(new BasicStroke(strokeWidth));
    
            // Vẽ khung
            g.drawRect(strokeWidth / 2, strokeWidth / 2, d.getWidth() - strokeWidth, d.getHeight() - strokeWidth);
        }
        if (isPolaroid && textCaption != null && !textCaption.isEmpty()) {
            // Reset translate để vẽ đè lên toàn bộ canvas (tính từ góc 0,0 chuẩn)
            g.translate(-paddingSide, -paddingTop);
            
            // Thiết lập Font
            Font font = new Font("Segoe Script", Font.BOLD | Font.ITALIC, 60);
            g.setFont(font);
            g.setColor(Color.BLACK);

            // --- LOGIC CĂN GIỮA ---
            // Lấy FontMetrics để đo kích thước chữ
            java.awt.FontMetrics metrics = g.getFontMetrics(font);
            
            // Tính chiều rộng thực tế của dòng chữ
            int textWidth = metrics.stringWidth(textCaption);
            
            // Tính tọa độ X để chữ nằm giữa canvasW
            int textX = (canvasW - textWidth) / 2;
            
            // Tọa độ Y: Nằm ở khoảng trống bên dưới (cách đáy 80px)
            int textY = canvasH - 80; 
            
            g.drawString(textCaption, textX, textY);
        }
        //save image
        ImageIO.write(image, FILE_TYPE, new File(savingDir.getAbsolutePath(), name + "." + FILE_TYPE ));
        //clean-up
        g.dispose();
        image.flush();
    }

}

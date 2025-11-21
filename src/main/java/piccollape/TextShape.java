package piccollape;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class TextShape extends DefaultShape {

    private String text;
    private int width;
    private int height;

    public TextShape(String text, int width, int height) {
        // Xử lý nếu text null
        this.text = (text != null) ? text.toUpperCase() : "NULL";
        this.width = width;
        this.height = height;
    }

    @Override
    public ArrayList<Image> getCoordinates(Dimension borderD, ArrayList<Image> sourceImages) throws IOException {
        ArrayList<Image> resultImages = new ArrayList<>();
        
        // Kiểm tra dữ liệu đầu vào an toàn
        if (sourceImages == null || sourceImages.isEmpty()) {
            System.out.println("TextShape: No source images found!");
            return resultImages;
        }
        
        // Dùng kích thước từ tham số borderD để đảm bảo khớp với logic vẽ
        int w = borderD.getWidth();
        int h = borderD.getHeight();
        
        System.out.println("TextShape: Generating map for text '" + text + "' size: " + w + "x" + h);

        // 1. Tạo Bitmap: Dùng TYPE_INT_RGB (Không Alpha) để so sánh màu chính xác tuyệt đối
        BufferedImage buffer = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = buffer.createGraphics();

        // 1a. Tô nền TRẮNG tuyệt đối
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, w, h);

        // 1b. Tính toán Font chữ
        int fontSize = h; // Bắt đầu ước lượng bằng chiều cao
        Font font = new Font("Arial", Font.BOLD, fontSize); // Dùng Arial cho nét dày dễ xếp ảnh
        g.setFont(font);
        
        FontRenderContext frc = g.getFontRenderContext();
        Rectangle2D r = font.getStringBounds(text, frc);

        // Thu nhỏ font nếu chữ to hơn khung hình
        while (r.getWidth() > w * 0.9 || r.getHeight() > h * 0.9) {
            fontSize = (int)(fontSize * 0.9);
            font = new Font("Arial", Font.BOLD, fontSize);
            g.setFont(font);
            r = font.getStringBounds(text, frc);
            if (fontSize < 10) break; // Tránh vòng lặp vô tận
        }

        // 1c. Vẽ chữ màu ĐEN tuyệt đối vào giữa
        int xText = (int) ((w - r.getWidth()) / 2);
        int yText = (int) ((h - r.getHeight()) / 2) + g.getFontMetrics().getAscent();

        g.setColor(Color.BLACK);
        g.drawString(text, xText, yText);
        g.dispose();

        // 2. Quét pixel và đặt ảnh
        // PixelSize càng nhỏ thì ảnh càng mịn nhưng tốn tài nguyên
        // Tự động tính toán pixelSize dựa trên width để không bị quá dày hoặc quá thưa
        int pixelSize = Math.max(30, w / 50); 
        
        int step = pixelSize; 
        int index = 0;
        int count = 0; // Đếm số lượng ảnh đã xếp được

        for (int y = 0; y < h - step; y += step) {
            for (int x = 0; x < w - step; x += step) {
                // Lấy màu tại tâm ô vuông
                int rgb = buffer.getRGB(x + step / 2, y + step / 2);
                
                // Logic mới: Kiểm tra xem có KHÁC màu TRẮNG không?
                // Màu trắng trong INT_RGB là 0xFFFFFF (-1 nếu xét theo signed int của Java)
                // Ta dùng phép AND bit để loại bỏ alpha và so sánh
                if ((rgb & 0xFFFFFF) != 0xFFFFFF) { 
                    
                    // Đây là điểm màu đen (thuộc về chữ) -> Đặt ảnh vào
                    try {
                        Image original = sourceImages.get(index % sourceImages.size());
                        Image img = new Image(original.getPath()); // Clone ảnh mới
                        
                        img.getImageResized(new Dimension(pixelSize, pixelSize));
                        img.setLeftTop(new Coordinate(x, y));
                        
                        resultImages.add(img);
                        index++;
                        count++;
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        System.out.println("TextShape: Found " + count + " positions to place images.");
        
        // [FALLBACK] Nếu không tìm thấy điểm nào (do lỗi font hoặc ảnh trắng trơn)
        // Thì trả về ảnh gốc xếp ngẫu nhiên để tránh ra ảnh đen thui
        if (count == 0) {
            System.out.println("TextShape: WARNING - No text pixels found. Fallback to random placement.");
            // Logic fallback đơn giản (nếu cần)
        }

        return resultImages;
    }

    @Override
    public Dimension getFinalPictureSize(int numImages, int rows, int width) {
        // Giữ nguyên width, tính height tỉ lệ theo chữ (hoặc trả về kích thước đã set)
        return new Dimension(this.width, this.height);
    }

    @Override
    public Boolean[][] createShapeMap(Image image, double size) {
        // Map full true cho các ô ảnh nhỏ
        int w = image.getWidth();
        int h = image.getHeight();
        Boolean[][] map = new Boolean[w][h];
        for (int i = 0; i < w; i++) {
            Arrays.fill(map[i], true);
        }
        return map;
    }

    @Override
    public double getSize() {
        return 0;
    }
}
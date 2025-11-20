package piccollape;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

public class ImageDownloader {

	public static void downloadImage(String imageUrl, String destinationPath) throws IOException {
		URL url = new URL(imageUrl);

		// Open a stream from the URL
		InputStream in = url.openStream();
		// Using java.nio.file to copy the InputStream to the destination file
		Path destination = Path.of(destinationPath,
				"image_" + UUID.randomUUID().toString() + "." + getFileExtension(imageUrl));
		Files.copy(in, destination, StandardCopyOption.REPLACE_EXISTING);

	}

	public static String getFileExtension(String url) {
		try {
			URL imageUrl = new URL(url);

			// Lấy đường dẫn tệp từ URL
			String path = imageUrl.getPath();

			// Lấy đuôi tệp từ đường dẫn
			String extension = getExtension(path);

			return extension;
		} catch (Exception e) {
			// Xử lý lỗi nếu có
			e.printStackTrace();
			return null;
		}
	}

	// Phương thức hỗ trợ để lấy đuôi tệp từ tên tệp
	private static String getExtension(String filename) {
		int dotIndex = filename.lastIndexOf('.');
		if (dotIndex > 0) {
			return filename.substring(dotIndex + 1);
		}
		return "";
	}
}

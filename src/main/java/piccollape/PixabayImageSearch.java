package piccollape;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

public class PixabayImageSearch {
    // Thay thế YOUR_PIXABAY_API_KEY bằng khóa API thực của bạn
	static private String PIXABAY_API_KEY="26906132-6ca4802f7c80fe5986fb5af17";
	
    public static List<String> searchPixabayImages(String apiKey, String query, int imageCount) throws IOException, InterruptedException {
        String baseUrl = "https://pixabay.com/api/";
        String endpoint = String.format("?key=%s&q=%s&image_type=photo&per_page=%d", apiKey, query, imageCount);

        HttpClient httpClient = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(baseUrl + endpoint))
                .build();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        List<String> imageUrls = new ArrayList<>();

        if (response.statusCode() == 200) {
            JSONObject jsonResponse = new JSONObject(response.body());

            if (jsonResponse.has("hits")) {
                JSONArray hits = jsonResponse.getJSONArray("hits");

                for (int i = 0; i < hits.length(); i++) {
                    JSONObject image = hits.getJSONObject(i);
                    String imageUrl = image.getString("webformatURL");
                    imageUrls.add(imageUrl);
                }
            }
        } else {
            System.out.println("Error in API response. Status code: " + response.statusCode());
        }

        return imageUrls;
    }

    public static void loadImagesOnDisk(File folderUpload,String queryTerm,int imageCount) {
    	
	    if (!folderUpload.exists()) {
	    	folderUpload.mkdirs();
		    }

        try {
            List<String> imageUrls = searchPixabayImages(PIXABAY_API_KEY, queryTerm.strip().replace(" ", "%20"), imageCount);
            imageUrls.forEach(imageLink -> {
				try {
					ImageDownloader.downloadImage(imageLink, folderUpload.getAbsolutePath());
					System.out.println(imageLink+"  -> Download successed");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			});
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}

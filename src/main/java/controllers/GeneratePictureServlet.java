package controllers;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BOs.PicturesGenerator;
import model.beans.User;
import piccollape.DefaultShape;
import piccollape.Hexagon;
import piccollape.Rectangle;

// @WebServlet("/pictures/generation")
// public class GeneratePictureServlet extends HttpServlet {
// 	private static final long serialVersionUID = 1L;

// 	protected void doGet(HttpServletRequest request, HttpServletResponse response)
// 			throws ServletException, IOException {

//         DefaultShape SELECTED_SHAPE;

// //        System.out.println("Choose your shape (0: Rectangle | 1: Hexagon): ");
//         try {
//         	//valid data
//             int shapeType = Integer.parseInt(request.getParameter("shape"));
//             int width = Integer.parseInt(request.getParameter("width"));
//             int height = Integer.parseInt(request.getParameter("height"));
//             int variety = Integer.parseInt(request.getParameter("variety"));
//             int smallImages=Integer.parseInt(request.getParameter("smallImages"));
//             int largeImages=Integer.parseInt(request.getParameter("largeImages"));
//             String topic=request.getParameter("topic");
//             if(topic.isBlank()|| topic==null) throw new Exception("topic parameter is invalid");
            
// 			User user = (User) request.getSession().getAttribute("user");
//             if (shapeType == 0) {
//                 SELECTED_SHAPE = new Rectangle();
                
//             } else if (shapeType == 1) {
//                 SELECTED_SHAPE = new Hexagon();
//             } else {
//             	throw new Exception("shape parameter is invalid");
//             }
//             //start generate picture in new thread
//             new Thread(new PicturesGenerator( user,SELECTED_SHAPE,width,height,variety, smallImages,largeImages,topic)).start();
//             request.getSession().setAttribute("message", "Pictures is generating... You can check progress at profile page!");
//             response.sendRedirect(request.getContextPath()+"/home");
// 		} catch (Exception e) {
// 			e.printStackTrace();
// 			request.getSession().setAttribute("message", "Data is invalid");
// 			response.sendRedirect(request.getContextPath()+"/home");
// 		}



// 	}

// 	protected void doPost(HttpServletRequest request, HttpServletResponse response)
// 			throws ServletException, IOException {
// 		doGet(request, response);
// 	}

// }
@WebServlet("/pictures/generation")
public class GeneratePictureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Thread pool giới hạn số thread đồng thời, có queue
    private static final ExecutorService executor = Executors.newFixedThreadPool(10);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy dữ liệu từ request
            int shapeType = Integer.parseInt(request.getParameter("shape"));
            int width = Integer.parseInt(request.getParameter("width"));
            int height = Integer.parseInt(request.getParameter("height"));
            int variety = Integer.parseInt(request.getParameter("variety"));
            int smallImages = Integer.parseInt(request.getParameter("smallImages"));
            int largeImages = Integer.parseInt(request.getParameter("largeImages"));
            String topic = request.getParameter("topic");

            DefaultShape SELECTED_SHAPE;
            if (shapeType == 0) SELECTED_SHAPE = new Rectangle();
            else if (shapeType == 1) SELECTED_SHAPE = new Hexagon();
            else throw new Exception("shape parameter is invalid");

            User user = (User) request.getSession().getAttribute("user");

            // Submit task vào thread pool thay vì tạo thread mới
            executor.submit(new PicturesGenerator(user, SELECTED_SHAPE, width, height, variety, smallImages, largeImages, topic));

            request.getSession().setAttribute("message", "Pictures is generating... You can check progress at profile page!");
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Data is invalid");
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}

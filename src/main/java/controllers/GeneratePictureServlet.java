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

@WebServlet("/pictures/generation")
public class GeneratePictureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Thread pool giới hạn số thread đồng thời, có queue
    private static final ExecutorService executor = Executors.newFixedThreadPool(10);

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int shapeType = requireIntMin(request, "shape", 0);
            int width = requireIntMin(request, "width", 1);
            int height = requireIntMin(request, "height", 1);
            int variety = requireIntMin(request, "variety", 1);
            int smallImages = requireIntMin(request, "smallImages", 1);
            int largeImages = requireIntMin(request, "largeImages", 1);
            String topic = requireNonBlankParam(request, "topic");
            String colorHex = request.getParameter("color");
            String artStyle = request.getParameter("artStyle");
            String artText = request.getParameter("artText");


            DefaultShape SELECTED_SHAPE;
            if (shapeType == 0) {
                SELECTED_SHAPE = new Rectangle();
            } else if (shapeType == 1) {
                SELECTED_SHAPE = new Hexagon();
            } else {
                throw new IllegalArgumentException("shape parameter is invalid");
            }

            User user = (User) request.getSession().getAttribute("user");
            requireUser(user);

            executor.submit(new PicturesGenerator(user, SELECTED_SHAPE, width, height, variety, smallImages, largeImages, topic, colorHex, artStyle, artText));

            request.getSession().setAttribute("message", "Pictures is generating... You can check progress at profile page!");
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            log("Invalid request data", e);
            request.getSession().setAttribute("message", e.getMessage() != null ? e.getMessage() : "Data is invalid");
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    private int requireIntMin(HttpServletRequest request, String name, int minInclusive) {
        String raw = request.getParameter(name);
        if (raw == null) {
            throw new IllegalArgumentException(name + " parameter is missing");
        }
        try {
            int value = Integer.parseInt(raw.trim());
            if (value < minInclusive) {
                throw new IllegalArgumentException(name + " must be >= " + minInclusive);
            }
            return value;
        } catch (NumberFormatException ex) {
            throw new IllegalArgumentException(name + " must be a number");
        }
    }

    private String requireNonBlankParam(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        if (value == null || value.isBlank()) {
            throw new IllegalArgumentException(name + " parameter is invalid");
        }
        return value.trim();
    }

    private void requireUser(User user) {
        if (user == null) {
            throw new IllegalStateException("User session is invalid");
        }
    }
}

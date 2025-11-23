🎨 Image Collage Generator – Java Web Application
📌 Giới thiệu

Image Collage Generator là một ứng dụng Java Web cho phép người dùng tạo ảnh ghép nghệ thuật (collage) từ hàng trăm đến hàng nghìn hình ảnh đầu vào.
Hệ thống tự động lấy dữ liệu hình ảnh từ kho dữ liệu (data warehouse), sau đó xử lý – sắp xếp – kết hợp thành một bức ảnh lớn duy nhất.

Ứng dụng hỗ trợ 2 dạng bố cục chính:

🟦 Rectangle Collage – ghép dạng lưới truyền thống

⬡ Hexagon Collage – ghép dạng lục giác nghệ thuật

Tất cả ảnh được xử lý tự động, không yêu cầu resize hay chuẩn hóa trước. Phù hợp để tạo poster, banner, artwork hoặc ảnh tường thuật với độ phân giải lớn.

🚀 Tính năng chính
🔍 Tìm kiếm & lấy ảnh

Nhập chủ đề (topic), hệ thống sẽ truy vấn và lấy nhiều ảnh liên quan.

Cho phép tùy chỉnh lượng ảnh lấy (Variety).

🖼️ Tạo ảnh collage

Chọn shape: Rectangle / Hexagon

Chọn kích thước ảnh đầu ra

Chọn số lượng ảnh nhỏ sử dụng để ghép

Tự động xử lý ảnh khác kích thước hoặc khác tỉ lệ

👤 Quản lý người dùng

Đăng nhập / đăng ký

Trang cá nhân

Lịch sử ảnh đã tạo (Generated Images History)

💾 Lưu trữ

Lưu metadata & history bằng MySQL

Lưu ảnh đã tạo vào thư mục server

🛠️ Kiến trúc & Công nghệ

Java 17

JSP / Servlet

Apache Tomcat 9+

MySQL Database

Maven Project

Java AWT / BufferedImage dùng cho xử lý ảnh
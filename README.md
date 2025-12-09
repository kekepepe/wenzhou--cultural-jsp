# Wenzhou Cultural Connection

A Java Web application (JSP + Servlet) dedicated to promoting the culture, food, and scenery of Wenzhou, China.

## 📖 Introduction
This project is a cultural tourism platform designed to showcase the beauty of Wenzhou. It allows users to explore local delicacies, scenic spots, and cultural heritage. The application features a user-friendly interface and supports user registration and login for a personalized experience.

## ✨ Features
- **Food Module**: Browse and discover famous Wenzhou dishes.
- **Scenery Module**: Explore beautiful scenic spots and tourist attractions.
- **Culture Module**: Learn about the rich history and traditions of Wenzhou.
- **User Authentication**: Secure registration and login functionality for users.
- **Administration**: (Implicit) Management of content.

## 🛠 Tech Stack
- **Language**: Java
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Backend**: Java Servlet
- **Database**: MySQL 8.0+
- **Data Access**: JDBC
- **Server**: Apache Tomcat (v8.5 or v9.0 recommended)

## 🚀 Setup & Run

### Prerequisites
- JDK 1.8 or higher
- Apache Tomcat 8.5/9.0
- MySQL Database

### Database Configuration
1. Create a MySQL database named `wenzhou_travel`.
2. Import the SQL script located at `db/wenzhou_travel.sql` to initialize the tables and data.
3. Update database credentials in `src/com/wenzhou/util/DBUtil.java`:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/wenzhou_travel?...";
   private static final String USERNAME = "your_username"; // e.g., root
   private static final String PASSWORD = "your_password";
   ```

### Running the Application
1. Import the project into your IDE (Eclipse/IntelliJ IDEA).
2. Configure the Tomcat server in your IDE.
3. Add the project artifact to the Tomcat deployment.
4. Start the server and visit `http://localhost:8080/wenzhou--cultural-jsp/` (port and context path may vary).


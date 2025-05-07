package com.restaurant.controller;

import com.restaurant.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

@WebServlet("/user-auth")
public class UserAuthServlet extends HttpServlet {
    private final String USERS_FILE = "/data/users.txt";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        String filePath = getServletContext().getRealPath(USERS_FILE);
        File userFile = new File(filePath);

        // Ensure the file exists
        if (!userFile.exists()) {
            userFile.getParentFile().mkdirs();
            userFile.createNewFile();
        }

        List<User> users = loadUsers(filePath);

        if ("signup".equals(action)) {
            for (User u : users) {
                if (u.getEmail().equalsIgnoreCase(email)) {
                    request.setAttribute("error", "Email already registered.");
                    request.getRequestDispatcher("JSP/Signup.jsp").forward(request, response);
                    return;
                }
            }
            User newUser = new User(name, email, phone, password);
            try (PrintWriter writer = new PrintWriter(new FileWriter(userFile, true))) {
                writer.println(newUser.toFileFormat());
            }
            request.setAttribute("success", "Signup successful! Please log in.");
            request.getRequestDispatcher("JSP/Signup.jsp").forward(request, response);
        }

        else if ("login".equals(action)) {
            for (User u : users) {
                if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password)) {
                    HttpSession session = request.getSession();

                    session.setAttribute("email", u.getEmail());
                    session.setAttribute("name", u.getName());
                    session.setAttribute("phone", u.getPhone());
// ✅ Redirect to the dashboard

                    response.sendRedirect("user-dashboard");
                    return;
                }
            }
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("JSP/Signup.jsp").forward(request, response);
        }
    }

    private List<User> loadUsers(String filePath) {
        List<User> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = User.fromLine(line);
                if (user != null) users.add(user);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }
}

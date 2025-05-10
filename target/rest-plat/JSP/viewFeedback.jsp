<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
    String filePath = application.getRealPath("/") + "feedbacks.txt";
    File file = new File(filePath);
    String feedbacks = "";

    if (file.exists()) {
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = reader.readLine()) != null) {
            feedbacks += line + "<br>";
        }
        reader.close();
    } else {
        feedbacks = "No feedback yet.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All User Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .feedback {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>All User Feedback</h2>
        <div class="feedback">
            <%= feedbacks %>
        </div>
    </div>

</body>
</html>
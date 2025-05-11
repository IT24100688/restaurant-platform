<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
    String name = request.getParameter("name");
    String feedback = request.getParameter("feedback");
    String rating = request.getParameter("rating");

    if (name != null && !name.isEmpty()) {
        // Path to save feedbacks file
        String filePath = application.getRealPath("/data/feedbacks.txt");
        ;

        try {
            FileWriter writer = new FileWriter(filePath, true);
            BufferedWriter bufferedWriter = new BufferedWriter(writer);

            // Constructing the feedback entry
            String feedbackEntry = "Name: " + name + "\n" +
                                   "Rating: " + rating + " stars\n" +
                                   "Feedback: " + (feedback.isEmpty() ? "No feedback given" : feedback) + "\n" +
                                   "------------------------\n";
            // Writing to file
            bufferedWriter.write(feedbackEntry);
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Submitted</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e3f2fd;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            max-width: 600px;
        }

        h2 {
            font-size: 2rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            color: #555;
        }

        .success-message {
            font-size: 1.5rem;
            color: #4CAF50;
            margin-top: 20px;
            font-weight: bold;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #4CAF50;
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 1rem;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #388E3C;
        }

        .icon {
            font-size: 40px;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .container p, .container a {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="icon">
            &#x1F44D; <!-- Thumbs Up Emoji -->
        </div>
        <h2>Thank You for Your Feedback!</h2>
        <p class="success-message">Your feedback has been successfully submitted.</p>

    </div>

</body>
</html>

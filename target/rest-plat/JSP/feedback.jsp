<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Feedback</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e3f2fd; /* Light blue background color */
            margin: 0;
            padding: 0;
        }
        .container {
            width: 70%;
            margin: 50px auto;
            background-color: white;
            padding: 40px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
        }
        h2 {
            color: #4CAF50;
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 25px;
        }
        label {
            display: block;
            font-size: 1rem;
            color: #333;
            margin-bottom: 8px;
            font-weight: 500;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 1rem;
            color: #333;
        }
        textarea {
            resize: vertical;
        }
        .stars {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            direction: rtl; /* Right-to-left direction */
        }
        .stars input[type="radio"] {
            display: none;
        }
        .stars label {
            font-size: 40px;
            color: #ddd;
            margin: 0 5px;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        .stars label::before {
            content: '\2606'; /* Unicode for empty star */
        }
        .stars input[type="radio"]:checked ~ label,
        .stars input[type="radio"]:hover ~ label {
            color: #FFD700; /* Gold color */
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 28px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 1.1rem;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .submit-btn:hover {
            background-color: #45a049;
            transform: translateY(-2px);
        }
        .submit-btn:active {
            background-color: #388E3C;
            transform: translateY(0);
        }
        .submit-btn:focus {
            outline: none;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Provide Your Feedback</h2>
        <form action="submitFeedback.jsp" method="post">
            <div class="form-group">
                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" required placeholder="Enter your name">
            </div>
            <div class="form-group">
                <label for="feedback">Your Feedback:</label>
                <textarea id="feedback" name="feedback" rows="4" placeholder="Optional, you can leave it blank"></textarea>
            </div>
            <div class="form-group stars">
                <label>Rate Us:</label>
                <input type="radio" id="star5" name="rating" value="5">
                <label for="star5"></label>

                <input type="radio" id="star4" name="rating" value="4">
                <label for="star4"></label>

                <input type="radio" id="star3" name="rating" value="3">
                <label for="star3"></label>

                <input type="radio" id="star2" name="rating" value="2">
                <label for="star2"></label>

                <input type="radio" id="star1" name="rating" value="1">
                <label for="star1"></label>
            </div>
            <div class="form-group">
                <button type="submit" class="submit-btn">Submit Feedback</button>
            </div>
        </form>
    </div>

</body>
</html>

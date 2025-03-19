<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reservation Form</title>
    </head>
    <body>
 <form action="processHandle.jsp" method="post">
         <label for="firstName">First Name:</label>
         <input type="text" id="firstName" name="firstName" required>
         <br><br>

         <label for="lastName">Last Name:</label>
         <input type="text" id="lastName" name="lastName" required>
         <br><br>

         <label for="persons">How Many Persons:</label>
         <input type="number" id="persons" name="persons" min="1" required>
         <br><br>

         <label for="time">Time:</label>
         <input type="time" id="time" name="time" required>
         <br><br>

         <label for="date">Date:</label>
         <input type="date" id="date" name="date" required>
         <br><br>

         <button type="submit">Submit</button>
     </form>


    </body>
    </html>




<%@ page import="java.lang.NumberFormatException" %>

<!DOCTYPE html>
<html>
<head>
  <title>Area Calculator</title>
</head>
<body>
  <h1>Area Calculator</h1>
  <%
    double length = 0;
    double width = 0;
    double area = 0;
    String errorMessage = "";

    if (request.getMethod().equals("POST")) {
      try {
        // Read form data (only if submitted via POST)
        length = Double.parseDouble(request.getParameter("length"));
        width = Double.parseDouble(request.getParameter("width"));

        // Calculate area
        area = length * width;
      } catch (NumberFormatException e) {
        errorMessage = "Invalid input. Please enter numbers for length and width.";
      }
    }
  %>

  <form action="" method="post">
    <p>Length: <input type="text" name="length" value="<%= length %>" required></p>
    <p>Width: <input type="text" name="width" value="<%= width %>" required></p>
    <br>
    <button type="submit">Calculate Area</button>
  </form>

  <% if (!errorMessage.isEmpty()) { %>
    <p style="color: red;"><%= errorMessage %></p>
  <% } else if (area > 0) { %>
    <p>The area of the rectangle is: <%= area %></p>
  <% } %>

  <p>Powered by Tomcat10</p>
  <p>Visit the <a href="https://github.com/amiraligpu/amirdali">source code</a> on GitHub.</p>
</body>
</html>

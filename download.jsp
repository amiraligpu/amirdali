<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
  String notesContent = request.getParameter("notesContent");
  String fileName = request.getParameter("filename");
  String outputFormat = request.getParameter("outputFormat");

  if (notesContent != null && fileName != null && outputFormat != null) {
    if ("text".equals(outputFormat)) {
      // Set response for plain text file
      response.setContentType("text/plain; charset=UTF-8");
      fileName += ".txt";
    } else if ("html".equals(outputFormat)) {
      // Set response for HTML file
      response.setContentType("text/html; charset=UTF-8");
      fileName += ".html";
    }

    // Encode the filename with UTF-8 before setting Content-Disposition
    String encodedFileName = URLEncoder.encode(fileName, "UTF-8");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

    // Write the content to the file
    out.write(notesContent);
    out.flush();
    out.close();
  } else {
    // Handle the error case where parameters are missing
    out.println("Error: Missing content or filename.");
  }
%>

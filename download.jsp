<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%
    String notesContent = request.getParameter("notesContent");
    String fileName = request.getParameter("fileName");

    if (notesContent != null && fileName != null) {
        // Create a temporary file with the specified name
        File tempFile = File.createTempFile(fileName, ".txt");

        // Write notes content to the temporary file
        try (FileWriter writer = new FileWriter(tempFile)) {
            writer.write(notesContent);
        } catch (IOException e) {
            e.printStackTrace();
            // Handle error (e.g., display error message to user)
        }

        // Set response headers for download
        response.setContentType("text/plain");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  // Corrected line

        // Read temporary file content and write to response stream
        try (FileReader reader = new FileReader(tempFile);
             BufferedReader bufferedReader = new BufferedReader(reader)) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                response.getWriter().write(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Handle error (e.g., display error message to user)
        }

        // Delete the temporary file after download
        tempFile.delete();
    }
%>

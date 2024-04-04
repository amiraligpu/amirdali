<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Amir Dali Online Text Editor</title>
  <link rel="stylesheet" href="style.css">
  <script>
    function downloadText() {
      const notes = document.getElementById("notes").value;
      const fileName = document.getElementById("fileName").value;
      const form = document.getElementById("downloadForm");

      // Validate filename for security (optional)
      if (!validateFileName(fileName)) {
        alert("Invalid file name. Please avoid special characters except hyphens, underscores, and periods.");
        return;  // Prevent form submission if validation fails
      }

      form.action = "download.jsp?fileName=" + encodeURIComponent(fileName);
      form.elements["notesContent"].value = notes;
      form.submit();
    }

    // Optional function for filename validation (customizable)
    function validateFileName(fileName) {
      const validChars = /^[a-zA-Z0-9-_.]+$/;
      return validChars.test(fileName);
    }
  </script>
</head>
<body>
  <h1>Amir Dali Online Text Editor</h1>
  <form id="downloadForm" action="download.jsp" method="post">
    <textarea id="notes" rows="10" cols="50" placeholder="Enter your notes here..."></textarea><br>
    <label for="fileName">Download File Name:</label>
    <input type="text" id="fileName" name="fileName" value="notes.txt" required><br>
    <button type="button" onclick="downloadText()">Download Notes</button>
    <input type="hidden" name="notesContent" />
  </form>
  <p><a href="https://github.com/amiraligpu/amirdali" target="_blank">View source code</a></p>
  <p><a href="https://www.arvancloud.ir/fa" target="_blank">Server powered by Arvan Cloud</a></p>
</body>
</html>

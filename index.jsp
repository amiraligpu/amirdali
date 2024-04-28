<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <title>Amir Dali Online Text Editor</title>
    <link rel="icon" href="icon.ico" type="image/x-icon">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body style="background-color: #ffe0cc;">
    <header>
    <h1>Amir Dali Online Text Editor</h1>
    </header>
    <form action="download.jsp" method="post">
        <div id="editor"></div>
        <input type="text" name="filename" placeholder="Enter file name here" required />
        <select name="outputFormat">
            <option value="text">Text</option>
            <option value="html">HTML</option>
        </select>
        <input type="hidden" name="notesContent" />
        <button type="submit" id="download-btn">Download Content</button>
    </form>

    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        var quill = new Quill('#editor', {
            modules: {
                toolbar: [
                    ['bold', 'italic', 'underline', 'strike'],
                    ['blockquote', 'code-block'],
                    [{ 'header': 1 }, { 'header': 2 }],
                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                    [{ 'script': 'sub'}, { 'script': 'super' }],
                    [{ 'indent': '-1'}, { 'indent': '+1' }],
                    [{ 'direction': ['ltr', 'rtl'] }],
                    [{ 'size': ['small', false, 'large', 'huge'] }],
                    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                    [{ 'color': [] }, { 'background': [] }],
                    [{ 'font': [] }],
                    [{ 'align': [] }],
                    ['clean'],
                    ['link', 'image', 'video', 'formula']
                ]
            },
            theme: 'snow'
        });

        document.querySelector('form').onsubmit = function() {
            var notesContentInput = document.querySelector('input[name="notesContent"]');
            var htmlContent = quill.root.innerHTML;
            var textContent = quill.getText();
            // Check the output format selected by the user and set the value accordingly
            var outputFormat = document.querySelector('select[name="outputFormat"]').value;
            notesContentInput.value = outputFormat === 'html' ? htmlContent : textContent;
        };
    </script>
    <div class="github-container">
    <a href="https://github.com/amiraligpu/amirdali" target="_blank" class="github-link">source code in gitHub repository</a>
    </div>

</body>
</html>

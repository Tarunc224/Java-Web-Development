<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <style>
        /* Style the navigation bar */
        .navbar {
            overflow: hidden;
            background-color: #333;
        }

        /* Navigation bar links */
        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        /* On hover, the links will change color */
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
    <script>
        // JavaScript to redirect after 2 seconds
        setTimeout(function() {
            window.location.href = 'ViewOrdersServlet'; // Update the URL to servlet mapping
        }, 2000); // 2000 milliseconds = 2 seconds
    </script>
</head>
<body>

<div class="navbar">
    <a href="CreateProject.jsp">Add Another Project</a>
    <a href="ViewProjectsServlet">View Projects</a>
    <a href="UpdateProject.jsp">Update Project</a>
    <a href="DeleteProject.jsp">Delete Project</a>
</div>

<h2>Success</h2>
<p>Your project has been successfully created. You will be redirected to view projects shortly...</p>

</body>
</html>

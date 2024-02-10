<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome to EpicLibrary</title>
    <!-- Add Google Fonts link for Roboto font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <style>
        /* Custom styles for an attractive homepage */
        body {
            background: linear-gradient(45deg, #007bff, #00cc99, #ffcc00); /* Linear gradient background with three colors */
            font-family: 'Roboto', sans-serif; /* Use Roboto font for the entire page */
            color: #fff; /* Set text color to white for better visibility on the gradient background */
        }

        .navbar {
            background-color: #007bff; /* Primary color for the navbar */
        }

        .navbar-brand img {
            max-height: 40px; /* Adjust the height of your logo */
            margin-right: 10px;
        }

        .btn-outline-light {
            color: #fff;
        }

        .jumbotron {
            background-color: #007bff; /* Primary color for the jumbotron */
            color: #fff; /* Text color for the jumbotron */
            padding: 40px 20px; /* Add more padding for better spacing */
            position: relative; /* Set position to relative for absolute positioning of text */
        }

        .jumbotron img {
            max-width: 100%;
            height: auto;
            border-radius: 50%;
        }

        .jumbotron h1, .jumbotron p {
            position: absolute; /* Position text absolute inside the jumbotron */
            top: 50%; /* Center text vertically */
            left: 50%; /* Center text horizontally */
            transform: translate(-50%, -50%); /* Center text precisely */
            margin: 0; /* Remove default margin */
            text-align: center; /* Center text */
        }

        .container {
            margin-top: 20px;
        }

        /* Style for feature section */
        .feature-section .col-md-4 {
            text-align: center;
            margin-bottom: 30px; /* Add space between feature items */
        }

        .feature-section img {
            max-width: 100%;
            height: auto;
            border-radius: 50%;
            margin-bottom: 20px; /* Add some space between image and text */
        }        /* Additional CSS for image overlay */
.image-container {
    position: relative;
    overflow: hidden;
}

.image-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: #fff; /* Set text color to white for better visibility */
}

.image-text h3, .image-text p {
    margin: 0;
}
        
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">EpicLibrary</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>

            <!-- Login buttons as anchor tags -->
            <div class="d-flex">
                <a href="userLogin.jsp" class="btn btn-outline-light me-2">User Login</a>
                <a href="adminLogin.jsp" class="btn btn-outline-light">Admin Login</a>
            </div>
        </div>
    </div>
</nav>

<!-- Jumbotron for a big, eye-catching section -->
<div class="jumbotron text-center">
    <img src="https://www.pixel-studios.com/blog/wp-content/uploads/2018/12/012.jpg" alt="Header Image" class="img-fluid">
    <h1 class="display-4">Welcome to EpicLibrary</h1>
    <p class="lead">Discover a world of knowledge at your fingertips.</p>
</div>

<!-- Feature Section with Icons and Images -->
<div class="container feature-section">
   <!-- Feature Section with Icons and Images -->
<div class="container feature-section">
    <div class="row">
        <div class="col-md-4 text-center">
            <div class="image-container">
                <img src="https://i.pinimg.com/originals/87/6e/7e/876e7ed963457de36f2e9e248ad700c2.jpg" alt="Explore Books" class="img-fluid rounded-circle">
                <div class="image-text">
                    <h3>Explore Books</h3>
                    <p>Discover a vast collection of books from various genres.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 text-center">
            <div class="image-container">
                <img src="https://www.marwickmarketing.com/wp-content/uploads/2020/10/Web-design-development-user-friendly.png" alt="User-Friendly" class="img-fluid rounded-circle">
                <div class="image-text">
                    <h3>User-Friendly</h3>
                    <p>Easy to use interface for seamless navigation.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 text-center">
            <div class="image-container">
                <img src="https://th.bing.com/th/id/OIP.JJSTJRHBufW_cYl0FXqk8QHaH_?rs=1&pid=ImgDetMain" alt="24/7 Access" class="img-fluid rounded-circle">
                <div class="image-text">
                    <h3>24/7 Access</h3>
                    <p>Borrow and return books at any time, anywhere.</p>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<!-- Bootstrap JS (popper.js and jQuery are required) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>

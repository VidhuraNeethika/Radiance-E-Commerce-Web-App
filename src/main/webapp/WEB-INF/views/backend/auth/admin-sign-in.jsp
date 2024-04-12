<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Sign In</title>
    <link rel="stylesheet" href="${BASE_URL}assets/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${BASE_URL}assets/css/style.css">
    <link rel="shortcut icon" href="${BASE_URL}assets/pictures/logos/logo short.svg" type="image/x-icon">
</head>

<body>

<div class="container-fluid">
    <div class="row">

        <div class="col-6 left-img-area d-none d-md-block position-fixed"></div>
        <div class="col-6 d-none d-md-block"></div>

        <div class="col-12 col-md-6 col-lg-4 d-flex align-items-center">
            <div class="row p-3 pt-5 mt-4 mt-xxl-5">

                <div class="col-12">
                    <div class="logo"></div>
                </div>

                <div class="col-12 mt-3">

                    <a href="${BASE_URL}" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="${BASE_URL}admin-sign-in/" class="pagination-links active-page">Admin Sign In</a>

                </div>

                <div class="col-12 mt-4">
                    <div class="row">
                        <div class="col-6">
                            <span class="main-heading">Admin Sign In</span>
                        </div>
                        <div class="col-6 text-end">
                            <button class="nw-acc-btn">Create New Account</button>
                        </div>
                    </div>
                </div>

                <div class="col-12 mt-4">

                    <span class="fw-bold sm-text ms-2 d-block">Username</span>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Username" aria-describedby="button-addon2">
                        <button class="btn-none" type="button" id="button-addon2"><i class="bi bi-person"></i></button>
                    </div>

                    <span class="fw-bold sm-text ms-2 d-block mt-4">Password</span>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Password" aria-describedby="button-addon2">
                        <button class="btn-none" type="button" id="button-addon2"><i class="bi bi-key"></i></button>
                    </div>

                </div>

                <div class="col-6 mt-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            Remember Me
                        </label>
                    </div>
                </div>

                <div class="col-6 text-end mt-4 text-black-50">
                    <span>Fogot Password ?</span>
                </div>

                <div class="col-12 mt-5 d-flex justify-content-center">
                    <button class="sign-in-btn shadow">Sign In <i class="bi bi-chevron-right ms-3 position-absolute"></i></button>
                </div>

                <div class="col-12 mt-4 text-center">
                    <span class="sm-text text-black-50">or</span>
                </div>

                <div class="col-12 text-center">
                    <span class="text-black-50">Sign In With</span>
                </div>

                <div class="col-12 d-flex justify-content-center mt-3">
                    <button class="social-btn-sign-in"><i class="bi bi-google"></i></button>
                    <button class="social-btn-sign-in"><i class="bi bi-facebook"></i></button>
                    <button class="social-btn-sign-in"><i class="bi bi-twitter"></i></button>
                    <button class="social-btn-sign-in"><i class="bi bi-apple"></i></button>
                </div>

                <!-- <div class="col-12 d-flex justify-content-center mt-2">

                </div> -->


            </div>

        </div>

    </div>
</div>


<script src="${BASE_URL}assets/js/bootstrap.bundle.js"></script>

<script src="${BASE_URL}assets/js/script.js"></script>
</body>

</html>
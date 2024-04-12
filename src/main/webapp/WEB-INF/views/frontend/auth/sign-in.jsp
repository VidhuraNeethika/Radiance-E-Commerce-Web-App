<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.City" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 8/18/2023
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | Sign Up</title>
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
            <div class="row p-3 pt-5 mt-4 mt-xxl-5" id="sign_in_area">

                <div class="col-12">
                    <div class="logo"></div>
                </div>

                <div class="col-12 mt-3">

                    <a href="${BASE_URL}" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="${BASE_URL}sign-in" class="pagination-links active-page">Sign In</a>

                </div>

                <div class="col-12 mt-4">
                    <div class="row">
                        <div class="col-6">
                            <span class="main-heading">Sign In</span>
                        </div>
                        <div class="col-6 text-end">
                            <button class="nw-acc-btn" onclick="register_form();">Create New Account</button>
                        </div>
                    </div>
                </div>

                <%-- sign in design --%>

                <div class="col-12 mt-4">

                    <span class="fw-bold sm-text ms-2 d-block">Username</span>
                    <div class="input-group">
                        <input id="loginUsername" type="text" class="form-control" placeholder="Username"
                               aria-describedby="button-addon2">
                        <button class="btn-none" type="button"><i class="bi bi-person"></i></button>
                    </div>

                    <span class="fw-bold sm-text ms-2 d-block mt-4">Password</span>
                    <div class="input-group">
                        <input id="loginPassword" type="password" class="form-control" placeholder="Password"
                               aria-describedby="button-addon2">
                        <button class="btn-none" type="button"><i class="bi bi-key"></i></button>
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
                    <button onclick="signIn()" class="sign-in-btn shadow">Sign In <i
                            class="bi bi-chevron-right ms-3 position-absolute"></i>
                    </button>
                </div>

                <%-- sign in design --%>

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

            <div class="row p-3 d-none" id="sign_up_area">

                <div class="col-12">
                    <div class="logo"></div>
                </div>

                <div class="col-12 mt-3">

                    <a href="${BASE_URL}" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="${BASE_URL}sign-in" class="pagination-links active-page">Sign Up</a>

                </div>

                <div class="col-12 mt-4">
                    <div class="row">
                        <div class="col-6">
                            <span class="main-heading">Sign Up</span>
                        </div>
                        <div class="col-6 text-end">
                            <button class="nw-acc-btn" onclick="sign_in_form();">Already have a account</button>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">First Name</label>
                        <input type="text" class="form-control" id="first-name" placeholder="Ex: John">
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Last Name</label>
                        <input type="text" class="form-control" id="last-name"
                               placeholder="Ex: Ferdinandis">
                    </div>
                </div>

                <div class="col-12 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Email Address</label>
                        <input onkeyup="generateUsername();" type="email" class="form-control" id="email"
                               placeholder="Ex: hello@example.com">
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Mobile Number</label>
                        <input onclick="generateUsername();" type="text" class="form-control" id="mobile"
                               placeholder="Ex: 0701234567">
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Create
                            Username</label>
                        <input type="text" class="form-control" id="username" disabled placeholder="Ex: John@2001">
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Password</label>
                        <input onclick="generateUsername();" type="password" class="form-control" id="password"
                               placeholder="Include: Number, Uppercase Characters">
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Confirm
                            Password</label>
                        <input type="password" class="form-control" id="confirm-password"
                               placeholder="Include: Number, Uppercase Characters">
                    </div>
                </div>

                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Address Line
                            01</label>
                        <input type="text" class="form-control" id="address-line-01" placeholder="Flower Road">
                    </div>
                </div>

                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Address Line
                            02</label>
                        <input type="text" class="form-control" id="address-line-02" placeholder="Lake Area">
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">City</label>
                        <select name="" id="city" class="form-control mt-2">
                            <option value="0">Select City</option>
                            <%

                                SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
                                Session openSession = sessionFactory.openSession();

                                List<City> cities = openSession.createQuery("select city from City city", City.class).getResultList();

                                Iterator<City> iterator = cities.iterator();
                                while (iterator.hasNext()) {
                                    City cityData = iterator.next();

                            %>
                            <option value="<%=cityData.getId()%>"><%=cityData.getName()%></option>
                            <%
                                }

                            %>
                        </select>
                    </div>
                </div>

                <div class="col-12 col-lg-6 mt-2">
                    <div class="mb-3">
                        <label class="form-label sm-text fw-bold ms-2">Postal Code</label>
                        <input type="text" class="form-control" id="postal-code" placeholder="Ex: 600026">
                    </div>
                </div>

                <div class="col-12 mt-5 d-flex justify-content-center">
                    <button class="sign-in-btn shadow" onclick="signUp()">Sign Up</button>
                </div>


            </div>
        </div>

    </div>
</div>

<script>
    const BASE_URL = ${BASE_URL};
</script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//code.tidio.co/obgngwi69oy3kootdyykcvyeujlvlgs1.js" async></script>

<script src="${BASE_URL}assets/js/bootstrap.bundle.js"></script>

<script src="${BASE_URL}assets/js/script.js"></script>

</body>

</html>

<%@ page import="com.apx.radiance.service.UserService" %>
<%@ page import="com.apx.radiance.util.JwtTokenUtil" %>
<%@ page import="com.apx.radiance.entity.User" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Cart" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="com.apx.radiance.entity.Wishlist" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="static org.apache.coyote.http11.Constants.a" %>
<%@ page import="com.apx.radiance.entity.UserType" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    String userId = "";

    Boolean isSession = false;
    Boolean isAdminSession = false;

    if (session.getAttribute("user") != null) {
        isSession = true;
        userId = session.getAttribute("user").toString();
    } else if (session.getAttribute("admin") != null) {
        isAdminSession = true;
        userId = session.getAttribute("admin").toString();
    }

    List<Wishlist> wishlistList = null;
    List<Cart> cartList = null;
    User user = null;

    if (isSession || isAdminSession) {

        UserService userService = new UserService();
        JwtTokenUtil jwtTokenUtil = new JwtTokenUtil();

        user = userService.getById(Long.valueOf(userId));


        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session openSession = sessionFactory.openSession();

        Query<Cart> cartQuery = openSession.createQuery("select c from Cart c inner join Product p on c.product.id = p.id where c.user.id=:userID", Cart.class);
        cartList = cartQuery.setParameter("userID", userId).getResultList();

        pageContext.setAttribute("cartItems", cartList);

        Query<Wishlist> wishlistQuery = openSession.createQuery("select w from Wishlist w inner join Product p on w.product.id = p.id where w.user.id=:userID", Wishlist.class);
        wishlistList = wishlistQuery.setParameter("userID", userId).getResultList();

        pageContext.setAttribute("wishListItems", wishlistList);

    }

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${App.getString('app_name')} | ${App.getString('app_description')}</title>
    <link rel="stylesheet" href="${BASE_URL}assets/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${BASE_URL}assets/css/style.css">
    <link rel="stylesheet" href="${BASE_URL}assets/css/summernote.min.css">
    <link rel="shortcut icon" href="${BASE_URL}assets/pictures/logos/logo short.svg" type="image/x-icon">
</head>

<body onscroll="scrollEffect();">

<!-- scroll -->

<div class="scroll-top" id="scroll-top">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 11l7-7 7 7M5 19l7-7 7 7"/>
    </svg>
</div>

<script>
    const scrollTopButton = document.getElementById("scroll-top");

    scrollTopButton.addEventListener('click', () => {
        window.scrollTo(0, 0);
    })
</script>

<!-- scroll -->

<div class="container-fluid">
    <div class="row shadow bg-white fixed-top p-1 p-lg-0" id="headerMainShadow">

        <div class="col-12 d-none d-lg-block">
            <div class="row text-center top-line-area text-white">

                <div class="col-3 text-end text-white">
                    <span class="sm-text"><i class="bi bi-envelope-fill em-icn"></i> Radiance .info@gmail.com</span>
                </div>

                <div class="col-6">
                    <span class="sm-text">Radiance | The Best Electronic Items at the Right Place</span>
                </div>

                <div class="col-3 text-start">
                    <!-- <button><i class="bi bi-instagram social-btn"></i></button>
                    <button><i class="bi bi-messenger social-btn"></i></button>
                    <button><i class="bi bi-twitter social-btn"></i></button>
                    <button><i class="bi bi-linkedin social-btn"></i></button> -->

                    <table>
                        <tr>
                            <td class="px-2"><i class="bi bi-instagram social-btn"></i></td>
                            <td class="px-2"><i class="bi bi-twitter social-btn"></i></td>
                            <td class="px-2"><i class="bi bi-linkedin social-btn"></i></td>
                            <td class="px-2"><i class="bi bi-messenger social-btn"></i></td>
                            <td class="px-2"><i class="bi bi-youtube social-btn"></i></td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>

        <div class="col-12 col-lg-10 offset-lg-1 mt-2">
            <div class="row">

                <div class="col-10 col-lg-3 text-lg-center">
                    <div onclick="test();" class="logo"></div>
                </div>

                <div class="col-2 d-block d-lg-none d-flex justify-content-end">
                    <button class="menu-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
                            aria-controls="offcanvasExample"><i class="bi bi-list fs-3"></i></button>
                </div>

                <!-- small device -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
                     aria-labelledby="offcanvasExampleLabel">

                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body">
                        <div class="row">

                            <div class="col-12 p-2">
                                <span class="">Home</span>
                            </div>

                            <div class="col-12 p-2">
                                <div class="dropdown" onclick="go_to_products();">
                                    <span type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                          aria-expanded="false">All Products</span>
                                </div>
                            </div>

                            <div class="col-12 p-2">
                                <span class="">Categories</span>

                                <div class="py-2">
                                    <a class="dropdown-item text-black-50" href="#">Electronic Devices</a>
                                    <a class="dropdown-item text-black-50" href="#">Mobile Accessories</a>
                                    <a class="dropdown-item text-black-50" href="#">Computer Accessories</a>
                                    <a class="dropdown-item text-black-50" href="#">Camera Accessories</a>
                                    <a class="dropdown-item text-black-50" href="#">Computer Components</a>
                                    <a class="dropdown-item text-black-50" href="#">Network Components</a>
                                    <a class="dropdown-item text-black-50" href="#">TV and Video Devices</a>
                                    <a class="dropdown-item text-black-50" href="#">Cooling and Heating</a>
                                    <a class="dropdown-item text-black-50" href="#">Washing Machines</a>
                                </div>

                            </div>

                            <div class="col-12 p-2">
                                <span class="">Brands</span>

                                <div class="py-2">
                                    <a class="dropdown-item text-black-50" href="#">Apple</a>
                                    <a class="dropdown-item text-black-50" href="#">Samsung</a>
                                    <a class="dropdown-item text-black-50" href="#">Huawei</a>
                                    <a class="dropdown-item text-black-50" href="#">TLC</a>
                                    <a class="dropdown-item text-black-50" href="#">Softlogic</a>
                                    <a class="dropdown-item text-black-50" href="#">Sony</a>
                                </div>
                            </div>

                            <div class="col-12 p-2">
                                <span class="">About Us</span>
                            </div>

                            <div class="col-12 p-2">
                                <span class="">Contact Us</span>
                            </div>

                            <div class="col-12 p-2">
                                <span class="">Account</span>

                                <div class="py-2">
                                    <a class="dropdown-item text-black-50" href="${BASE_URL}admin-panel">My Account</a>
                                    <a class="dropdown-item text-black-50" href="${BASE_URL}wishlist">Wishlist</a>
                                    <a class="dropdown-item text-black-50" href="${BASE_URL}cart">Cart</a>
                                    <a class="dropdown-item text-black-50" href="#">My Orders</a>
                                    <a class="dropdown-item text-black-50" href="#">Log Out</a>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!-- small device -->

                <div class="col-12 col-lg-6 pt-3">
                    <div class="input-group border-my mb-3">
                        <input type="text" class="form-control" placeholder="Search.." aria-label="Recipient's username"
                               aria-describedby="basic-addon2">
                        <span class="input-group-text" id="basic-addon2"><i class="bi bi-search"></i></span>
                    </div>
                </div>

                <div class="col-1 text-center pt-3 d-none d-lg-block c-pointer text-black-50" onclick="go_to_cart();">
                    <i class="bi bi-bag fs-5"></i>

                    <%
                        Double netTotal = 0.0;
                        Double netTotalWishList = 0.0;

                        int cartQty = 0;
                        int wishListQty = 0;

                        String profileNavigation = "Account";

                        if (isSession || isAdminSession) {

                            cartQty = cartList.size();
                            wishListQty = wishlistList.size();

                            profileNavigation = user.getFirst_name();

                            Iterator<Cart> iterator = cartList.iterator();
                            while (iterator.hasNext()) {
                                Cart cartData = iterator.next();
                                netTotal = netTotal + cartData.getProduct().getPrice();
                            }

                            Iterator<Wishlist> iterator2 = wishlistList.iterator();
                            while (iterator2.hasNext()) {
                                Wishlist wishlistData = iterator2.next();
                                netTotalWishList = netTotalWishList + wishlistData.getProduct().getPrice();
                            }

                        }

                    %>
                    <span class="d-block xsm-text fw-bold"><%=netTotal.intValue()%>.00</span>
                    <label class="num-label"><%=cartQty%>
                    </label>
                </div>

                <div class="col-1 text-center pt-3 d-none d-lg-block c-pointer text-black-50"
                     onclick="go_to_wishlist();">
                    <i class="bi bi-heart fs-5"></i>
                    <span class="d-block xsm-text fw-bold"><%=netTotalWishList.intValue()%>.00</span>
                    <label class="num-label"><%=wishListQty%>
                    </label>
                </div>

                <div class="col-1 text-center pt-3 d-none d-lg-block">
                    <i class="bi bi-person-circle fs-5" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
                       aria-expanded="false"></i>
                    <span class="d-block sm-text fw-bold" type="button" id="dropdownMenuButton1"
                          data-bs-toggle="dropdown"
                          aria-expanded="false"><%=profileNavigation%></span>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

                        <%
                            if (isSession) {
                        %>
                        <li><a class="dropdown-item" onclick="test()">My Account</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}wishlist">Wishlist</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}cart">Cart</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}purchased-history">My Orders</a></li>
                        <li><a class="dropdown-item" href="#">Sell with Radiance </a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}purchased-history">Purchased History</a>
                        </li>
                        <li><a class="dropdown-item c-pointer" onclick="logOut();">Log Out</a></li>
                        <%
                        } else if (isAdminSession) {
                        %>
                        <li><a class="dropdown-item" href="${BASE_URL}admin-panel">Admin Panel</a></li>
                        <li><a class="dropdown-item" onclick="test()">My Account</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}wishlist">Wishlist</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}cart">Cart</a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}purchased-history">My Orders</a></li>
                        <li><a class="dropdown-item" href="#">Sell with Radiance </a></li>
                        <li><a class="dropdown-item" href="${BASE_URL}purchased-history">Purchased History</a>
                        </li>
                        <li><a class="dropdown-item c-pointer" onclick="logOut();">Log Out</a></li>
                        <%
                        } else {
                        %>
                        <li><a class="dropdown-item" href="${BASE_URL}sign-in">Sign In</a></li>
                        <%
                            }

                        %>

                    </ul>

                </div>

            </div>
        </div>

        <div class="col-12 d-none d-lg-block">
            <div class="row text-center">
                <div class="col-12 col-lg-10 offset-lg-1">
                    <div class="row pb-3 pt-1">

                        <div class="col-2 c-pointer">
                            <span class="text-black-50" onclick="go_to_home();">Home</span>
                        </div>

                        <div class="col-2">
                            <div class="dropdown" onclick="go_to_products();">
                                <span class="text-black-50" type="button" id="dropdownMenuButton1"
                                      data-bs-toggle="dropdown" aria-expanded="false">All Products</span>
                            </div>
                        </div>

                        <div class="col-2">

                            <div class="dropdown">
                                <span class="text-black-50" type="button" id="dropdownMenuButton1"
                                      data-bs-toggle="dropdown" aria-expanded="false">Categories <i
                                        class="bi bi-arrow-down-short dp-icons"></i></span>

                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#">Electronic Devices</a></li>
                                    <li><a class="dropdown-item" href="#">Mobile Accessories</a></li>
                                    <li><a class="dropdown-item" href="#">Computer Accessories</a></li>
                                    <li><a class="dropdown-item" href="#">Camera Accessories</a></li>
                                    <li><a class="dropdown-item" href="#">Computer Components</a></li>
                                    <li><a class="dropdown-item" href="#">Network Components</a></li>
                                    <li><a class="dropdown-item" href="#">TV and Video Devices</a></li>
                                    <li><a class="dropdown-item" href="#">Cooling and Heating</a></li>
                                    <li><a class="dropdown-item" href="#">Washing Machines</a></li>
                                </ul>

                            </div>

                        </div>

                        <div class="col-2">
                            <div class="dropdown">
                                <span class="text-black-50" type="button" id="dropdownMenuButton1"
                                      data-bs-toggle="dropdown" aria-expanded="false">Brands <i
                                        class="bi bi-arrow-down-short dp-icons"></i></span>

                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="#">Apple</a></li>
                                    <li><a class="dropdown-item" href="#">Samsung</a></li>
                                    <li><a class="dropdown-item" href="#">Huawei</a></li>
                                    <li><a class="dropdown-item" href="#">TLC</a></li>
                                    <li><a class="dropdown-item" href="#">Softlogic</a></li>
                                    <li><a class="dropdown-item" href="#">Sony</a></li>
                                </ul>

                            </div>
                        </div>

                        <div class="col-2">
                            <span class="text-black-50">About Us</span>
                        </div>

                        <div class="col-2">
                            <span class="text-black-50">Contact Us</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="empty-area"></div>

    <%---------------------------------------------------------------------------------------------%>
    <%---------------------------------------------------------------------------------------------%>

    <layout:block name="contents"></layout:block>


    <%---------------------------------------------------------------------------------------------%>
    <%---------------------------------------------------------------------------------------------%>

    <div class="row bg-dark text-center text-md-start">

        <div class="col-12 col-lg-10 offset-lg-1 text-white p-5">
            <div class="row">

                <div class="col-12 col-lg-3">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center justify-content-lg-start">
                            <div class="logo-white"></div>
                        </div>

                        <div class="col-12 mt-2">
                            <p class="text-white-50">Radiance Electronics.The best electonic items at the right
                                place.</p>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-3">
                    <span class="d-block footer-titles">My Account</span>
                    <a href="" class="d-block footer-links">My Account</a>
                    <a href="" class="d-block footer-links">Checkout</a>
                    <a href="${BASE_URL}cart" class="d-block footer-links">Shopping Cart</a>
                    <a href="${BASE_URL}wishlist" class="d-block footer-links">Wishlist</a>
                </div>

                <div class="col-12 col-lg-3">
                    <span class="d-block footer-titles">Custommer Care</span>
                    <a href="" class="d-block footer-links">Help Center</a>
                    <a href="" class="d-block footer-links">How to Buy</a>
                    <a href="" class="d-block footer-links">Track Your Order</a>
                    <a href="" class="d-block footer-links">Returns & Refunds</a>
                </div>

                <div class="col-12 col-lg-3">
                    <span class="d-block footer-titles">Faq</span>
                    <a href="" class="d-block footer-links">Faq</a>
                    <a href="" class="d-block footer-links">Contact Us</a>

                    <div class="mt-2">

                        <button class="social-btns"><i class="bi bi-facebook"></i></button>
                        <button class="social-btns"><i class="bi bi-instagram"></i></button>
                        <button class="social-btns"><i class="bi bi-twitter"></i></button>
                        <button class="social-btns"><i class="bi bi-linkedin"></i></button>
                        <button class="social-btns"><i class="bi bi-youtube"></i></button>

                    </div>

                    <div class="mt-2">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control bg-drk" aria-describedby="button-addon2">
                            <button class="send-btn p-2" type="button" id="button-addon2">Send</button>
                        </div>
                    </div>

                </div>

            </div>

            <hr>

            <div class="row">
                <div class="col-12 text-center">
                    <span class="sm-text text-white-50">&copy; Radiance . All right Reserved.</span>
                </div>
            </div>

        </div>

    </div>

</div>

<script>
    const BASE_URL = ${BASE_URL};
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${BASE_URL}assets/js/bootstrap.bundle.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${BASE_URL}assets/js/script.js"></script>
<script src="${BASE_URL}assets/js/summernote.min.js"></script>
<script src="${BASE_URL}assets/js/spartan-multi-image-picker.js"></script>
<script src="//code.tidio.co/obgngwi69oy3kootdyykcvyeujlvlgs1.js" async></script>

</body>

</html>
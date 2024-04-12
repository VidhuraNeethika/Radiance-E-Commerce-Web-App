<%@ page import="com.apx.radiance.service.UserService" %>
<%@ page import="com.apx.radiance.util.JwtTokenUtil" %>
<%@ page import="com.apx.radiance.entity.User" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Wishlist" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    if (isSession||isAdminSession) {

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session openSession = sessionFactory.openSession();

        Query<Wishlist> wishlistQuery = openSession.createQuery("select w from Wishlist w where w.user.id=:userID", Wishlist.class);
        List<Wishlist> wishlistList = wishlistQuery.setParameter("userID", userId).getResultList();

//        List<Cart> cartList = openSession.createQuery("select c from Cart c", Cart.class).getResultList();
        pageContext.setAttribute("wishListItems", wishlistList);

    }

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">


        <body class="main-background">

        <div class="container-fluid">
            <div class="row">

                <div class="col-12 py-3 ps-4">

                    <a href="index.php" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a class="pagination-links">My Account</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="wishlist.php" class="pagination-links active-page">Wishlist</a>

                </div>

                <div class="col-12">
                    <div class="row">

                        <!-- .......................................small device account menu.................................................... -->

                        <div class="tab d-block d-lg-none">

                            <div class="row">
                                <p>
                                    <button class="small-my-ac-btn-wc col-12" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                        My Account
                                    </button>
                                </p>

                                <div class="collapse" id="collapseExample">
                                    <div class="card card-body">

                                        <button class="tablinks">Overview</button>
                                        <button class="tablinks">My Orders</button>
                                        <button class="tablinks">Feedback</button>
                                        <button class="tablinks">Shipping Address</button>

                                        <button class="tablinks-hr">
                                            <hr>
                                        </button>

                                        <button class="tablinks">Cart</button>
                                        <button class="tablinks">Account Details</button>
                                        <button class="tablinks">About Us</button>
                                        <button class="tablinks">Contact Us</button>

                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- .......................................small device account menu.................................................... -->

                        <div class="tab col-3 d-none d-lg-block">

                            <div class="row px-2">
                                <div class="col-12 bg-dark text-white py-2">
                                    <span>My Account</span>
                                </div>
                            </div>

                            <button class="tablinks active mt-2">Overview</button>
                            <button class="tablinks">My Orders</button>
                            <button class="tablinks">Feedback</button>
                            <button class="tablinks">Shipping Address</button>

                            <button class="tablinks-hr">
                                <hr>
                            </button>

                            <button class="tablinks">Cart</button>
                            <button class="tablinks">Account Details</button>
                            <button class="tablinks">About Us</button>
                            <button class="tablinks">Contact Us</button>

                        </div>

                        <div class="col-12 col-lg-9">

                            <div id="Overview" class="tabcontent">

                                <div class="col-9 mb-3 mt-3 mt-md-0">
                                    <h5 class="fw-bold">Wishlist Overview</h5>
                                    <span class="badge bg-dark ms-3">${wishListItems.size()}</span>
                                    <span class="fw-bold ms-2">Products</span>

                                </div>

                                <div class="row">

                                    <c:forEach var="wishListSet" items="${wishListItems}">

                                        <div class="col-12 mt-2">
                                            <div class="row p-2 bg-white shadow">

                                                <div class="col-md-3 text-center pt-lg-2 long-list-img">
                                                    <c:forEach var="productImage" items="${wishListSet.product.product_images}">
                                                        <img class="img-fluid img-responsive rounded product-image"
                                                             src="${BASE_URL}${productImage.path_01}">
                                                    </c:forEach>
                                                </div>

                                                <div class="col-md-6 mt-1">

                                                    <label class="fs-mini text-black-50">${wishListSet.product.modelHasBrand.model.name}</label>
                                                    <h5 class="fw-bold text-truncate">${wishListSet.product.title}</h5>
                                                    <div class="d-flex flex-row">
                                                        <div class="ratings mr-2">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <span>${wishListSet.product.qty+10} SOLD</span>
                                                    </div>
                                                    <span class="dscnt-p">-${wishListSet.product.qty+4}%</span></span>
                                                    <div class="mt-1 mb-1 spec-1"><span>Brand : ${wishListSet.product.modelHasBrand.brand.name}</span></div>
                                                    <div class="mt-1 mb-1 spec-1"><span>Description : </span></div>
                                                    <p class="text-justify text-truncate para mb-0">
                                                            ${wishListSet.product.description}<br><br></p>

                                                </div>

                                                <div class="align-items-center align-content-center col-md-3 border-start-1 mt-1">

                                                    <div class="">
                                                        <h4 class="mr-1 price-text">LKR.${wishListSet.product.price.intValue()}.00</h4>
                                                        <span class="text-decoration-line-through text-black-50 d-block">LKR.${wishListSet.product.price.intValue()+1000}.00</span>
                                                    </div>

                                                    <h6 class="text-success">Shipping : LKR.${wishListSet.product.delivery_fee.intValue()}.00</h6>

                                                    <div>
                                                        <label class="availability"></label>
                                                        <label class="fs-mini">Available</label>
                                                    </div>

                                                    <div class="d-flex flex-column mt-4">
                                                        <button onclick="addToCart(${wishListSet.product.id});" class="add-to-wishlist-btn" type="button">Add to Cart</button>
                                                        <button onclick="removeFromWishlist(${wishListSet.product.id})" class="remove-btn mt-2" type="button">Remove</button>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>

                                    </c:forEach>

                                    <div class="col-12 d-flex justify-content-center pt-3">

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">

                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Previous">
                                                        <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                                    </a>
                                                </li>

                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>

                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Next">
                                                        <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                                    </a>
                                                </li>

                                            </ul>
                                        </nav>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>

        </body>


    </layout:put>

</layout:extends>
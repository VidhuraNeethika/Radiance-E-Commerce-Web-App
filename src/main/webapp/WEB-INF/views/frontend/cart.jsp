<%@ page import="com.apx.radiance.service.UserService" %>
<%@ page import="com.apx.radiance.util.JwtTokenUtil" %>
<%@ page import="com.apx.radiance.entity.User" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Cart" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
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

        Query<Cart> cartQuery = openSession.createQuery("select c from Cart c where c.user.id=:userID", Cart.class);
        List<Cart> cartList = cartQuery.setParameter("userID", userId).getResultList();

//        List<Cart> cartList = openSession.createQuery("select c from Cart c", Cart.class).getResultList();
        pageContext.setAttribute("cartItems", cartList);

        Double cartTotal = 0.0;
        Double shippingTotal = 0.0;
        Double grandTotal = 0.0;

        Iterator<Cart> cartIterator = cartList.iterator();
        while (cartIterator.hasNext()){
            Cart cartData = cartIterator.next();

            cartTotal = cartTotal+cartData.getProduct().getPrice();
            shippingTotal = shippingTotal+cartData.getProduct().getDelivery_fee();

        }

        grandTotal = cartTotal+shippingTotal;

        pageContext.setAttribute("cartTotal",cartTotal);
        pageContext.setAttribute("shippingTotal",shippingTotal);
        pageContext.setAttribute("grandTotal",grandTotal);

    }

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <body class="main-background">

        <div class="container-fluid">
            <div class="row">

                <div class="col-12 py-3 ps-4 mt-3 mt-lg-1">

                    <a href="" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="" class="pagination-links">My Account</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="" class="pagination-links active-page">Cart</a>

                </div>

                <div class="col-12 col-lg-2">
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

                        <div class="tab col-12 d-none d-lg-block">

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

                    </div>
                </div>

                <div class="col-12 col-md-7">

                    <div class="d-flex justify-content-center row px-3 mb-3">



                        <div class="col-12 mb-3 mt-3 mt-md-0">
                            <h5 class="fw-bold">Cart Overview</h5>
                            <span class="badge bg-dark ms-2">${cartItems.size()}</span>
                            <span class="fw-bold ms-2">Products</span>
                        </div>

                        <c:forEach var="cartSet" items="${cartItems}">

                            <div class="col-12 mt-2">
                                <div class="row p-2 bg-white shadow">

                                    <div class="col-md-3 mt-1 text-center pt-lg-2 long-list-img">
                                        <c:forEach var="productImage" items="${cartSet.product.product_images}">
                                            <img onclick="singleProductView(${cartSet.product.id})" class="img-fluid img-responsive rounded product-image"
                                                 src="${BASE_URL}${productImage.path_01}">
                                        </c:forEach>
                                    </div>

                                    <div class="col-md-6 mt-1">

                                        <label class="fs-mini text-black-50">${cartSet.product.modelHasBrand.model.name}</label>
                                        <h5 class="fw-bold text-truncate c-pointer" onclick="singleProductView(${cartSet.product.id})">${cartSet.product.title}</h5>
                                        <div class="d-flex flex-row">
                                            <div class="ratings mr-2">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <span>${cartSet.product.qty+10} SOLD</span>
                                        </div>
                                        <span class="dscnt-p">-${cartSet.product.qty+4}%</span></span>
                                        <div class="mt-1 mb-1 spec-1"><span>Brand : ${cartSet.product.modelHasBrand.brand.name}</span></div>
                                        <div class="mt-1 mb-1 spec-1"><span>Description : </span></div>
                                        <p class="text-justify text-truncate para mb-0">
                                                ${cartSet.product.description}<br><br></p>

                                    </div>

                                    <div class="align-items-center align-content-center col-md-3 border-start-1 mt-1">

                                        <div class="">
                                            <h4 class="mr-1 price-text">LKR.${cartSet.product.price.intValue()}.00</h4>
                                            <span class="text-decoration-line-through text-black-50 d-block">LKR.${cartSet.product.price.intValue()+1000}.00</span>
                                        </div>

                                        <h6 class="text-success">Shipping : LKR.${cartSet.product.delivery_fee.intValue()}.00</h6>

                                        <div>
                                            <label class="availability"></label>
                                            <label class="fs-mini">Available</label>
                                        </div>

                                        <div class="d-flex flex-column mt-4">
                                            <button onclick="addToWishlist(${cartSet.product.id});" class="add-to-wishlist-btn" type="button">Add to wishlist</button>
                                            <button onclick="removeFromCart(${cartSet.product.id})" class="remove-btn mt-2" type="button">Remove</button>
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

                <div class="col-12 col-md-3 rounded">
                    <div class="row px-2 mt-2">

                        <div class="col-12 mb-3 mt-3 mt-md-0">
                            <span class="fw-bold">Payment Summery</span>
                        </div>

                        <div class="col-12 bg-white py-3">

                            <div class="row py-2">
                                <div class="col-6 text-start">
                                    <span class="capitalize-text fw-bold">Sub Total</span>
                                </div>
                                <div class="col-6 text-end">
                                    <span>LKR.${cartTotal.intValue()}.00</span>
                                </div>
                            </div>

                            <div class="row py-2">
                                <div class="col-6 text-start">
                                    <span class="capitalize-text fw-bold">Shipping</span>
                                </div>
                                <div class="col-6 text-end">
                                    <span>LKR.${shippingTotal.intValue()}.00</span>
                                </div>
                            </div>

                            <div class="row py-2">
                                <div class="col-6 text-start">
                                    <span class="capitalize-text fw-bold">Tax</span>
                                </div>
                                <div class="col-6 text-end">
                                    <span>LKR.00.00</span>
                                </div>
                            </div>

                            <div class="row mt-2 bg-light py-2">
                                <div class="col-6 text-start">
                                    <span class="capitalize-text fw-bold">Discount</span>
                                </div>
                                <div class="col-6 text-end">
                                    <span>LKR.00.00</span>
                                </div>
                            </div>

                            <div class="row mt-2 bg-danger text-white py-2">
                                <div class="col-6 text-start">
                                    <span class="capitalize-text fw-bold">Total</span>
                                </div>
                                <div class="col-6 text-end">
                                    <span class="fw-bold">LKR.${grandTotal.intValue()}.00</span>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-12 d-grid">
                                    <button class="text-center checkout-btn">Check Out</button>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </div>
        </div>

    </layout:put>

</layout:extends>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session openSession = sessionFactory.openSession();

    List<Product> productList = openSession.createQuery("select product from Product product order by product.createdAt desc limit 4", Product.class).getResultList();
    pageContext.setAttribute("productSet", productList);

    Query<Product> eletronicProductQuery = openSession.createQuery("select product from Product product where product.category.name=:name order by product.createdAt desc limit 4", Product.class);
    List<Product> electronicProductList = eletronicProductQuery.setParameter("name", "Electronic Accessories").getResultList();
    pageContext.setAttribute("electronicProductSet", electronicProductList);

    Query<Product> computerProductQuery = openSession.createQuery("select product from Product product where product.category.name=:name order by product.createdAt desc limit 4", Product.class);
    List<Product> computerProductList = computerProductQuery.setParameter("name", "Computer Accessories").getResultList();
    pageContext.setAttribute("computerProductSet", computerProductList);

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <body onload="offerTimer();">

        <div class="container-fluid">
            <div class="row">

                <div class="side-menu d-none d-lg-flex align-items-center shadow">
                    <div class="div">
                        <button class="d-block side-menu-btns"><i class="bi bi-bag"></i></button>
                        <button class="d-block side-menu-btns"><i class="bi bi-heart"></i></button>
                        <button class="d-block side-menu-btns"><i class="bi bi-clock-history"></i></button>
                        <button class="d-block side-menu-btns"><i class="bi bi-bell-slash"></i></button>
                        <button class="d-block side-menu-btns"><i class="bi bi-share"></i></button>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-3">
                    <div class="row padding-sm">

                        <div class="col-3 bg-white rounded-cornrs d-none d-xl-block">
                            <div class="row category-area">

                                <div class="col-12 p-3">
                                    <span class="fw-bold"><i class="bi bi-grid me-3"></i> Categories</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-phone-vibrate me-3"></i> Electronic Devices</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-phone me-3"></i> Mobile Accessories</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-display me-3"></i> Computer Accessories</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-camera me-3"></i> Camera Accessories</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-pc-display me-3"></i> Computer Components</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-hdd-network me-3"></i> Network Components</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-tv me-3"></i> TV and Video Devices</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-door-closed me-3"></i> Cooling and Heating</span>
                                </div>

                                <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                    <span class="ps-1 text-black-50"><i class="bi bi-safe2 me-3"></i> Washing Machines</span>
                                </div>

                            </div>
                        </div>

                        <div class="col-12 col-xl-9 slider-area">
                            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">

                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="${BASE_URL}assets/pictures/slider/s01.jpg" class="d-block w-100 rounded-cornrs" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${BASE_URL}assets/pictures/slider/s02.jpg" class="d-block w-100 rounded-cornrs" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img src="${BASE_URL}assets/pictures/slider/s03.jpg" class="d-block w-100 rounded-cornrs" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                        </div>
                                    </div>
                                </div>
                                <button class="carousel-control-prev">
                                    <span class="carousel-control-prev-icon" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next">
                                    <span class="carousel-control-next-icon" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                    <span class="visually-hidden">Next</span>
                                </button>

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-12 mt-4 d-block d-lg-none">
                    <div class="row bg-dark text-white p-2">
                        <div class="col-10">
                            <span><span class="fw-bold"><i class="bi bi-grid me-3"></i> Categories</span></span>
                        </div>
                        <div class="col-2 d-flex justify-content-end">
                            <button class="menu-btn text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#categories" aria-controls="offcanvasExample"><i class="bi bi-justify-right fs-4"></i></button>
                        </div>
                    </div>
                </div>

                <!-- off canvas -->
                <div class="offcanvas offcanvas-start" tabindex="-1" id="categories" aria-labelledby="offcanvasExampleLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Categories</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <div class="row category-area">

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-phone-vibrate me-3"></i> Electronic Devices</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-phone me-3"></i> Mobile Accessories</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-display me-3"></i> Computer Accessories</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-camera me-3"></i> Camera Accessories</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-pc-display me-3"></i> Computer Components</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-hdd-network me-3"></i> Network Components</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-tv me-3"></i> TV and Video Devices</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-door-closed me-3"></i> Cooling and Heating</span>
                            </div>

                            <div class="col-12 py-1 py-xxl-2 pt-2 pt-xxl-2">
                                <span class="ps-1 text-black-50"><i class="bi bi-safe2 me-3"></i> Washing Machines</span>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- off canvas -->

                <div class="col-12 col-lg-10 offset-lg-1 mt-4">
                    <div class="row">
                        <div class="col-4">
                            <img src="assets/pictures/posters/sm-banner-01.jpg" class="posters shadow" alt="">
                        </div>
                        <div class="col-4">
                            <img src="assets/pictures/posters/sm-banner-02.jpg" class="posters shadow" alt="">
                        </div>
                        <div class="col-4">
                            <img src="assets/pictures/posters/sm-banner-03.jpg" class="posters shadow" alt="">
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-4">
                    <div class="row">

                        <div class="col-12 col-lg-4">
                            <div class="sale-countdown">
                                <div>
                                    <span class="coundwn-timer-txt">On sale now</span>
                                </div>
                                <div class="timer">
                                    <span class="sm-text d-inline-block text-black ms-2 me-2">Ending in </span>
                                    <div class="timer-details shadow" id="days"></div> :
                                    <div class="timer-details shadow" id="hour"></div> :
                                    <div class="timer-details shadow" id="min"></div> :
                                    <div class="timer-details shadow" id="secounds"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-2 d-block d-lg-none"></div>

                        <div class="col-8 col-lg-4 text-center mt-4">
                            <span class="main-heading">New <span class="main-heading clr"> Arrivals</span></span>
                            <div class="underline-mn"></div>
                        </div>

                        <div class="col-2 col-lg-4 mt-4 d-flex justify-content-end pe-4">
                            <button class="more-btn">More <i class="bi bi-chevron-right ms-2 rght-arw"></i></button>
                        </div>

                    </div>
                </div>

                <!-- new arrivals -->
                <div class="col-12 col-lg-10 offset-lg-1 mt-3">
                    <div class="row">

                        <c:forEach var="productList" items="${productSet}">

                            <div class="col-6 col-md-4 col-lg-3 p-2">
                                <div class="crd">

                                    <div class="img-file">

                                        <c:forEach var="productImage" items="${productList.product_images}">
                                            <img src="${BASE_URL}${productImage.path_01}">
                                        </c:forEach>

                                    </div>

                                    <div class="crd-info pt-2">
                                        <h6 class="crd-title">${productList.title}</h6>
                                        <div class="crd-other-details">
                                            <span class="sold-lst">${productList.qty+10} sold <span class="dscnt-p fw-bolder">NEW</span></span>
                                            <label class="crd-lbl-1 d-none">New</label>
                                            <div class="starts">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-half"></i>
                                            </div>
                                            <span class="shipping">Shipping : LKR.${productList.delivery_fee.intValue()}.00</span>
                                        </div>
                                        <div class="sub-info">
                                            <div class="price"><span
                                                    class="lkr">LKR.</span>${productList.price.intValue()}<span
                                                    class="lkr">.00</span>
                                                <span class="dscnt d-block">LKR. ${productList.price.intValue()+1000}.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="crd-overlay">
                                        <a onclick="addToCart(${productList.id});" style="--i:1;" class="bi bi-bag"></a>
                                        <a onclick="addToWishlist(${productList.id});" style="--i:2;" class="bi bi-heart"></a>
                                        <a onclick="singleProductView(${productList.id});" style="--i:3;" class="bi bi-eye"></a>
                                    </div>
                                </div>

                            </div>

                        </c:forEach>

                    </div>
                </div>

<%--                <div class="col-12 col-lg-10 offset-lg-1 mt-4">--%>
<%--                    <div class="row g-2">--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img apple d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">Apple</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img samsung d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">Samsung</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img huawei d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">Huawei</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img tlc d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">TLC</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img softlogic d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">Softlogic</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-6 col-lg-2 p-1">--%>
<%--                            <div class="brand-card-img sony d-flex justify-content-center align-items-center">--%>
<%--                                <span class="text-white">Sony</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>

                <div class="col-12 mt-4 pb-4">
                    <div class="row">
                        <div class="col-12 offset-lg-1 col-lg-10">
                            <div class="row">

                                <div class="col-12 col-md-3 text-center p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-cash big-icon"></i></span>
                                    <span class="d-block fw-bold">Great Value</span>
                                    <span class="d-block">We offer competitive prices on our 100 million plus product range.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-wallet2 big-icon"></i></span>
                                    <span class="d-block fw-bold">Safe Payment</span>
                                    <span class="d-block">Pay with the worlds most popular and secure payment methods.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-shield-check big-icon"></i></span>
                                    <span class="d-block fw-bold">Shop with confidence</span>
                                    <span class="d-block">Our Buyer Protection covers your purchase from click to delivery.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-telephone big-icon"></i></span>
                                    <span class="d-block fw-bold">Help Center</span>
                                    <span class="d-block">Round-the-clock assistance for a smooth shopping experience.</span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-4">
                    <div class="row">
                        <div class="col-3">
                            <img src="assets/pictures/posters/banner-7.jpg" class="posters shadow" alt="">
                            <img src="assets/pictures/posters/banner-8.jpg" class="posters shadow mt-4" alt="">
                        </div>
                        <div class="col-3">
                            <img src="assets/pictures/posters/poster 13.jpg" class="posters shadow" alt="">
                        </div>
                        <div class="col-3">
                            <img src="assets/pictures/posters/poster 12.jpg" class="posters shadow" alt="">
                        </div>
                        <div class="col-3">
                            <img src="assets/pictures/posters/poster 09.jpg" class="posters shadow" alt="">
                        </div>
                    </div>
                </div>

                <!-- electronic devices -->
                <div class="col-12 col-lg-10 offset-lg-1">
                    <div class="row">
                        <div class="col-2 col-lg-4 mt-4 d-flex justify-content-end pe-4">
                        </div>

                        <div class="col-8 col-lg-4 text-center mt-5">
                            <span class="main-heading">Electronic<span class="main-heading clr"> Devices</span></span>
                            <div class="underline-mn"></div>
                        </div>

                        <div class="col-2 col-lg-4 mt-5 d-flex justify-content-end pe-4">
                            <button class="more-btn">More <i class="bi bi-chevron-right ms-2 rght-arw"></i></button>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-3">
                    <div class="row">

                        <c:forEach var="elecProductList" items="${electronicProductSet}">

                            <div class="col-6 col-md-4 col-lg-3 p-2">
                                <div class="crd">

                                    <div class="img-file">

                                        <c:forEach var="productImage" items="${elecProductList.product_images}">
                                            <img src="${BASE_URL}${productImage.path_01}">
                                        </c:forEach>

                                    </div>

                                    <div class="crd-info pt-2">
                                        <h6 class="crd-title">${elecProductList.title}</h6>
                                        <div class="crd-other-details">
                                            <span class="sold-lst">${elecProductList.qty+10} sold <span class="dscnt-p">-${elecProductList.qty+4}%</span></span>
                                            <label class="crd-lbl-1 d-none">New</label>
                                            <div class="starts">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-half"></i>
                                            </div>
                                            <span class="shipping">Shipping : LKR.${elecProductList.delivery_fee.intValue()}.00</span>
                                        </div>
                                        <div class="sub-info">
                                            <div class="price"><span
                                                    class="lkr">LKR.</span>${elecProductList.price.intValue()}<span
                                                    class="lkr">.00</span>
                                                <span class="dscnt d-block">LKR. ${elecProductList.price.intValue()+1000}.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="crd-overlay">
                                        <a onclick="addToCart(${elecProductList.id});" style="--i:1;" class="bi bi-bag"></a>
                                        <a onclick="addToWishlist(${elecProductList.id});" style="--i:2;" class="bi bi-heart"></a>
                                        <a onclick="singleProductView(${elecProductList.id});" style="--i:3;" class="bi bi-eye"></a>
                                    </div>
                                </div>

                            </div>

                        </c:forEach>

                    </div>
                </div>

                <!-- computer devices -->
                <div class="col-12 col-lg-10 offset-lg-1">
                    <div class="row">
                        <div class="col-2 col-lg-4 mt-4 d-flex justify-content-end pe-4">
                        </div>

                        <div class="col-8 col-lg-4 text-center mt-5">
                            <span class="main-heading">Computers and <span class="main-heading clr"> Accessories</span></span>
                            <div class="underline-mn"></div>
                        </div>

                        <div class="col-2 col-lg-4 mt-5 d-flex justify-content-end pe-4">
                            <button class="more-btn">More <i class="bi bi-chevron-right ms-2 rght-arw"></i></button>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-3">
                    <div class="row">

                        <c:forEach var="computerProductList" items="${computerProductSet}">

                            <div class="col-6 col-md-4 col-lg-3 p-2">
                                <div class="crd">

                                    <div class="img-file">

                                        <c:forEach var="productImage" items="${computerProductList.product_images}">
                                            <img src="${BASE_URL}${productImage.path_01}">
                                        </c:forEach>

                                    </div>

                                    <div class="crd-info pt-2">
                                        <h6 class="crd-title">${computerProductList.title}</h6>
                                        <div class="crd-other-details">
                                            <span class="sold-lst">${computerProductList.qty+10} sold <span class="dscnt-p">-${computerProductList.qty+4}%</span></span>
                                            <label class="crd-lbl-1 d-none">New</label>
                                            <div class="starts">
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-fill"></i>
                                                <i class="bi bi-star-half"></i>
                                            </div>
                                            <span class="shipping">Shipping : LKR.${computerProductList.delivery_fee.intValue()}.00</span>
                                        </div>
                                        <div class="sub-info">
                                            <div class="price"><span
                                                    class="lkr">LKR.</span>${computerProductList.price.intValue()}<span
                                                    class="lkr">.00</span>
                                                <span class="dscnt d-block">LKR. ${computerProductList.price.intValue()+1000}.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="crd-overlay">
                                        <a onclick="addToCart(${computerProductList.id});" style="--i:1;" class="bi bi-bag"></a>
                                        <a onclick="addToWishlist(${computerProductList.id});" style="--i:2;" class="bi bi-heart"></a>
                                        <a onclick="singleProductView(${computerProductList.id});" style="--i:3;" class="bi bi-eye"></a>
                                    </div>
                                </div>

                            </div>

                        </c:forEach>

                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-4 d-none d-xl-block">
                    <div class="row">
                        <div class="col-3">
                            <img src="assets/pictures/posters/poster 11.jpg" class="posters shadow" alt="">
                        </div>
                        <div class="col-9">
                            <img src="assets/pictures/posters/poster 10.jpg" class="posters shadow" alt="">
                        </div>
                    </div>
                </div>

                <div class="col-12 bg-white mt-4 pb-4">
                    <div class="row">
                        <div class="col-12 offset-lg-1 col-lg-10">
                            <div class="row">

                                <div class="col-12 text-black-50 text-center big-icon">
                                    <span class="">Introducing our NEW online store with more ways to explore your favourite iteams</span>
                                </div>

                                <div class="col-12 col-md-3 text-center bg-white p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-cash big-icon"></i></span>
                                    <span class="d-block fw-bold">Great Value</span>
                                    <span class="d-block">We offer competitive prices on our 100 million plus product range.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center bg-white p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-wallet2 big-icon"></i></span>
                                    <span class="d-block fw-bold">Safe Payment</span>
                                    <span class="d-block">Pay with the worlds most popular and secure payment methods.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center bg-white p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-shield-check big-icon"></i></span>
                                    <span class="d-block fw-bold">Shop with confidence</span>
                                    <span class="d-block">Our Buyer Protection covers your purchase from click to delivery.</span>
                                </div>

                                <div class="col-12 col-md-3 text-center bg-white p-3 text-black-50">
                                    <span class="d-block"><i class="bi bi-telephone big-icon"></i></span>
                                    <span class="d-block fw-bold">Help Center</span>
                                    <span class="d-block">Round-the-clock assistance for a smooth shopping experience.</span>
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

<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session openSession = sessionFactory.openSession();

    List<Product> productList = openSession.createQuery("select product from Product product order by product.createdAt desc", Product.class).getResultList();
    pageContext.setAttribute("productSet", productList);

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <body>

        <div class="container-fluid">
            <div class="row">

                <div class="col-12 py-3 ps-4 mt-4 mt-lg-2">

                    <a href="${BASE_URL}" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="" class="pagination-links">Products</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="" class="pagination-links active-page">Search Result</a>

                </div>

                <!-- ......................................small-device-filters..................................................... -->

                <div class="col-12 d-block d-lg-none">
                    <button class="filters-btn-full capitalize-text bg-dark text-white my-2 w-100 text-start"
                            type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample3"
                            aria-controls="offcanvasExample">
                        Filters
                    </button>

                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample3"
                         aria-labelledby="offcanvasExampleLabel">

                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Filters</h5>
                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                                    aria-label="Close"></button>
                        </div>

                        <div class="offcanvas-body">

                            <div class="row">

                                <div class="col-12 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Categories</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Electronic Devices</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Mobile Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Computer Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Camera Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Computer Components</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Network Components</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>TV and Video Devices</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Cooling and Heating</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Washing Machines</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Condition</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Brand New</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Used</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Ram Memory</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>4 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>8 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>16 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>32 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>64 GB</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Brands</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>ASUS</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>APPLE</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>DELL</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>MSI</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>LENOVO</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Color</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Red</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>White</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Black</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Rose Gold</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Green</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

                <!-- ......................................small-device-filters..................................................... -->

                <div class="col-12 col-lg-3 bg-white d-none d-lg-block">
                    <div class="row px-3">
                        <div class="col-12">
                            <div class="row pt-4">

                                <div class="col-12 bg-dark text-white py-2">
                                    <span class="capitalize-text">Filters</span>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Categories</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Electronic Devices</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Mobile Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Computer Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Camera Accessories</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Computer Components</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Network Components</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>TV and Video Devices</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Cooling and Heating</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Washing Machines</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Memory</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>4 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>8 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>16 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>32 GB</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="r" id="">
                                                        <span>64 GB</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Brands</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>ASUS</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>APPLE</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>DELL</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>MSI</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>LENOVO</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Condition</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Brand New</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Used</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-12 mt-3 pb-2 main-background">
                                    <div class="row ps-1">

                                        <div class="col-12 pt-2">
                                            <span class="capitalize-text fw-bold">Color</span>
                                        </div>

                                        <div class="col-12 mt-1">
                                            <div class="row">
                                                <div class="col-12 text-black-50">

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Red</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>White</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Black</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Rose Gold</span>
                                                    </div>

                                                    <div class="ps-3 mt-1">
                                                        <input type="radio" name="b" id="">
                                                        <span>Green</span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-9">
                    <div class="row">
                        <div class="col-12 py-2 bg-white">
                            <div class="row">

                                <div class="col-12 col-lg-3">
                                </div>

                                <div class="col-4 col-lg-3">
                                    <div class="dropdown">
                                        <button class="btn-my dropdown-toggle" type="button" id="dropdownMenuButton1"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Sort by Price
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li><a class="dropdown-item" href="#">Pirce : Low to High</a></li>
                                            <li><a class="dropdown-item" href="#">Pirce : High to Low</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-4 col-lg-3">
                                    <div class="dropdown">
                                        <button class="btn-my dropdown-toggle" type="button" id="dropdownMenuButton1"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Sort by quatity
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li><a class="dropdown-item" href="#">Qty : Low to High</a></li>
                                            <li><a class="dropdown-item" href="#">Qty : High to Low</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-4 col-lg-3 my-lg-0">
                                    <div class="dropdown">
                                        <button class="btn-my dropdown-toggle" type="button" id="dropdownMenuButton1"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Sort By Newest
                                        </button>
                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                            <li><a class="dropdown-item" href="#">Date : Newest to Old</a></li>
                                            <li><a class="dropdown-item" href="#">Date : Old to Newest</a></li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-12 product-viewmode-toggle">

                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active py-2" id="home-tab" data-bs-toggle="tab"
                                        data-bs-target="#home" type="button" role="tab" aria-controls="home"
                                        aria-selected="true">
                                    <i class="bi bi-grid"></i>
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                                        type="button" role="tab" aria-controls="profile" aria-selected="false">
                                    <i class="bi bi-list-task"></i>
                                </button>
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                <div class="row mt-2 d-flex justify-content-center">

                                    <div class="col-12 ">
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
                                                            <h6 class="crd-title" onclick="singleProductView(${productList.id})">${productList.title}</h6>
                                                            <div class="crd-other-details">
                                                                <span class="sold-lst">${productList.qty+10} sold <span class="dscnt-p">-${productList.qty+4}%</span></span>
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
                                                            <a onclick="addToWishlist(${productList.id});" href="" style="--i:2;" class="bi bi-heart"></a>
                                                            <a href="${BASE_URL}single-product-view?pid=${productList.id}" style="--i:3;" class="bi bi-eye"></a>
                                                        </div>
                                                    </div>

                                                </div>

                                            </c:forEach>

                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

                                <div class="container mt-3 mb-5">
                                    <div class="d-flex justify-content-center row">

                                        <c:forEach var="productList" items="${productSet}">
                                            <div class="col-12 mt-2">
                                                <div class="row p-2 bg-white">

                                                    <div class="col-md-3 mt-1 text-center long-list-img-div" onclick="singleProductView(${productList.id})">
                                                        <c:forEach var="productImage" items="${productList.product_images}">
                                                            <img class="img-fluid img-responsive rounded product-image"
                                                                 src="${BASE_URL}${productImage.path_01}">
                                                        </c:forEach>
                                                    </div>

                                                    <div class="col-md-6 mt-1">

                                                        <label class="fs-mini text-black-50">${productList.modelHasBrand.model.name}</label>
                                                        <h5 class="fw-bold text-truncate" onclick="singleProductView(${productList.id})">${productList.title}</h5>
                                                        <div class="d-flex flex-row">
                                                            <div class="ratings mr-2"><i class="fa fa-star"></i><i
                                                                    class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                    class="fa fa-star"></i></div>
                                                            <span>${productList.qty+10} SOLD</span>
                                                        </div>
                                                        <span class="dscnt-p">-${productList.qty+4}%</span></span>
                                                        <div class="mt-1 mb-1 spec-1"><span>Brand : ${productList.modelHasBrand.brand.name}</span></div>
                                                        <div class="mt-1 mb-1 spec-1"><span>Description : </span></div>
                                                        <p class="text-justify text-truncate para mb-0">
                                                                ${productList.description}<br><br></p>

                                                    </div>

                                                    <div class="align-items-center align-content-center col-md-3 border-start-1 mt-1">

                                                        <div class="">
                                                            <h4 class="mr-1 price-text">
                                                                LKR.${productList.price.intValue()}.00</h4>
                                                            <span class="text-decoration-line-through text-black-50 d-block">LKR.${productList.price.intValue()}.00</span>
                                                        </div>

                                                        <h6 class="text-success">Shipping :
                                                            LKR.${productList.delivery_fee.intValue()}.00</h6>

                                                        <div>
                                                            <label class="availability"></label>
                                                            <label class="fs-mini">Available</label>
                                                        </div>

                                                        <div class="d-flex flex-column mt-4">
                                                            <button onclick="addToCart(${productList.id});" class="details-btn" type="button">Add to Cart</button>
                                                            <button onclick="addToWishlist(${productList.id});" class="add-to-wishlist-btn mt-2" type="button">Add to Wishlist</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="row mt-3 main-background">

                        <div class="col-6 mt-4">
                            <span class="bg-white px-3 py-1">Showing 1-45 of 76 Results</span>
                        </div>

                        <div class="col-6 d-flex justify-content-end pt-3">

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

            <%--        <script>--%>
            <%--            $('.slider').each(function(e) {--%>

            <%--                var slider = $(this),--%>
            <%--                    width = slider.width(),--%>
            <%--                    handle,--%>
            <%--                    handleObj;--%>

            <%--                let svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');--%>
            <%--                svg.setAttribute('viewBox', '0 0 ' + width + ' 83');--%>

            <%--                slider.html(svg);--%>
            <%--                slider.append($('<div>').addClass('active').html(svg.cloneNode(true)));--%>

            <%--                slider.slider({--%>
            <%--                    range: true,--%>
            <%--                    values: [0, 100000],--%>
            <%--                    min: 100,--%>
            <%--                    step: 5,--%>
            <%--                    minRange: 1000,--%>
            <%--                    max: 100000,--%>
            <%--                    create(event, ui) {--%>

            <%--                        slider.find('.ui-slider-handle').append($('<div />'));--%>

            <%--                        $(slider.data('value-0')).html(slider.slider('values', 0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>
            <%--                        $(slider.data('value-1')).html(slider.slider('values', 1).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>
            <%--                        $(slider.data('range')).html((slider.slider('values', 1) - slider.slider('values', 0)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>

            <%--                        setCSSVars(slider);--%>

            <%--                    },--%>
            <%--                    start(event, ui) {--%>

            <%--                        $('body').addClass('ui-slider-active');--%>

            <%--                        handle = $(ui.handle).data('index', ui.handleIndex);--%>
            <%--                        handleObj = slider.find('.ui-slider-handle');--%>

            <%--                    },--%>
            <%--                    change(event, ui) {--%>
            <%--                        setCSSVars(slider);--%>
            <%--                    },--%>
            <%--                    slide(event, ui) {--%>

            <%--                        let min = slider.slider('option', 'min'),--%>
            <%--                            minRange = slider.slider('option', 'minRange'),--%>
            <%--                            max = slider.slider('option', 'max');--%>

            <%--                        if (ui.handleIndex == 0) {--%>
            <%--                            if ((ui.values[0] + minRange) >= ui.values[1]) {--%>
            <%--                                slider.slider('values', 1, ui.values[0] + minRange);--%>
            <%--                            }--%>
            <%--                            if (ui.values[0] > max - minRange) {--%>
            <%--                                return false;--%>
            <%--                            }--%>
            <%--                        } else if (ui.handleIndex == 1) {--%>
            <%--                            if ((ui.values[1] - minRange) <= ui.values[0]) {--%>
            <%--                                slider.slider('values', 0, ui.values[1] - minRange);--%>
            <%--                            }--%>
            <%--                            if (ui.values[1] < min + minRange) {--%>
            <%--                                return false;--%>
            <%--                            }--%>
            <%--                        }--%>

            <%--                        $(slider.data('value-0')).html(ui.values[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>
            <%--                        $(slider.data('value-1')).html(ui.values[1].toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>
            <%--                        $(slider.data('range')).html((slider.slider('values', 1) - slider.slider('values', 0)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '&thinsp;'));--%>

            <%--                        setCSSVars(slider);--%>

            <%--                    },--%>
            <%--                    stop(event, ui) {--%>

            <%--                        $('body').removeClass('ui-slider-active');--%>

            <%--                        let duration = .6,--%>
            <%--                            ease = Elastic.easeOut.config(1.08, .44);--%>

            <%--                        TweenMax.to(handle, duration, {--%>
            <%--                            '--y': 0,--%>
            <%--                            ease: ease--%>
            <%--                        });--%>

            <%--                        TweenMax.to(svgPath, duration, {--%>
            <%--                            y: 42,--%>
            <%--                            ease: ease--%>
            <%--                        });--%>

            <%--                        handle = null;--%>

            <%--                    }--%>
            <%--                });--%>

            <%--                var svgPath = new Proxy({--%>
            <%--                    x: null,--%>
            <%--                    y: null,--%>
            <%--                    b: null,--%>
            <%--                    a: null--%>
            <%--                }, {--%>
            <%--                    set(target, key, value) {--%>
            <%--                        target[key] = value;--%>
            <%--                        if (target.x !== null && target.y !== null && target.b !== null && target.a !== null) {--%>
            <%--                            slider.find('svg').html(getPath([target.x, target.y], target.b, target.a, width));--%>
            <%--                        }--%>
            <%--                        return true;--%>
            <%--                    },--%>
            <%--                    get(target, key) {--%>
            <%--                        return target[key];--%>
            <%--                    }--%>
            <%--                });--%>

            <%--                svgPath.x = width / 2;--%>
            <%--                svgPath.y = 42;--%>
            <%--                svgPath.b = 0;--%>
            <%--                svgPath.a = width;--%>

            <%--                $(document).on('mousemove touchmove', e => {--%>
            <%--                    if (handle) {--%>

            <%--                        let laziness = 4,--%>
            <%--                            max = 24,--%>
            <%--                            edge = 52,--%>
            <%--                            other = handleObj.eq(handle.data('index') == 0 ? 1 : 0),--%>
            <%--                            currentLeft = handle.position().left,--%>
            <%--                            otherLeft = other.position().left,--%>
            <%--                            handleWidth = handle.outerWidth(),--%>
            <%--                            handleHalf = handleWidth / 2,--%>
            <%--                            y = e.pageY - handle.offset().top - handle.outerHeight() / 2,--%>
            <%--                            moveY = (y - laziness >= 0) ? y - laziness : (y + laziness <= 0) ? y + laziness : 0,--%>
            <%--                            modify = 1;--%>

            <%--                        moveY = (moveY > max) ? max : (moveY < -max) ? -max : moveY;--%>
            <%--                        modify = handle.data('index') == 0 ? ((currentLeft + handleHalf <= edge ? (currentLeft + handleHalf) / edge : 1) * (otherLeft - currentLeft - handleWidth <= edge ? (otherLeft - currentLeft - handleWidth) / edge : 1)) : ((currentLeft - (otherLeft + handleHalf * 2) <= edge ? (currentLeft - (otherLeft + handleWidth)) / edge : 1) * (slider.outerWidth() - (currentLeft + handleHalf) <= edge ? (slider.outerWidth() - (currentLeft + handleHalf)) / edge : 1));--%>
            <%--                        modify = modify > 1 ? 1 : modify < 0 ? 0 : modify;--%>

            <%--                        if (handle.data('index') == 0) {--%>
            <%--                            svgPath.b = currentLeft / 2 * modify;--%>
            <%--                            svgPath.a = otherLeft;--%>
            <%--                        } else {--%>
            <%--                            svgPath.b = otherLeft + handleHalf;--%>
            <%--                            svgPath.a = (slider.outerWidth() - currentLeft) / 2 + currentLeft + handleHalf + ((slider.outerWidth() - currentLeft) / 2) * (1 - modify);--%>
            <%--                        }--%>

            <%--                        svgPath.x = currentLeft + handleHalf;--%>
            <%--                        svgPath.y = moveY * modify + 42;--%>

            <%--                        handle.css('--y', moveY * modify);--%>

            <%--                    }--%>
            <%--                });--%>

            <%--            });--%>

            <%--            function getPoint(point, i, a, smoothing) {--%>
            <%--                let cp = (current, previous, next, reverse) => {--%>
            <%--                        let p = previous || current,--%>
            <%--                            n = next || current,--%>
            <%--                            o = {--%>
            <%--                                length: Math.sqrt(Math.pow(n[0] - p[0], 2) + Math.pow(n[1] - p[1], 2)),--%>
            <%--                                angle: Math.atan2(n[1] - p[1], n[0] - p[0])--%>
            <%--                            },--%>
            <%--                            angle = o.angle + (reverse ? Math.PI : 0),--%>
            <%--                            length = o.length * smoothing;--%>
            <%--                        return [current[0] + Math.cos(angle) * length, current[1] + Math.sin(angle) * length];--%>
            <%--                    },--%>
            <%--                    cps = cp(a[i - 1], a[i - 2], point, false),--%>
            <%--                    cpe = cp(point, a[i - 1], a[i + 1], true);--%>
            <%--                return `C ${cps[0]},${cps[1]} ${cpe[0]},${cpe[1]} ${point[0]},${point[1]}`;--%>
            <%--            }--%>

            <%--            function getPath(update, before, after, width) {--%>
            <%--                let smoothing = .16,--%>
            <%--                    points = [--%>
            <%--                        [0, 42],--%>
            <%--                        [before <= 0 ? 0 : before, 42],--%>
            <%--                        update,--%>
            <%--                        [after >= width ? width : after, 42],--%>
            <%--                        [width, 42]--%>
            <%--                    ],--%>
            <%--                    d = points.reduce((acc, point, i, a) => i === 0 ? `M ${point[0]},${point[1]}` : `${acc} ${getPoint(point, i, a, smoothing)}`, '');--%>
            <%--                return `<path d="${d}" />`;--%>
            <%--            }--%>

            <%--            function setCSSVars(slider) {--%>
            <%--                let handle = slider.find('.ui-slider-handle');--%>
            <%--                slider.css({--%>
            <%--                    '--l': handle.eq(0).position().left + handle.eq(0).outerWidth() / 2,--%>
            <%--                    '--r': slider.outerWidth() - (handle.eq(1).position().left + handle.eq(1).outerWidth() / 2)--%>
            <%--                });--%>
            <%--            }--%>
            <%--        </script>--%>
        </body>

    </layout:put>

</layout:extends>
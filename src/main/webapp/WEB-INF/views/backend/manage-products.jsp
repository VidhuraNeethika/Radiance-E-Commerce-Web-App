<%@ page import="com.apx.radiance.entity.Category" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.List" %>
<%@ page import="com.apx.radiance.entity.Model" %>
<%@ page import="com.apx.radiance.entity.Brand" %>
<%@ page import="com.apx.radiance.entity.Product" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session openSession = sessionFactory.openSession();

    List<Category> categories = openSession.createQuery("select category from Category category", Category.class).getResultList();
    pageContext.setAttribute("categorySet", categories);

    List<Model> models = openSession.createQuery("select m from Model m", Model.class).getResultList();
    pageContext.setAttribute("modelSet", models);

    List<Brand> brands = openSession.createQuery("select b from Brand b", Brand.class).getResultList();
    pageContext.setAttribute("brandSet", brands);

    List<Product> productList = openSession.createQuery("select product from Product product order by product.createdAt desc", Product.class).getResultList();
    pageContext.setAttribute("productSet", productList);

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <%--summer note--%>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <%--summer note--%>

        <div class="container-fluid">

            <div class="row">
                <div class="col-12 my-4">
                    <div class="row">

                        <div class="col-3 bg-white p-2 d-none d-lg-block">
                                <%--large navigations list--%>
                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">

                                    <a href="${BASE_URL}admin-panel" class="nav-btn  w-100 text-start">
                                        <i class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                    </a>

                                    <a href="${BASE_URL}admin/product" class="nav-btn active w-100 text-start">
                                        <i class="bi bi-box-seam me-3 ms-1"></i> Manage Products
                                    </a>

                                    <a href="${BASE_URL}admin/orders" class="nav-btn w-100 text-start"><i
                                            class="bi bi-cart me-3 ms-1"></i> Orders
                                    </a>

                                    <a href="${BASE_URL}admin/users" class="nav-btn w-100 text-start"
                                       id="nav-contact-tab">
                                        <i class="bi bi-people me-3 ms-1"></i> Manage Users
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-bar-chart me-3 ms-1"></i> Statictics
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-chat-left-text me-3 ms-1"></i> Reviews
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-wallet2 me-3 ms-1"></i> Transactions
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-box2-heart me-3 ms-1"></i> Offers
                                    </a>

                                    <hr>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-person-circle me-3 ms-1"></i> Account
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start">
                                        <i class="bi bi-box-arrow-in-left me-3 ms-1"></i> Log Out
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-brush me-3 ms-1"></i> Appearance
                                    </a>

                                    <a href="" class="nav-btn w-100 text-start"><i
                                            class="bi bi-gear me-3 ms-1"></i> Settings
                                    </a>

                                </div>
                            </nav>
                                <%--large navigations list--%>
                        </div>

                        <div class="col-12 col-lg-9">

                            <div class="tab-content" id="nav-tabContent">

                                    <%--Dashboard header--%>
                                <div class="row">

                                    <div class="col-12 col-lg-10">
                                        <div class="input-group mb-3">
                                            <span class="input-group-text" id="basic-addon1"><i
                                                    class="bi bi-search"></i></span>
                                            <input type="text" class="form-control" placeholder="Search...."
                                                   aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                    </div>

                                    <div class="col-10 d-grid d-block d-lg-none">
                                        <button class="btn-my w-100 text-start fw-bolder" type="button"
                                                data-bs-toggle="offcanvas" data-bs-target="#offcanvasExamplead"
                                                aria-controls="offcanvasExample"><i class="bi bi-grid me-3"></i> Menu
                                        </button>
                                    </div>

                                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExamplead"
                                         aria-labelledby="offcanvasExampleLabel">
                                        <div class="offcanvas-header">
                                            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
                                            <button type="button" class="btn-close text-reset"
                                                    data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                        </div>

                                            <%--small devices--%>
                                        <div class="offcanvas-body">

                                            <div class="row">
                                                <div class="col-12 bg-white p-2">

                                                    <nav>
                                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">

                                                            <a href="${BASE_URL}admin-panel"
                                                               class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                                            </a>

                                                            <a href="${BASE_URL}admin/product"
                                                               class="nav-btn w-100 text-start active"
                                                               id="nav-profile-tab"><i
                                                                    class="bi bi-box-seam me-3 ms-1"></i> Manage
                                                                Products
                                                            </a>

                                                            <a href="${BASE_URL}admin/orders"
                                                               class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-cart me-3 ms-1"></i> Orders
                                                            </a>

                                                            <a href="${BASE_URL}admin/users"
                                                               class="nav-btn w-100 text-start" id="nav-contact-tab">
                                                                <i class="bi bi-people me-3 ms-1"></i> Manage Users
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-bar-chart me-3 ms-1"></i> Statictics
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-chat-left-text me-3 ms-1"></i> Reviews
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-wallet2 me-3 ms-1"></i> Transactions
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-box2-heart me-3 ms-1"></i> Offers
                                                            </a>

                                                            <hr>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-person-circle me-3 ms-1"></i> Account
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start">
                                                                <i class="bi bi-box-arrow-in-left me-3 ms-1"></i> Log
                                                                Out
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-brush me-3 ms-1"></i> Appearance
                                                            </a>

                                                            <a href="" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-gear me-3 ms-1"></i> Settings
                                                            </a>

                                                        </div>
                                                    </nav>

                                                </div>
                                            </div>

                                        </div>
                                            <%--small devices--%>

                                    </div>

                                    <div class="col-1">
                                        <button class="btn-my"><i class="bi bi-bell"></i></button>
                                    </div>

                                    <div class="col-1">
                                        <button class="btn-my"><i class="bi bi-gear"></i></button>
                                    </div>

                                </div>
                                    <%--Dashboard header--%>

                                    <%--Manage Products--%>
                                <div class="p-2 tab-pane fade show active" id="Products" role="tabpanel"
                                     aria-labelledby="nav-profile-tab">
                                    <span class="main-heading">Manage Products</span>

                                    <div class="row">
                                        <div class="col-12 mt-2">

                                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                                            data-bs-target="#home" type="button" role="tab"
                                                            aria-controls="home" aria-selected="true">Add Products
                                                    </button>
                                                </li>

                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                                            data-bs-target="#profile" type="button" role="tab"
                                                            aria-controls="profile" aria-selected="false">Update
                                                        Products
                                                    </button>
                                                </li>

                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="viewAll-tab" data-bs-toggle="tab"
                                                            data-bs-target="#viewAll" type="button" role="tab"
                                                            aria-controls="viewAll" aria-selected="false">View
                                                        All
                                                    </button>
                                                </li>

                                            </ul>

                                            <div class="tab-content" id="myTabContent">

                                                <div class="tab-pane fade show active" id="home" role="tabpanel"
                                                     aria-labelledby="home-tab">

                                                    <div class="row">

                                                        <div class="col-12 mt-2">
                                                            <div class="mb-3">
                                                                <label class="form-label sm-text fw-bold ms-2"> Product
                                                                    Title</label>
                                                                <input type="text" class="form-control" id="productTitle"
                                                                       placeholder="Ex: LED Recessed Spotlight 10W/12W/14W CCT Dimmable Spotlight Ceiling Spot 230V IP44 Round">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Category</label>
                                                                <select id="category" class="form-control">

                                                                    <c:forEach var="categoryList" items="${categorySet}">
                                                                        <option value="${categoryList.id}">${categoryList.name}</option>
                                                                    </c:forEach>

                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Brand</label>
                                                                <select id="brand" class="form-control">

                                                                    <c:forEach var="brandList" items="${brandSet}">
                                                                        <option value="${brandList.id}">${brandList.name}</option>
                                                                    </c:forEach>

                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Model</label>

                                                                <select id="model" class="form-control">

                                                                    <c:forEach var="modelList" items="${modelSet}">
                                                                        <option value="${modelList.id}">${modelList.name}</option>
                                                                    </c:forEach>

                                                                </select>

                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label class="form-label sm-text fw-bold ms-2">Qty</label>
                                                                <input type="text" class="form-control"
                                                                       id="qty"
                                                                       placeholder="Ex: (10)">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <label for="formGroupExampleInput"
                                                                   class="form-label sm-text fw-bold ms-2">Price</label>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text sm-text bg-light text-black-50 fw-bold">LKR.</span>
                                                                <input id="price" type="text" placeholder="100,000"
                                                                       class="form-control text-center">
                                                                <span class="input-group-text sm-text bg-light text-black-50 fw-bold">.00</span>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <label for="formGroupExampleInput"
                                                                           class="form-label sm-text fw-bold ms-2">Add
                                                                        Products Images</label>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="row">
                                                                        <div class="col-6 col-md-3">
                                                                            <img class="col-12 col-lg-6 ms-1 img-thumbnail"
                                                                                 id="prev"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-12 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12 col-lg-10">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader"/>
                                                                                                <label class="upload-btn ms-2 ms-lg-0 col-12 col-lg-8"
                                                                                                       for="imguploader"
                                                                                                       onclick="changeImage();">Upload</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-md-3">
                                                                            <img class="col-12 col-lg-6 ms-1 img-thumbnail"
                                                                                 id="prev2"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-10 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader2"/>
                                                                                                <label class="upload-btn ms-2 ms-lg-0 col-12 col-lg-8"
                                                                                                       for="imguploader2"
                                                                                                       onclick="changeImage2();">Upload</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-md-3">
                                                                            <img class="col-12 col-lg-6 ms-1 img-thumbnail"
                                                                                 id="prev3"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-12 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12 col-lg-10">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader3"/>
                                                                                                <label class="upload-btn col-12 ms-2 ms-lg-0 col-lg-8"
                                                                                                       for="imguploader3"
                                                                                                       onclick="changeImage3();">Upload</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-md-3">
                                                                            <img class="col-12 col-lg-6 ms-1 img-thumbnail"
                                                                                 id="prev4"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-12 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12 col-lg-10">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader4"/>
                                                                                                <label class="upload-btn col-12 ms-2 ms-lg-0 col-lg-8"
                                                                                                       for="imguploader4"
                                                                                                       onclick="changeImage4();">Upload</label>
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

                                                        <hr class="my-2"/>

                                                        <div class="col-12 col-lg-6">
                                                            <div class="mb-3">
                                                                <label class="form-label sm-text fw-bold ms-2">Delivery
                                                                    Fee</label>
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">LKR.</span>
                                                                    <input id="deliveryFee" type="text" placeholder="300"
                                                                           class="form-control text-center">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">.00</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <hr class="my-2"/>

                                                        <div class="col-12">
                                                                <%--<div id="summernote"></div>--%>
                                                            <div class="mb-3">
                                                                <label class="form-label sm-text fw-bold ms-2">Product
                                                                    Description</label>
                                                                <textarea id="description" class="form-control text-area-my"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 d-flex justify-content-end mt-3">
                                                            <button class="add-btn" onclick="registerProducts();">Add Product</button>
                                                        </div>


                                                    </div>

                                                </div>

                                                <div class="tab-pane fade" id="profile" role="tabpanel"
                                                     aria-labelledby="profile-tab">

                                                    <div class="row">

                                                        <div class="col-12 mt-4">
                                                            <div class="input-group mb-3 border-dark-outline">
                                                                <input type="text" class="form-control"
                                                                       placeholder="Search product to update.."
                                                                       aria-label="Example text with button addon"
                                                                       aria-describedby="button-addon1">
                                                                <button class="btn-my-2" type="button">Load Product
                                                                    Details
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Product
                                                                    Title</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: LED Recessed Spotlight 10W/12W/14W CCT Dimmable Spotlight Ceiling Spot 230V IP44 Round">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Category</label>
                                                                <select name="" id="" class="form-control">
                                                                    <option value="">Electronic devices</option>
                                                                    <option value="">Mobile Accessories</option>
                                                                    <option value="">Computer Accessories</option>
                                                                    <option value="">Camera Accessories</option>
                                                                    <option value="">Computer Components</option>
                                                                    <option value="">Network Components</option>
                                                                    <option value="">Cooling and Heating</option>
                                                                    <option value="">Washing Machines</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Brand</label>
                                                                <select name="" id="" class="form-control">
                                                                    <option value="">Apple</option>
                                                                    <option value="">Sony</option>
                                                                    <option value="">TLC</option>
                                                                    <option value="">Huawei</option>
                                                                    <option value="">Ushsha</option>
                                                                    <option value="">Samsung</option>
                                                                    <option value="">Softlogic</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <label for="formGroupExampleInput"
                                                                   class="form-label sm-text fw-bold ms-2">Condition</label>
                                                            <div class="row">

                                                                <div class="col-6">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" name="a"
                                                                               type="radio" value=""
                                                                               id="flexCheckDefault2">
                                                                        <label class="form-check-label"
                                                                               for="flexCheckDefault2">
                                                                            New
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-6">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" name="a"
                                                                               type="radio" value=""
                                                                               id="flexCheckDefault2">
                                                                        <label class="form-check-label"
                                                                               for="flexCheckDefault2">
                                                                            Used
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Color</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: Red, Green, Blue">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Qty</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: (10)">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <label for="formGroupExampleInput"
                                                                   class="form-label sm-text fw-bold ms-2">Price</label>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text sm-text bg-light text-black-50 fw-bold">LKR.</span>
                                                                <input type="text" placeholder="100,000"
                                                                       class="form-control text-center"
                                                                       aria-label="Amount (to the nearest dollar)">
                                                                <span class="input-group-text sm-text bg-light text-black-50 fw-bold">.00</span>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <label for="formGroupExampleInput"
                                                                           class="form-label sm-text fw-bold ms-2">Add
                                                                        Products Images</label>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="row">

                                                                        <div class="col-6 col-md-4">
                                                                            <img class="col-12 col-lg-6 ms-2 img-thumbnail"
                                                                                 id="prev"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-12 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12 col-lg-10">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader"/>
                                                                                                <label class="upload-btn col-12 ms-2 ms-lg-0 col-lg-8"
                                                                                                       for="imguploader"
                                                                                                       onclick="changeImage();">Re-Upload</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-md-4">
                                                                            <img class="col-12 col-lg-6 ms-2 img-thumbnail"
                                                                                 id="prev2"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-10 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader2"/>
                                                                                                <label class="upload-btn col-12 ms-2 ms-lg-0 col-lg-8"
                                                                                                       for="imguploader2"
                                                                                                       onclick="changeImage2();">Re-Upload</label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-6 col-md-4">
                                                                            <img class="col-12 col-lg-6 ms-2 img-thumbnail"
                                                                                 id="prev3"
                                                                                 src="${BASE_URL}assets/pictures/others/addproductimg.svg"/>
                                                                            <div class="col-12 mb-3">
                                                                                <div class="row">
                                                                                    <div class="col-12 col-lg-12 mt-2">
                                                                                        <div class="row">
                                                                                            <div class="col-12 col-lg-10">
                                                                                                <input class="d-none"
                                                                                                       type="file"
                                                                                                       accept="img/*"
                                                                                                       id="imguploader3"/>
                                                                                                <label class="upload-btn col-12 col-lg-8"
                                                                                                       for="imguploader3"
                                                                                                       onclick="changeImage3();">Re-Upload</label>
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

                                                        <hr class="my-2"/>

                                                        <div class="col-12 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Delivery
                                                                    Cost Within Colombo</label>
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">LKR.</span>
                                                                    <input type="text" placeholder="300"
                                                                           class="form-control text-center"
                                                                           aria-label="Amount (to the nearest dollar)">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">.00</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Delivery
                                                                    Cost Out of Colombo</label>
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">LKR.</span>
                                                                    <input type="text" placeholder="400"
                                                                           class="form-control text-center"
                                                                           aria-label="Amount (to the nearest dollar)">
                                                                    <span class="input-group-text sm-text bg-light text-black-50 fw-bold">.00</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <hr class="my-2"/>

                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Product
                                                                    Description</label>
                                                                <textarea class="form-control text-area-my"></textarea>
                                                            </div>
                                                        </div>

                                                        <div class="col-6">
                                                            <div class="form-check form-switch">
                                                                <input class="form-check-input" type="checkbox"
                                                                       role="switch" id="flexSwitchCheckChecked">
                                                                <label class="form-check-label"
                                                                       for="flexSwitchCheckChecked">Make as deactive
                                                                    product</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-6 d-flex justify-content-end mt-3">
                                                            <button class="add-btn">Update Product</button>
                                                        </div>


                                                    </div>

                                                </div>

                                                <div class="tab-pane fade" id="viewAll" role="tabpanel"
                                                     aria-labelledby="viewAll-tab">

                                                    <div class="row">

                                                        <div class="col-12 mt-4">
                                                            <div class="input-group mb-3 border-dark-outline">
                                                                <input type="text" class="form-control"
                                                                       placeholder="Search product to update.."
                                                                       aria-label="Example text with button addon"
                                                                       aria-describedby="button-addon1">
                                                                <button class="btn-my-2" type="button">Search Product
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 mt-3">

                                                            <div class="row">

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
                                                                                    <button onclick="removeProduct(${productList.id})" class="remove-btn mt-lg-4" type="button">Remove</button>
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

                                        </div>
                                    </div>

                                </div>
                                    <%--Manage Products--%>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>

        <script src="${BASE_URL}assets/js/spartan-multi-image-picker.js"></script>
        <script>
            $('#summernote').summernote({
                placeholder: 'Enter your description',
                tabsize: 2,
                height: 120,
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture', 'video']],
                    ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });

            $("#image_picker").spartanMultiImagePicker({
                fieldName:  'file[]',
                maxCount: 4
            });

        </script>

    </layout:put>

</layout:extends>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <%--summer note--%>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>

        <%--        <link rel="stylesheet" href="${BASE_URL}assets/css/summernote.min.css">--%>
        <%--        <script src="${BASE_URL}assets/js/summernote.min.js"></script>--%>

        <%--        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">--%>
        <%--        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>--%>

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

                                    <a href="" class="nav-btn active w-100 text-start"><i
                                            class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                    </a>

                                    <a href="${BASE_URL}admin/product" class="nav-btn w-100 text-start" id="nav-profile-tab"><i
                                            class="bi bi-box-seam me-3 ms-1"></i> Manage Products
                                    </a>

                                    <a href="${BASE_URL}admin/orders" class="nav-btn w-100 text-start"><i
                                            class="bi bi-cart me-3 ms-1"></i> Orders
                                    </a>

                                    <a href="${BASE_URL}admin/users" class="nav-btn w-100 text-start" id="nav-contact-tab">
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

                                                            <a href="${BASE_URL}admin-panel" class="nav-btn active w-100 text-start"><i
                                                                    class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                                            </a>

                                                            <a href="${BASE_URL}admin/product" class="nav-btn w-100 text-start" id="nav-profile-tab"><i
                                                                    class="bi bi-box-seam me-3 ms-1"></i> Manage Products
                                                            </a>

                                                            <a href="${BASE_URL}admin/orders" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-cart me-3 ms-1"></i> Orders
                                                            </a>

                                                            <a href="${BASE_URL}admin/users" class="nav-btn w-100 text-start" id="nav-contact-tab">
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

                                <%--Dashboard--%>
                                <div class="p-2 tab-pane fade show active" id="Dashboard" role="tabpanel"
                                     aria-labelledby="nav-home-tab">

                                    <span class="main-heading">Dashboard</span>

                                    <div class="row">

                                        <div class="col-6 col-lg-4 p-2">
                                            <div class="bg-white p-2 box-01">
                                                <span class="main-heading text-black-50">Daily Earnings</span>
                                                <span class="mt-3 d-block">LKR.100,000.00</span>
                                            </div>
                                        </div>

                                        <div class="col-6 col-lg-4 p-2">
                                            <div class="bg-white p-2 box-01">
                                                <span class="main-heading text-black-50">Total Orders</span>
                                                <span class="mt-3 d-block">78465</span>
                                            </div>
                                        </div>

                                        <div class="col-6 col-lg-4 p-2">
                                            <div class="bg-white p-2 box-01">
                                                <span class="main-heading text-black-50">Total Sales</span>
                                                <span class="mt-3 d-block">LKR.1,550,700.00</span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-12 col-lg-8 mt-2">
                                            <span class="fw-bold">Latest Orders</span>

                                            <div class="row p-1">

                                                <div class="col-6 col-lg-12">
                                                    <div class="row p-1">

                                                        <div class="col-12">
                                                            <div class="row px-3 bg-white mt-2">

                                                                <div class="col-12 col-lg-1">
                                                                    <img src="${BASE_URL}assets/pictures/products/ele 01.webp"
                                                                         class="p-h-product-circle" alt="">
                                                                </div>

                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                    <span class="text-truncate sm-text">LED Recessed Spotlight 10W/12W/14W CCT Dimmable Spotlight Ceiling Spot 230V IP44 Round</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="text-black-50 fw-bold sm-text"><i
                                                                            class="bi bi-clock-history"></i> This Month</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="price-text fw-bold sm-text">LKR. 11,250.00</span>
                                                                </div>

                                                                <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                                                                    <button class="view-btn sm-text">View</button>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-6 col-lg-12">
                                                    <div class="row p-1">

                                                        <div class="col-12">
                                                            <div class="row px-3 bg-white mt-2">

                                                                <div class="col-12 col-lg-1">
                                                                    <img src="${BASE_URL}assets/pictures/products/hdmi port.jpg"
                                                                         class="p-h-product-circle" alt="">
                                                                </div>

                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                    <span class="text-truncate sm-text">HDMI Male To VGA Male Video Converter Adapter Cable For PC DVD 1080P HDTV 6FT</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="text-black-50 fw-bold sm-text"><i
                                                                            class="bi bi-clock-history"></i> This Month</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="price-text fw-bold sm-text">LKR. 3,150.00</span>
                                                                </div>

                                                                <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                                                                    <button class="view-btn sm-text">View</button>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-6 col-lg-12">
                                                    <div class="row p-1">

                                                        <div class="col-12">
                                                            <div class="row px-3 bg-white mt-2">

                                                                <div class="col-12 col-lg-1">
                                                                    <img src="${BASE_URL}assets/pictures/products/sony playstation.webp"
                                                                         class="p-h-product-circle" alt="">
                                                                </div>

                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                    <span class="text-truncate sm-text">Sony Playstation 5 Disc Version Video Game Console</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="text-black-50 fw-bold sm-text"><i
                                                                            class="bi bi-clock-history"></i> This Month</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="price-text fw-bold sm-text">LKR. 224,143.00</span>
                                                                </div>

                                                                <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                                                                    <button class="view-btn sm-text">View</button>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-6 col-lg-12">
                                                    <div class="row p-1">

                                                        <div class="col-12">
                                                            <div class="row px-3 bg-white mt-2">

                                                                <div class="col-12 col-lg-1">
                                                                    <img src="${BASE_URL}assets/pictures/products/fast 60w charger.webp"
                                                                         class="p-h-product-circle" alt="">
                                                                </div>

                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                    <span class="text-truncate sm-text">Fast 60W PD USB Type C to USB Type-C Charge 90 Degree Right Angle Cable UK</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="text-black-50 fw-bold sm-text"><i
                                                                            class="bi bi-clock-history"></i> This Month</span>
                                                                </div>

                                                                <div class="col-12 col-lg-3 d-flex align-items-center">
                                                                    <span class="price-text fw-bold sm-text">LKR. 2,392.00</span>
                                                                </div>

                                                                <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                                                                    <button class="view-btn sm-text">View</button>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="col-12 col-lg-4 mt-2">
                                            <span class="fw-bold">Visitors</span>

                                            <div class="row p-2">
                                                <div class="col-12 p-2 bg-white text-center">

                                                    <span class="fw-bold d-block mt-2">Recent Month</span>

                                                    <div class="outline-area mt-3">
                                                        <div class="fill-area d-flex align-items-center justify-content-center shadow">
                                                            <div class="content-area">

                                                                <span class="d-block fw-bold"> 90.45%</span>
                                                                <span class="d-block fw-bold text-black-50"> Website growth</span>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                                <%--Dashboard--%>

                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>

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
        </script>

    </layout:put>

</layout:extends>
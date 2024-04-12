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

                                    <a href="${BASE_URL}admin-panel" class="nav-btn  w-100 text-start">
                                        <i class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                    </a>

                                    <a href="${BASE_URL}admin/product" class="nav-btn w-100 text-start">
                                        <i class="bi bi-box-seam me-3 ms-1"></i> Manage Products
                                    </a>

                                    <a href="${BASE_URL}admin/orders" class="nav-btn w-100 text-start"><i
                                            class="bi bi-cart me-3 ms-1"></i> Orders
                                    </a>

                                    <a href="${BASE_URL}admin/users" class="nav-btn w-100 text-start active" id="nav-contact-tab">
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

                                                            <a href="${BASE_URL}admin-panel" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-grid-1x2-fill me-3 ms-1"></i> Dashboard
                                                            </a>

                                                            <a href="${BASE_URL}admin/product" class="nav-btn w-100 text-start" id="nav-profile-tab"><i
                                                                    class="bi bi-box-seam me-3 ms-1"></i> Manage Products
                                                            </a>

                                                            <a href="${BASE_URL}admin/orders" class="nav-btn w-100 text-start"><i
                                                                    class="bi bi-cart me-3 ms-1"></i> Orders
                                                            </a>

                                                            <a href="${BASE_URL}admin/users" class="nav-btn w-100 text-start active" id="nav-contact-tab">
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

                                    <%--Manage Users--%>
                                <div class="p-2 tab-pane fade show active" id="Users" role="tabpanel"
                                     aria-labelledby="nav-contact-tab">
                                    <span class="main-heading">Manage Users</span>
                                    <div class="row">
                                        <div class="col-12 mt-2">

                                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                                            data-bs-target="#addUsers" type="button" role="tab"
                                                            aria-controls="home" aria-selected="true">Add Users
                                                    </button>
                                                </li>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                                            data-bs-target="#updateUsers" type="button" role="tab"
                                                            aria-controls="profile" aria-selected="false">Update Users
                                                    </button>
                                                </li>

                                            </ul>

                                            <div class="tab-content" id="myTabContent">

                                                <div class="tab-pane fade show active" id="addUsers" role="tabpanel"
                                                     aria-labelledby="home-tab">

                                                    <div class="row">

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">First
                                                                    Name</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: John">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Last
                                                                    Name</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: Ferdinandiz">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">User
                                                                    Role</label>
                                                                <select name="" id="" class="form-control">
                                                                    <option value="">Cashier</option>
                                                                    <option value="">Employee</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Email
                                                                    Address</label>
                                                                <input type="email" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: hello@example.com">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Username</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: John@2001">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Password</label>
                                                                <input type="password" class="form-control"
                                                                       id="formGroupExampleInput">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Confirm
                                                                    Password</label>
                                                                <input type="password" class="form-control"
                                                                       id="formGroupExampleInput">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-6 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Address
                                                                    Line 01</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: 8th Lane, Temple Road">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-6 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Address
                                                                    Line 02</label>
                                                                <input type="text" class="form-control"
                                                                       id="formGroupExampleInput"
                                                                       placeholder="Ex: Lakeside Area">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">City</label>
                                                                <select name="" id="" class="form-control">
                                                                    <option value="">Kurunegala</option>
                                                                    <option value="">Colombo</option>
                                                                    <option value="">Gampaha</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4 mt-2">
                                                            <div class="mb-3">
                                                                <label for="formGroupExampleInput"
                                                                       class="form-label sm-text fw-bold ms-2">Mobile
                                                                    Number</label>
                                                                <input type="password" class="form-control"
                                                                       id="formGroupExampleInput">
                                                            </div>
                                                        </div>

                                                        <div class="col-12 col-lg-4">
                                                            <label for="formGroupExampleInput"
                                                                   class="form-label sm-text fw-bold ms-2">Gender</label>
                                                            <div class="row mt-3">

                                                                <div class="col-6">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input" name="a"
                                                                               type="radio" value=""
                                                                               id="flexCheckDefault2">
                                                                        <label class="form-check-label"
                                                                               for="flexCheckDefault2">
                                                                            Male
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
                                                                            Female
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-12 d-flex justify-content-end">
                                                            <button class="add-btn">Add User</button>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="tab-pane fade" id="updateUsers" role="tabpanel"
                                                     aria-labelledby="profile-tab">

                                                    <div class="row">

                                                        <div class="col-12 mt-2">

                                                            <div class="row p-1">
                                                                <div class="col-6 col-lg-12">
                                                                    <div class="row p-1">

                                                                        <div class="col-12">
                                                                            <div class="row px-3 bg-white mt-2">

                                                                                <div class="col-12 col-lg-1 p-2">
                                                                                    <span><i
                                                                                            class="bi bi-person-circle fs-4 text-black-50"></i></span>
                                                                                </div>

                                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                                    <span class="text-truncate sm-text">Amara Kamal Perera</span>
                                                                                </div>

                                                                                <div class="col-12 col-lg-5 d-flex align-items-center">
                                                                                    <span class="text-black-50 fw-bold sm-text">Cashier</span>
                                                                                </div>

                                                                                <div class="col-6 col-lg-1 d-flex align-items-center d-grid">
                                                                                    <button class="view-btn sm-text"
                                                                                            type="button"
                                                                                            data-bs-toggle="collapse"
                                                                                            data-bs-target="#collapseExample"
                                                                                            aria-expanded="false"
                                                                                            aria-controls="collapseExample">
                                                                                        Update
                                                                                    </button>
                                                                                </div>

                                                                                <div class="col-6 col-lg-1 d-flex align-items-center">
                                                                                    <button class="delete-btn sm-text">
                                                                                        delete
                                                                                    </button>
                                                                                </div>

                                                                                <div class="collapse"
                                                                                     id="collapseExample">
                                                                                    <div class="card card-body bg-light">

                                                                                        <div class="row">

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">First
                                                                                                        Name</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: John">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Last
                                                                                                        Name</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: Ferdinandiz">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">User
                                                                                                        Role</label>
                                                                                                    <select name=""
                                                                                                            id=""
                                                                                                            class="form-control">
                                                                                                        <option value="">
                                                                                                            Cashier
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Employee
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Email
                                                                                                        Address</label>
                                                                                                    <input type="email"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: hello@example.com">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Username</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: John@2001">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Password</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Confirm
                                                                                                        Password</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-6 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Address
                                                                                                        Line 01</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: 8th Lane, Temple Road">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-6 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Address
                                                                                                        Line 02</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: Lakeside Area">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">City</label>
                                                                                                    <select name=""
                                                                                                            id=""
                                                                                                            class="form-control">
                                                                                                        <option value="">
                                                                                                            Kurunegala
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Colombo
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Gampaha
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Mobile
                                                                                                        Number</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4">
                                                                                                <label for="formGroupExampleInput"
                                                                                                       class="form-label sm-text fw-bold ms-2">Gender</label>
                                                                                                <div class="row mt-3">

                                                                                                    <div class="col-6">
                                                                                                        <div class="form-check">
                                                                                                            <input class="form-check-input"
                                                                                                                   name="a"
                                                                                                                   type="radio"
                                                                                                                   value=""
                                                                                                                   id="flexCheckDefault2">
                                                                                                            <label class="form-check-label"
                                                                                                                   for="flexCheckDefault2">
                                                                                                                Male
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div class="col-6">
                                                                                                        <div class="form-check">
                                                                                                            <input class="form-check-input"
                                                                                                                   name="a"
                                                                                                                   type="radio"
                                                                                                                   value=""
                                                                                                                   id="flexCheckDefault2">
                                                                                                            <label class="form-check-label"
                                                                                                                   for="flexCheckDefault2">
                                                                                                                Female
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-6">
                                                                                                <div class="form-check form-switch">
                                                                                                    <input class="form-check-input"
                                                                                                           type="checkbox"
                                                                                                           role="switch"
                                                                                                           id="flexSwitchCheckChecked"
                                                                                                           checked>
                                                                                                    <label class="form-check-label"
                                                                                                           for="flexSwitchCheckChecked">Make
                                                                                                        as deactive
                                                                                                        user</label>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-6 d-flex justify-content-end">
                                                                                                <button class="add-btn">
                                                                                                    Update User
                                                                                                </button>
                                                                                            </div>

                                                                                        </div>

                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                        <div class="col-12">
                                                                            <div class="row px-3 bg-white mt-2">

                                                                                <div class="col-12 col-lg-1 p-2">
                                                                                    <span><i
                                                                                            class="bi bi-person-circle fs-4 text-black-50"></i></span>
                                                                                </div>

                                                                                <div class="col-12 col-lg-4 d-flex align-items-center">
                                                                                    <span class="text-truncate sm-text">Kasun Kalhara</span>
                                                                                </div>

                                                                                <div class="col-12 col-lg-5 d-flex align-items-center">
                                                                                    <span class="text-black-50 fw-bold sm-text">Cashier</span>
                                                                                </div>

                                                                                <div class="col-6 col-lg-1 d-flex align-items-center d-grid">
                                                                                    <button class="view-btn sm-text"
                                                                                            type="button"
                                                                                            data-bs-toggle="collapse"
                                                                                            data-bs-target="#collapseExample2"
                                                                                            aria-expanded="false"
                                                                                            aria-controls="collapseExample">
                                                                                        Update
                                                                                    </button>
                                                                                </div>

                                                                                <div class="col-6 col-lg-1 d-flex align-items-center">
                                                                                    <button class="delete-btn sm-text">
                                                                                        delete
                                                                                    </button>
                                                                                </div>

                                                                                <div class="collapse"
                                                                                     id="collapseExample2">
                                                                                    <div class="card card-body bg-light">

                                                                                        <div class="row">

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">First
                                                                                                        Name</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: John">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Last
                                                                                                        Name</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: Ferdinandiz">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">User
                                                                                                        Role</label>
                                                                                                    <select name=""
                                                                                                            id=""
                                                                                                            class="form-control">
                                                                                                        <option value="">
                                                                                                            Cashier
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Employee
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Email
                                                                                                        Address</label>
                                                                                                    <input type="email"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: hello@example.com">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Username</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: John@2001">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Password</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Confirm
                                                                                                        Password</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-6 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Address
                                                                                                        Line 01</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: 8th Lane, Temple Road">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-6 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Address
                                                                                                        Line 02</label>
                                                                                                    <input type="text"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput"
                                                                                                           placeholder="Ex: Lakeside Area">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">City</label>
                                                                                                    <select name=""
                                                                                                            id=""
                                                                                                            class="form-control">
                                                                                                        <option value="">
                                                                                                            Kurunegala
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Colombo
                                                                                                        </option>
                                                                                                        <option value="">
                                                                                                            Gampaha
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4 mt-2">
                                                                                                <div class="mb-3">
                                                                                                    <label for="formGroupExampleInput"
                                                                                                           class="form-label sm-text fw-bold ms-2">Mobile
                                                                                                        Number</label>
                                                                                                    <input type="password"
                                                                                                           class="form-control"
                                                                                                           id="formGroupExampleInput">
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-12 col-lg-4">
                                                                                                <label for="formGroupExampleInput"
                                                                                                       class="form-label sm-text fw-bold ms-2">Gender</label>
                                                                                                <div class="row mt-3">

                                                                                                    <div class="col-6">
                                                                                                        <div class="form-check">
                                                                                                            <input class="form-check-input"
                                                                                                                   name="a"
                                                                                                                   type="radio"
                                                                                                                   value=""
                                                                                                                   id="flexCheckDefault2">
                                                                                                            <label class="form-check-label"
                                                                                                                   for="flexCheckDefault2">
                                                                                                                Male
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                    <div class="col-6">
                                                                                                        <div class="form-check">
                                                                                                            <input class="form-check-input"
                                                                                                                   name="a"
                                                                                                                   type="radio"
                                                                                                                   value=""
                                                                                                                   id="flexCheckDefault2">
                                                                                                            <label class="form-check-label"
                                                                                                                   for="flexCheckDefault2">
                                                                                                                Female
                                                                                                            </label>
                                                                                                        </div>
                                                                                                    </div>

                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-6">
                                                                                                <div class="form-check form-switch">
                                                                                                    <input class="form-check-input"
                                                                                                           type="checkbox"
                                                                                                           role="switch"
                                                                                                           id="flexSwitchCheckChecked"
                                                                                                           checked>
                                                                                                    <label class="form-check-label"
                                                                                                           for="flexSwitchCheckChecked">Make
                                                                                                        as deactive
                                                                                                        user</label>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="col-6 d-flex justify-content-end">
                                                                                                <button class="add-btn">
                                                                                                    Update User
                                                                                                </button>
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

                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                    <%--Manage Users--%>

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
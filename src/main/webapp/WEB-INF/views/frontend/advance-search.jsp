<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">

        <body>

        <div class="container-fluid">
            <div class="row">

                <div class="col-12 py-3 ps-4 mt-4 mt-lg-2">

                    <a href="index.php" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a class="pagination-links">Products</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="purchased-history.php" class="pagination-links active-page">Advanced Search</a>

                </div>

                <div class="col-12 col-lg-10 offset-lg-1">
                    <div class="row">

                        <div class="col-12 my-3 mt-4">
                            <span class="main-heading">Advanced Search</span>
                        </div>

                        <div class="col-12">
                            <div class="input-group mb-3 border-dark-outline">
                                <input type="text" class="form-control" placeholder="Search keyword or name"
                                       aria-label="Example text with button addon" aria-describedby="button-addon1">
                                <button class="btn-my-2" type="button" id="button-addon1"><i class="bi bi-search"></i>
                                </button>
                            </div>
                        </div>

                        <div class="col-12 col-lg-4">
                            <div class="mb-3">
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Kyeword
                                    Options</label>
                                <select name="" id="" class="form-control">
                                    <option value="">All words, any orders</option>
                                    <option value="">Any words, any orders</option>
                                    <option value="">Exact words, Exact orders</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-lg-4">
                            <div class="mb-3">
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">In this
                                    category</label>
                                <select name="" id="" class="form-control">
                                    <option value="">All categories</option>
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
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">In this
                                    brand</label>
                                <select name="" id="" class="form-control">
                                    <option value="">All brands</option>
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

                        <div class="col-12 d-flex justify-content-end">
                            <button class="serach-btn shadow">Search</button>
                        </div>

                        <hr class="my-3"/>

                        <div class="col-12">
                            <label class="form-label sm-text fw-bold ms-2">Search including</label>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Title and description
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Completed listings
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Sold listings
                                </label>
                            </div>
                        </div>

                        <hr class="my-3"/>

                        <div class="col-12">
                            <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Price</label>
                            <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2 text-black-50">Show
                                items priced from LKR.</label>
                            <div class="row">

                                <div class="col-12 col-lg-5">
                                    <input type="text" class="form-control" name="" id="" placeholder="LKR 100.00">
                                </div>

                                <div class="col-12 col-lg-2 text-center">
                                    <span class="sm-text">to</span>
                                </div>

                                <div class="col-12 col-lg-5">
                                    <input type="text" class="form-control" name="" id="" placeholder="LKR 100,000.00">
                                </div>

                            </div>
                        </div>

                        <hr class="my-3"/>

                        <div class="col-12">
                            <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Condition</label>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    New
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Used
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Not Specified
                                </label>
                            </div>

                        </div>

                        <hr class="my-3"/>

                        <div class="col-12">
                            <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Shipping
                                options</label>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Free international shipping
                                </label>
                            </div>

                        </div>

                        <hr class="my-3"/>

                        <div class="col-12">
                            <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Sellers</label>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    Only show items from
                                </label>
                            </div>

                            <div class="row d-flex justify-content-end">
                                <div class="col-12 col-lg-11 mt-2">
                                    <div class="mb-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                Specific sellers (enter seller's user IDs)
                                            </label>
                                        </div>
                                        <input type="text" class="form-control my-1" id="formGroupExampleInput"
                                               placeholder="Enter seller's user ID">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <hr class="my-3"/>

                        <div class="col-12 col-lg-4">
                            <div class="mb-3">
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Sort
                                    by</label>
                                <select name="" id="" class="form-control">
                                    <option value="">Best match</option>
                                    <option value="">Price : Low to High</option>
                                    <option value="">Price : High to Low</option>
                                    <option value="">Date : Old to Newest</option>
                                    <option value="">Date : Newest to Old</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-lg-4">
                            <div class="mb-3">
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">View
                                    results</label>
                                <select name="" id="" class="form-control">
                                    <option value="">All items</option>
                                    <option value="">Numbers</option>
                                    <option value="">List</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-12 col-lg-4">
                            <div class="mb-3">
                                <label for="formGroupExampleInput" class="form-label sm-text fw-bold ms-2">Result per
                                    page</label>
                                <select name="" id="" class="form-control">
                                    <option value="">60</option>
                                    <option value="">120</option>
                                    <option value="">240</option>
                                </select>
                            </div>
                        </div>

                        <hr class="my-3"/>

                        <div class="col-12 d-flex justify-content-end">
                            <button class="serach-btn shadow">Search</button>
                        </div>

                        <div class="col-12 d-flex justify-content-end mb-3">
                            <button class="btn-my text-black-50 text-decoration-underline sm-text fw-bold">Clear
                                Options
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </layout:put>

</layout:extends>
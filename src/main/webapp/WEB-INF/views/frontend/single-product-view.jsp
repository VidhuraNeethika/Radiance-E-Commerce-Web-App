<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="com.apx.radiance.util.HibernateUtil" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.apx.radiance.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.apx.radiance.entity.Product_Image" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

    String pid = request.getParameter("pid");

    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    Session openSession = sessionFactory.openSession();

    Query<Product> productQuery = openSession.createQuery("select product from Product product where product.id=:productId", Product.class);
    Product productData = productQuery.setParameter("productId", pid).getSingleResult();
    pageContext.setAttribute("products", productData);

    Set<Product_Image> productImages = productData.getProduct_images();
    Iterator<Product_Image> productIterator = productImages.iterator();
    while (productIterator.hasNext()) {
        Product_Image productImage = productIterator.next();

        pageContext.setAttribute("productImages", productImage);
    }

    Query<Product> relatedProductQuery = openSession.createQuery("select p from Product p where p.category.id=:categoryId order by p.createdAt desc limit 4", Product.class);
    List<Product> rProductList = relatedProductQuery.setParameter("categoryId", productData.getCategory().getId()).getResultList();
    pageContext.setAttribute("relatedProductSet", rProductList);

%>

<layout:extends name="base">

    <layout:put block="contents" type="REPLACE">


        <body>

        <div class="container-fluid">

            <div class="row">

                <div class="col-12 py-3 ps-4 main-background mt-4">

                    <a href="index.php" class="pagination-links">Home</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a class="pagination-links">${products.category.name}</a>

                    <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

                    <a href="" class="pagination-links active-page">${products.title}</a>

                </div>

                <div class="col-12">
                    <div class="row mt-3 bg-white py-2">

                        <div class="col-lg-5">

                            <img class="mainThumbImage mt-2" src="${BASE_URL}${productImages.path_01}" id="mainimg"/>

                            <div class="row mb-2 mt-4">
                                <div class="col-12 d-none d-lg-block">
                                    <img src="${BASE_URL}${productImages.path_01}" id="pimg1"
                                         onclick="loadmainimg(1);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_02}" id="pimg2"
                                         onclick="loadmainimg(2);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_03}" id="pimg3"
                                         onclick="loadmainimg(3);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_04}" id="pimg4"
                                         onclick="loadmainimg(4);" class="border border-1 thumb-imgs"/>
                                </div>
                                <div class="col-12 d-lg-none">
                                    <img src="${BASE_URL}${productImages.path_01}" id="pimg1"
                                         onclick="loadmainimg(1);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_02}" id="pimg2"
                                         onclick="loadmainimg(2);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_03}" id="pimg3"
                                         onclick="loadmainimg(3);" class="border border-1 thumb-imgs"/>
                                    <img src="${BASE_URL}${productImages.path_04}" id="pimg4"
                                         onclick="loadmainimg(4);" class="border border-1 thumb-imgs"/>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-4 bg-white">
                            <h2 class="mt-3 mt-lg-0">${products.title}</h2>
                            <dl>
                                    ${products.description}
                            </dl>
                            <hr>
                            <h6 class="text-black-50">Shipping : LKR.${products.delivery_fee.intValue()}.00</h6>
                            <table>
                                <tr>
                                    <td style="width: 60%;">
                                        <dl>
                                            <dd class="fw-bold">Brand : ${products.modelHasBrand.brand.name}</dd>
                                            <dd class="fw-bold">Model : ${products.modelHasBrand.model.name}</dd>
                                        </dl>
                                    </td>
                                </tr>
                            </table>

                            <div class="row mt-4 p-1 bg-light">
                                <div class="col-12 p-1">
                                    <h4>Seller information</h4>
                                    <span class="d-block text-primary">100% positive feedbacks</span>
                                    <span class="d-block sm-text">see feedbacks</span>
                                </div>
                            </div>

                            <dl class="mt-5">
                                <dt><i>Payment methord</i></dt>
                                <dd class="ms-4">- Cash on delivery</dd>
                                <dd class="ms-4"><i class="bi bi-credit-card-2-front-fill fs-4"></i> <i
                                        class="bi bi-paypal ms-2"></i></dd>
                            </dl>

                        </div>
                        <div class="col-lg-3">
                            <div class="row d-none d-lg-block price-summery-area-spv">
                                <div class="col-12">
                                    <span class="fw-bold d-block fs-4">LKR.${products.price.intValue()}.00</span>
                                    <span class="text-black-50 d-block"
                                          style="text-decoration-line: line-through;">LKR.${products.price.intValue()+1000}.00</span>

                                    <!-- Change the `data-field` of buttons and `name` of input field's for multiple plus minus buttons-->

                                    <div class="quantity buttons_added">
                                        <table class="mt-3">
                                            <tr>
                                                <td>
                                                    <h5 class="text-dark">Qty :</h5>
                                                </td>
                                                <td>
                                                    <input type="button" value="-" class="ms-2 minus">
                                                    <input type="number" step="1" min="1" max="" name="quantity"
                                                           value="1" title="Qty" class="input-text qty text" size="4"
                                                           pattern="" inputmode="">
                                                    <input type="button" value="+" class="plus">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="row">

                                        <div class="d-flex flex-column mt-4">

                                            <button onclick="addToCart(${products.id});" class="details-btn p-2"
                                                    type="button">Add to Cart
                                            </button>

                                            <button onclick="addToWishlist(${products.id});"
                                                    class="add-to-wishlist-btn mt-2 p-2" type="button">Add to Wishlist
                                            </button>

                                            <button class="details-btn p-2 mt-2 bg-drk"
                                                    type="button">Buy Now
                                            </button>

                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="row mt-4 p-1 bg-light">
                                <div class="col-12 p-1">
                                    <span class="d-block fw-bold"><i
                                            class="bi bi-bag-check"></i> Shop with confidence</span>
                                    <span class="sm-text"><i class="bi bi-star-fill"></i> top rated plus</span>
                                    <hr>
                                    <span class="d-block mt-1 text-black-50"><i class="bi bi-tag"></i> trusted seller, fast shipping and easy returns</span>
                                    <span class="d-block mt-1 text-black-50"><i class="bi bi-tag"></i> radiance  money payback guarantee</span>
                                    <span class="d-block mt-1 text-black-50"><i class="bi bi-tag"></i> get the item you ordered or get your money back</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- ONLY SMALL DEVICE -->

                <div class="col-12 mt-5 fixed-bottom d-lg-none bg-white">

                    <div class="row shadow p-1 sm-dvc-spv-summery-area">

                        <div class="col-8 mt-1">
                            <span class="fw-bold d-block fs-4">LKR.${products.price.intValue()}.00</span>
                            <span class="text-black-50 d-block"
                                  style="text-decoration-line: line-through;">LKR.${products.price.intValue()+1000}.00</span>

                            <div class="quantity buttons_added">

                                <div class="row">
                                    <div class="col-12">
                                        <h5 class="text-dark">Qty :</h5>
                                    </div>
                                    <div class="col-12">
                                        <input type="button" value="-" class="ms-2 minus">
                                        <input type="number" step="1" min="1" max="" name="quantity" value="1"
                                               title="Qty" class="input-text qty text bg-white" size="4" pattern=""
                                               inputmode="">
                                        <input type="button" value="+" class="plus">
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="col-4 d-grid p-1 price-summery-area-spv">
                            <button class="spv-add-cart py-2">Add to Cart</button>
                            <button class="spv-wishlist py-2 mt-1">Add to Wishlist</button>
                            <button class="buy-now-btn py-2 mt-1">Buy Now</button>
                        </div>

                    </div>

                </div>

                <!-- ONLY SMALL DEVICE -->

                <div class="col-12 col-lg-10 offset-lg-1">
                    <div class="row">
                        <div class="col-2 col-lg-4 mt-4 d-flex justify-content-end pe-4">
                        </div>

                        <div class="col-8 col-lg-4 text-center mt-5">
                            <span class="main-heading">Related<span class="main-heading clr"> Items</span></span>
                            <div class="underline-mn"></div>
                        </div>

                        <div class="col-2 col-lg-4 mt-5 d-flex justify-content-end pe-4">
                            <button class="more-btn">More <i class="bi bi-chevron-right ms-2 rght-arw"></i></button>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-10 offset-lg-1 mt-3">
                    <div class="row">

                        <c:forEach var="productList" items="${relatedProductSet}">

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
                                            <span class="sold-lst">${productList.qty+10} sold <span
                                                    class="dscnt-p">-${productList.qty+4}%</span></span>
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
                                        <a onclick="addToWishlist(${productList.id});" href="" style="--i:2;"
                                           class="bi bi-heart"></a>
                                        <a href="${BASE_URL}single-product-view?pid=${productList.id}" style="--i:3;"
                                           class="bi bi-eye"></a>
                                    </div>
                                </div>

                            </div>

                        </c:forEach>

                    </div>
                </div>

                <div class="col-12 main-background mt-3 mb-3">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1 pt-3 bg-white rounded-3">

                            <nav>
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                                            aria-selected="true">Description
                                    </button>
                                    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-profile" type="button" role="tab"
                                            aria-controls="nav-profile" aria-selected="false">More
                                    </button>
                                </div>
                            </nav>
                            <div class="tab-content" id="nav-tabContent">

                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                     aria-labelledby="nav-home-tab">

                                    <div class="row p-2">
                                        <div class="col-12 mt-2 text-black-50">

                                            <h4 class="fw-bold">Color</h4>
                                            <ul>
                                                <l1>Slate Grey</l1>
                                            </ul>

                                            <h4 class="fw-bold">Operating System</h4>
                                            <ul>
                                                <l1>Windows 10 Home</l1>
                                            </ul>

                                            <h4 class="fw-bold">Processor</h4>
                                            <ul>
                                                <l1>AMD Ryzen 3 3250U Mobile Processor (2C/4T, 5MB Cache, 3.5 GHz Max
                                                    Boost)
                                                </l1>
                                            </ul>

                                            <h4 class="fw-bold">Graphics</h4>
                                            <ul>
                                                <l1>AMD Radeon Graphics</l1>
                                            </ul>

                                            <h4 class="fw-bold">Display</h4>
                                            <ul>
                                                <l1>15.6-inch, FHD (1920 x 1080)</l1>
                                            </ul>

                                            <h4 class="fw-bold">Memory</h4>
                                            <ul>
                                                <l1>4GB DDR4 on board</l1>
                                            </ul>

                                            <h4 class="fw-bold">Storage</h4>
                                            <ul>
                                                <l1>1TB SATA 5400RPM 2.5" HDD</l1>
                                            </ul>

                                            <h4 class="fw-bold">I/O Ports</h4>
                                            <ul>
                                                <l1>1x USB 3.2 Gen 1 Type-A</l1>
                                                <l1>1x USB 3.2 Gen 1 Type-C</l1>
                                                <l1>2x USB 2.0 Type-A</l1>
                                                <l1>1x HDMI 1.4</l1>
                                                <l1>1x 3.5mm Combo Audio Jack</l1>
                                                <l1>Micro SD card reader (on selected model)</l1>
                                            </ul>

                                            <h4 class="fw-bold">Expansion Slots (includes used)</h4>
                                            <ul>
                                                <l1>1x DDR4 SO-DIMM slot</l1>
                                                <l1>1x M.2 2280 PCIe 3.0x2</l1>
                                                <l1>1x STD 2.5 SATA HDD</l1>
                                            </ul>

                                            <h4 class="fw-bold">Keyboard & Touchpad</h4>
                                            <ul>
                                                <l1>Chiclet Keyboard with Num-key</l1>
                                                <l1>Backlit Chiclet Keyboard</l1>
                                                <l1>1.4mm Key-travel</l1>
                                            </ul>

                                            <h4 class="fw-bold">Camera</h4>
                                            <ul>
                                                <l1>VGA camera</l1>
                                            </ul>

                                            <h4 class="fw-bold">Audio</h4>
                                            <ul>
                                                <l1>SonicMaster</l1>
                                                <l1>Built-in microphone</l1>
                                                <l1>with Cortana support</l1>
                                            </ul>

                                            <h4 class="fw-bold">Network and Communication</h4>
                                            <ul>
                                                <l1>Wi-Fi 5(802.11ac)+Bluetooth 4.1 (Dual band) 1*1</l1>
                                            </ul>

                                            <h4 class="fw-bold">Battery</h4>
                                            <ul>
                                                <l1>37WHrs, 2S1P, 2-cell Li-ion</l1>
                                            </ul>

                                            <h4 class="fw-bold">Power Supply</h4>
                                            <ul>
                                                <l1>ø4.0, 45W AC Adapter, Output: 19V DC, 2.37A, 45W, Input: 100~240V AC
                                                    50/60Hz universal
                                                </l1>
                                            </ul>

                                            <h4 class="fw-bold">Weight</h4>
                                            <ul>
                                                <l1>1.80 kg (3.97 lbs)</l1>
                                            </ul>

                                            <h4 class="fw-bold">Included in the Box</h4>
                                            <ul>
                                                <l1>Mouse</l1>
                                                <l1>Backpack</l1>
                                            </ul>
                                        </div>
                                    </div>

                                </div>

                                <div class="tab-pane fade" id="nav-profile" role="tabpanel"
                                     aria-labelledby="nav-profile-tab">

                                    <div class="row">
                                        <div class="col-12 mt-3">
                                            <div class="row">
                                                <div class="col-12 text-center">
                                                    <img src="${BASE_URL}${productImages.path_01}" width="90%"
                                                         height="auto"/>
                                                </div>
                                                <div class="col-12 text-center mt-2">
                                                    <img src="${BASE_URL}${productImages.path_02}" width="90%"
                                                         height="auto"/>
                                                </div>
                                                <div class="col-12 text-center mt-2">
                                                    <img src="${BASE_URL}${productImages.path_03}" width="90%"
                                                         height="auto"/>
                                                </div>

                                                <div class="col-12 text-center mt-2">
                                                    <img src="${BASE_URL}${productImages.path_04}" width="90%"
                                                         height="auto"/>
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

        </body>


    </layout:put>

</layout:extends>
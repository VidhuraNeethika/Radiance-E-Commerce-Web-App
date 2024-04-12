<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>

<layout:extends name="base">

  <layout:put block="contents" type="REPLACE">


    <body>

    <div class="container-fluid">
      <div class="row">

        <div class="col-12 py-3 ps-4 mt-4 mt-lg-2">

          <a href="index.php" class="pagination-links">Home</a>

          <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

          <a class="pagination-links">My Account</a>

          <span><i class="bi bi-chevron-right fs-mini fw-bold"></i></span>

          <a href="purchased-history.php" class="pagination-links active-page">Purchased History</a>

        </div>

        <div class="col-12 col-lg-10 offset-lg-1 my-2">
          <span class="main-heading">Purchased History</span>

          <ul class="nav nav-tabs mt-2" id="myTab" role="tablist">
            <li class="nav-item me-2 ms-4" role="presentation">
              <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="home" aria-selected="true">All Items</button>
            </li>
            <li class="nav-item me-2" role="presentation">
              <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#completed" type="button" role="tab" aria-controls="profile" aria-selected="false">Completed</button>
            </li>
            <li class="nav-item me-2" role="presentation">
              <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#cancel" type="button" role="tab" aria-controls="contact" aria-selected="false">Canceled</button>
            </li>

            <div class="col-12 col-lg-8 mt-3 mt-lg-0">
              <div class="row">

                <div class="col-12 col-lg-6">
                  <div class="input-group mb-3 border-dark-outline">
                    <input type="text" class="form-control" placeholder="Search.." aria-label="Example text with button addon" aria-describedby="button-addon1">
                    <button class="btn-my-2" type="button" id="button-addon1"><i class="bi bi-search"></i></button>
                  </div>
                </div>

                <div class="col-12 col-lg-6 mb-2 mb-lg-0">
                  <div class="row">

                    <div class="col-5">
                      <input class="form-control" type="date" value="05/09/2022" placeholder="Default input" aria-label="default input example">
                    </div>

                    <div class="col-2 text-center d-flex align-items-center justify-content-center">
                      <span class="text-black-50 fw-bold">to</span>
                    </div>

                    <div class="col-5">
                      <input class="form-control" type="date" value="05/09/2022" placeholder="Default input" aria-label="default input example">
                    </div>

                  </div>
                </div>

              </div>
            </div>

          </ul>

          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="home-tab">
              <div class="row">

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 235264</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/ele 01.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">LED Recessed Spotlight 10W/12W/14W CCT Dimmable Spotlight Ceiling Spot 230V IP44 Round</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 2 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 11,250.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 212364</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/sony playstation.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Sony Playstation 5 Disc Version Video Game Console</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 5 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 224,143.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 125264</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/wifi display.jpg" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Wifi Wireless HDMI Mirror Screen Display Adapter For 1080P TV Miracast Dongle</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 8 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 5,040.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 234457</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/fast 60w charger.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Fast 60W PD USB Type C to USB Type-C Charge 90 Degree Right Angle Cable UK</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 12 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 2,392.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

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

            <div class="tab-pane fade" id="completed" role="tabpanel" aria-labelledby="profile-tab">
              <div class="row">

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 235264</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/ele 01.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">LED Recessed Spotlight 10W/12W/14W CCT Dimmable Spotlight Ceiling Spot 230V IP44 Round</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 2 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 11,250.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 212364</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/sony playstation.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Sony Playstation 5 Disc Version Video Game Console</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 5 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 224,143.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 125264</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/wifi display.jpg" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Wifi Wireless HDMI Mirror Screen Display Adapter For 1080P TV Miracast Dongle</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 8 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 5,040.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 234457</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/fast 60w charger.webp" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">Fast 60W PD USB Type C to USB Type-C Charge 90 Degree Right Angle Cable UK</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">Completed</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 12 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 2,392.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

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

            <div class="tab-pane fade" id="cancel" role="tabpanel" aria-labelledby="contact-tab">
              <div class="row">

                <div class="col-6 col-lg-12">
                  <div class="row p-1">

                    <div class="col-12">
                      <div class="row p-2 bg-white mt-2 rounded-cornrs">

                        <div class="col-12 col-lg-1 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"># 554477</span>
                        </div>

                        <div class="col-12 col-lg-1">
                          <img src="${BASE_URL}assets/pictures/products/hdmi port.jpg" class="p-h-product-circle" alt="">
                        </div>

                        <div class="col-12 col-lg-3 d-flex align-items-center">
                          <span class="text-truncate">HDMI Male To VGA Male Video Converter Adapter Cable For PC DVD 1080P HDTV 6FT</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold text-danger">Canceled</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="text-black-50 fw-bold"><i class="bi bi-clock-history"></i> 2 days ago</span>
                        </div>

                        <div class="col-12 col-lg-2 d-flex align-items-center">
                          <span class="price-text fw-bold">LKR. 3,150.00</span>
                        </div>

                        <div class="col-12 col-lg-1 d-flex align-items-center d-grid">
                          <button class="view-btn">View</button>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>

                <div class="col-12 d-flex justify-content-center pt-3">

                  <nav aria-label="Page navigation example">
                    <ul class="pagination">

                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                        </a>
                      </li>

                      <li class="page-item"><a class="page-link" href="#">1</a></li>

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

    </body>


  </layout:put>

</layout:extends>
<%@ taglib uri="http://callidora.lk/jsp/template-inheritance" prefix="layout"%>

<layout:extends name="base">

  <layout:put block="contents" type="REPLACE">

    <body class="mt-2" style="background-color: #f7f7ff;">

    <div class="container-fluid">

      <div class="row">

        <div class="col-12 col-lg-10 offset-lg-1 mt-3 bg-white text-center pt-3">
          <div class="success-icon"></div>
          <span class="d-block success-msg">Payment Success !</span>
        </div>

        <div class="col-12 col-lg-10 offset-lg-1 bg-white mb-3">

          <div class="row p-2 pt-4">

            <div class="col-12">
              <hr />
              <div class="row">
                <div class="col-6">
                  <div class="invoiceheaderimg"></div>
                </div>

                <div class="col-6">
                  <div class="row">
                    <div class="col-12 d-flex justify-content-end">
                      <div class="logo"></div>
                    </div>

                    <div class="col-12 text-end">
                      <span class="text-black-50">Maradana, Colombo 10, Sri Lanka</span><br />
                      <span class="text-black-50">+94 7601821354</span><br />
                      <span class="text-black-50">Newtech.Info@Gmail.Com</span>
                    </div>

                  </div>
                </div>

                <div class="col-12 mb-4 bg-light mt-2">
                  <div class="row p-3">

                    <div class="col-6">

                      <h6 class="sm-text">INVOICE TO : Vidhura Neethika Udayananda</h6>
                      <h2>8th Lane, Regland Estate, Boyagane</h2>
                      <span class="sm-text d-block">+94 764545784</span>
                      <span class="sm-text">vidhuraneethika000@gmail.com</span>

                    </div>


                    <div class="col-6 text-end mt-4">
                      <h6 class="text-primary fw-bold">INVOICE 01</h6>
                      <span class="fw-bold sm-text text-black-50">Date and Time of Invoice &nbsp; :</span> &nbsp;
                      <span class="fw-bold">2020-01-01</span>
                    </div>


                  </div>
                </div>

                <div class="col-12">
                  <div class="row main-background p-2 text-center fw-bold">

                    <div class="col-1  d-none d-lg-block"></div>

                    <div class="col-1  d-none d-lg-block">Id</div>

                    <div class="col-5  d-none d-lg-block">Product</div>

                    <div class="col-2  d-none d-lg-block">Unit Price</div>

                    <div class="col-1  d-none d-lg-block">Qty</div>

                    <div class="col-2  d-none d-lg-block">Total</div>

                  </div>


                  <div class="row p-2 mt-3">

                    <div class="col-12 col-lg-1 text-lg-end">
                      <span class="fw-bold text-success">#</span>
                      <span>01</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Id :</span>
                      <span>PR-12301</span>
                    </div>

                    <div class="col-12 col-lg-5">
                      <span class="d-inline-block d-lg-none fw-bold">Product</span>
                      <p class="text-truncate">Fast 60W PD USB Type C to USB Type-C Charge 90 Degree Right Angle Cable UK</p>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Unit Price :</span>
                      <span>LKR. 11,000 .00</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Qty :</span>
                      <span>01</span>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Total :</span>
                      <span class="text-lg-end">LKR. 11,000 .00</span>
                    </div>

                  </div>

                  <hr />

                  <div class="row p-2 mt-3">

                    <div class="col-12 col-lg-1 text-lg-end">
                      <span class="fw-bold text-success">#</span>
                      <span>02</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Id :</span>
                      <span><span>PR-24587</span></span>
                    </div>

                    <div class="col-12 col-lg-5">
                      <span class="d-inline-block d-lg-none fw-bold">Product</span>
                      <p class="text-truncate">HDMI Male To VGA Male Video Converter Adapter Cable For PC DVD 1080P HDTV 6FT</p>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Unit Price :</span>
                      <span>LKR. 3,150.00</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Qty :</span>
                      <span>01</span>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Total :</span>
                      <span class="text-lg-end">LKR. 3,150.00</span>
                    </div>

                  </div>

                  <hr />

                  <div class="row p-2 mt-3">

                    <div class="col-12 col-lg-1 text-lg-end">
                      <span class="fw-bold text-success">#</span>
                      <span>03</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Id :</span>
                      <span>PR-52364</span>
                    </div>

                    <div class="col-12 col-lg-5">
                      <span class="d-inline-block d-lg-none fw-bold">Product</span>
                      <p class="text-truncate">Sony Playstation 5 Disc Version Video Game Console</p>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Unit Price :</span>
                      <span>LKR. 224,143.00</span>
                    </div>

                    <div class="col-12 col-lg-1 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Qty :</span>
                      <span>01</span>
                    </div>

                    <div class="col-12 col-lg-2 text-lg-center">
                      <span class="d-inline-block d-lg-none fw-bold">Total :</span>
                      <span class="text-lg-end">LKR. 224,143.00</span>
                    </div>

                  </div>

                  <hr />


                </div>

                <div class="col-12 text-center">
                  <span>Thank You !</span>
                </div>

                <div class="alert-bg col-12 mt-3 mb-3 border border-start border-end-0 border-top-0 border-bottom-0 border-5 border-success rounded">

                  <div class="row">
                    <div class="col-12 mt-3 mb-3">
                      <lable class="form-lable sm-text fw-bold">NOTICE :</lable>
                      <lable class="form-lable">Purchased items can return befor 7 days of delivery</lable>
                    </div>
                  </div>

                </div>

                <div class="col-12 btn-toolbar justify-content-end">
                  <button class="btn-print me-2" onclick="printinvoice();"><i class="bi bi-printer-fill"></i> Print</button>
                  <button class="btn-pdf me-2"><i class="bi bi-file-earmark-pdf-fill"></i> Save as PDF</button>
                </div>

                <div class="col-12">
                  <hr class="border border-1 border-success" />
                </div>

                <div class="col-12 mb-3 text-center">
                  <lable class="form-lable text-black-50 sm-text fw-bold">
                    Invoice was created on a computer and is valid without the Signature and Seal
                  </lable>
                </div>

              </div>
            </div>

          </div>

        </div>

      </div>

    </div>

  </layout:put>

</layout:extends>
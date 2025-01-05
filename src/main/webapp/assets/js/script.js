function go_to_home() {
    window.location = BASE_URL;
}

function go_to_cart() {
    window.location = BASE_URL + "cart";
}

function go_to_wishlist() {
    window.location = BASE_URL + "wishlist";
}

function go_to_products() {
    window.location = BASE_URL + "products";
}

function offerTimer() {
    var countDownDate = new Date("July 5, 2026 15:37:25").getTime();

    var x = setInterval(function () {

        var now = new Date().getTime();

        var distance = countDownDate - now;

        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        document.getElementById("days").innerHTML = days + " D";

        document.getElementById("hour").innerHTML = hours + " H";

        document.getElementById("min").innerHTML = minutes + " M";

        document.getElementById("secounds").innerHTML = seconds + " S";

        if (distance < 0) {
            clearInterval(x);
            document.getElementById("days").innerHTML = "EXPIRED";
        }
    }, 1000);
}

function generateUsername() {
    let username = document.getElementById("username");
    let email = document.getElementById("email").value;

    username.value = email;
}

function scrollEffect() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        document.getElementById("scroll-top").style.visibility = "visible";
        // document.getElementById("headerMainShadow").classList.add("shadow");
    } else {
        document.getElementById("scroll-top").style.visibility = "hidden";
        // document.getElementById("headerMainShadow").classList.remove("shadow");
    }
}

function register_form() {
    var sign_in_area = document.getElementById("sign_in_area");
    var sign_up_area = document.getElementById("sign_up_area");

    sign_in_area.classList.add("d-none");
    sign_up_area.classList.remove("d-none");
}

function sign_in_form() {
    var sign_in_area = document.getElementById("sign_in_area");
    var sign_up_area = document.getElementById("sign_up_area");

    sign_up_area.classList.add("d-none");
    sign_in_area.classList.remove("d-none");
}

function loadmainimg(id) {

    var pid = id;
    var img = document.getElementById("pimg" + pid).src;
    var mainimg = document.getElementById("mainimg");

    mainimg.src = img;

}

function printinvoice() {
    var restorepage = document.body.innerHTML;
    var page = document.getElementById("page").innerHTML;
    document.body.innerHTML = page;
    window.print();
    document.body.innerHTML = restorepage;
}

function changeImage() {
    var image = document.getElementById("imguploader");
    var view = document.getElementById("prev");

    image.onchange = function () {
        var file = this.files[0];
        var url = window.URL.createObjectURL(file);

        view.src = url;
    }
}

function changeImage2() {
    var image = document.getElementById("imguploader2");
    var view = document.getElementById("prev2");

    image.onchange = function () {
        var file = this.files[0];
        var url = window.URL.createObjectURL(file);

        view.src = url;
    }
}

function changeImage3() {
    var image = document.getElementById("imguploader3");
    var view = document.getElementById("prev3");

    image.onchange = function () {
        var file = this.files[0];
        var url = window.URL.createObjectURL(file);

        view.src = url;
    }
}

function changeImage4() {
    var image = document.getElementById("imguploader4");
    var view = document.getElementById("prev4");

    image.onchange = function () {
        var file = this.files[0];
        var url = window.URL.createObjectURL(file);

        view.src = url;
    }
}

function signUp() {

    let firstName = document.getElementById("first-name").value;
    let lastName = document.getElementById("last-name").value;
    let email = document.getElementById("email").value;
    let mobile = document.getElementById("mobile").value;
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirm-password").value;
    let addressLine01 = document.getElementById("address-line-01").value;
    let addressLine02 = document.getElementById("address-line-02").value;
    let city = document.getElementById("city").value;
    let postalCode = document.getElementById("postal-code").value;

    fetch(BASE_URL + 'sign-up', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            firstName: firstName,
            lastName: lastName,
            email: email,
            mobile: mobile,
            username: username,
            password: password,
            confirmPassword: confirmPassword,
            addressLine01: addressLine01,
            addressLine02: addressLine02,
            city: city,
            postalCode: postalCode,
        })
    }).then(
        async response => {
            if (response.ok) {
                location.reload();
            } else {
                return await response.text()
            }
            return await response.text();
        }
    ).then(
        text => {

            swal(text);

        }
    )

}

function signIn() {
    let username = document.getElementById("loginUsername").value;
    let password = document.getElementById("loginPassword").value;

    fetch(BASE_URL + 'sign-in', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            username: username,
            password: password,
        })
    }).then(
        async response => {

            if (!response.ok) {
                swal("Something went wrong..!", "Invalid login credentials. Please try again.", "warning");
            }

            return response.json();
        }
    ).then(
        data => {

            localStorage.setItem("accessToken", data.accessToken);
            localStorage.setItem("refreshToken", data.refreshToken);
            localStorage.setItem("expireIn", data.expireIn);

            window.location = BASE_URL;

        }
    )


}

function secureFetch(url, options = {}) {

    const token = localStorage.getItem("accessToken");
    const expireIn = localStorage.getItem("expireIn");

    const expireAt = new Date(Number(expireIn)).getTime();
    const expireGate = new Date().getTime() + 2 * 60 * 1000;

    if (token && expireAt && expireAt < expireGate) {
        return refreshToken().then(newToken => {
            options.headers = {
                ...options.headers,
                Authorization: 'Bearer' + newToken
            }
            return fetch(url, options);
        })
    }

    if (token) {
        options.headers = {
            ...options.headers,
            Authorization: 'Bearer' + token
        }
    } else {
        swal("Warning..", "Token unavailable.Please Sign In.", "warning")
            .then((value) => {
                window.location = BASE_URL + "sign-in";
            });


    }

    return fetch(url, options);

}

function refreshToken() {
    const oldRefreshToken = localStorage.getItem("refreshToken");

    const formData = new URLSearchParams();
    formData.append("token", oldRefreshToken);

    if (oldRefreshToken) {
        return fetch(BASE_URL + 'login/refresh-token', {
            method: 'post',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData
        }).then(response => {

            if (!response.ok) {
                window.location = BASE_URL + "sign-in";
            }

            return response.json();
        }).then(data => {

            localStorage.setItem("accessToken", data.accessToken);
            localStorage.setItem("refreshToken", data.refreshToken);
            localStorage.setItem("expireIn", data.expireIn);

            return data.accessToken;

        })
    } else {
        localStorage.removeItem("accessToken");
        localStorage.removeItem("expireIn");
        window.location = BASE_URL + "sign-in";
    }

}

function addToCart(productId) {

    secureFetch(BASE_URL + 'cart', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            productId: productId,
        })
    }).then(
        response => response.text()
    ).then(
        text => {
            if (text == "Success") {
                swal("Success", "Successfully added to Cart", "success");
            } else if (text == "Added") {
                swal("Warning", "Product already added to Cart", "warning");
            } else if (text == "error") {
                swal("Error", "Something went wrong.Please try again", "error");
            }
        }
    )

}

function removeFromCart(productId) {

    swal({
        title: "Are you sure?",
        text: "Once you remove, product will remove from your cart",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                fetch(BASE_URL + 'cart', {
                    method: 'delete',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productId: productId,
                    })
                }).then(
                    response => response.text()
                ).then(
                    text => {
                        if (text == "Success") {
                            location.reload();
                        } else if (text == "error") {
                            swal("Error", "Something went wrong.Please try again", "error");
                        }
                    }
                )
            } else {
                swal("Your are safe!");
            }
        });
}

function removeFromWishlist(productId) {

    swal({
        title: "Are you sure?",
        text: "Once you remove, product will remove from your wishlist",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                fetch(BASE_URL + 'wishlist', {
                    method: 'delete',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productId: productId,
                    })
                }).then(
                    response => response.text()
                ).then(
                    text => {
                        if (text == "Success") {
                            location.reload();
                        } else if (text == "error") {
                            swal("Error", "Something went wrong.Please try again", "error");
                        }
                    }
                )
            } else {
                swal("Your are safe!");
            }
        });
}

function addToWishlist(productId) {
    secureFetch(BASE_URL + 'wishlist', {
        method: 'post',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            productId: productId,
        })
    }).then(
        response => response.text()
    ).then(
        text => {
            if (text == "Success") {
                swal("Success", "Successfully added to Wishlist", "success");
            } else if (text == "Added") {
                swal("Warning", "Product already added to Wishlist", "warning");
            } else if (text == "error") {
                swal("Error", "Something went wrong.Please try again", "error");
            }
        }
    )
}

function singleProductView(productId) {
    window.location = BASE_URL + "single-product-view?pid=" + productId;
}

function logOut() {

    swal({
        title: "Are you sure?",
        text: "Once sign out, You need to sign in to access features",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                fetch(BASE_URL + 'log-out', {
                    method: 'post',
                }).then(
                    response => response.text()
                ).then(text => {
                    if (text == "ok") {
                        window.location = BASE_URL + "sign-in";
                    }
                })

            } else {
                swal("Your are safe!");
            }
        });

}

function test() {
    secureFetch(BASE_URL + 'test', {
        headers: {
            'Content-Type': 'application/json'
        },
    }).then(
        response => response.text()
    ).then(
        text => {
            swal("Success..", text, "success");
        }
    )
}

function registerProducts() {
    let title = document.getElementById("productTitle").value;
    let category = document.getElementById("category").value;
    let brand = document.getElementById("brand").value;
    let model = document.getElementById("model").value;
    let qty = document.getElementById("qty").value;
    let price = document.getElementById("price").value;

    let deliveryFee = document.getElementById("deliveryFee").value;
    let description = document.getElementById("description").value;

    fetch(BASE_URL + 'admin/api/product', {
        headers: {
            'Content-Type': 'application/json'
        },
        method: 'post',
        body: JSON.stringify({
            title: title,
            price: price,
            qty: qty,
            description: description,
            delivery_fee: deliveryFee,
            category: category,
            model: model,
            brand: brand
        })
    }).then(
        response => response.json()
    ).then(data => {
        uploadImages(data.pid);
    })

}

function uploadImages(productId) {

    let imguploader1 = document.getElementById("imguploader").files[0];
    let imguploader2 = document.getElementById("imguploader2").files[0];
    let imguploader3 = document.getElementById("imguploader3").files[0];
    let imguploader4 = document.getElementById("imguploader4").files[0];

    let formData = new FormData();
    formData.append("file[]", imguploader1);
    formData.append("file[]", imguploader2);
    formData.append("file[]", imguploader3);
    formData.append("file[]", imguploader4);

    fetch(BASE_URL + 'admin/api/product/' + productId + '/upload-image', {
        method: 'post',
        body: formData
    }).then(
        response => response.json()
    ).then(data => {

        swal("Success..", "Successfully added", "success")
            .then((value) => {
                console.log(data);
                location.reload();
            });

    })
}

function removeProduct(productId) {

    swal({
        title: "Are you sure?",
        text: "Once you remove, product will remove permanently",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {

                fetch(BASE_URL + 'admin/api/product/' + productId, {
                    method: 'delete',
                }).then(
                    response => {
                        if (response.ok) {
                            location.reload();
                        }
                    }
                )

            } else {
                swal("Your are safe!");
            }
        });

}


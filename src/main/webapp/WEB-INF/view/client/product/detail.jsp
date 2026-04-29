<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> ${product.name} - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Product Details
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="col-lg-8 col-xl-9">
                                    <div class="row g-4">
                                        <div class="col-lg-6">
                                            <div class="border rounded">
                                                <a href="#">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid rounded" alt="Image">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3"> ${product.name}</h4>
                                            <p class="mb-3">${product.factory}</p>
                                            <h5 class="fw-bold mb-3">
                                                <fmt:formatNumber type="number" value="${product.price}" /> đ

                                            </h5>
                                            <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p class="mb-4">
                                                ${product.shortDesc}
                                            </p>

                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                    class="form-control form-control-sm text-center border-0" value="1"
                                                    data-cart-detail-index="0">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <form action="/add-product-from-view-detail" method="post"
                                                modelAttribute="product">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <input class="form-control d-none" type="text" value="${product.id}"
                                                    name="id" />

                                                <input class="form-control d-none" type="text" name="quantity"
                                                    id="cartDetails0.quantity" value="1" />
                                                <button
                                                    class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                    Add to cart
                                                </button>
                                            </form>

                                        </div>                                        <div class="col-lg-12">
                                            <nav>
                                                <div class="nav nav-tabs mb-4 border-0">
                                                    <button class="nav-link active border-0 fw-bold px-4 rounded-3 me-2 shadow-sm"
                                                        type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-about" aria-controls="nav-about"
                                                        aria-selected="true" style="background: #81c408; color: white;">
                                                        <i class="fas fa-info-circle me-2"></i>Description
                                                    </button>
                                                    <button class="nav-link border-0 fw-bold px-4 rounded-3 shadow-sm text-dark"
                                                        type="button" role="tab" id="nav-specs-tab" data-bs-toggle="tab"
                                                        data-bs-target="#nav-specs" aria-controls="nav-specs"
                                                        aria-selected="false" style="background: #f8f9fa;">
                                                        <i class="fas fa-list-ul me-2"></i>Specifications
                                                    </button>
                                                </div>
                                            </nav>
                                            <div class="tab-content border rounded-4 p-4 bg-white shadow-sm mb-5">
                                                <div class="tab-pane fade show active" id="nav-about" role="tabpanel"
                                                    aria-labelledby="nav-about-tab">
                                                    <div class="product-description" style="line-height: 1.8; color: #4a4a4a;">
                                                        ${product.detailDesc}
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="nav-specs" role="tabpanel"
                                                    aria-labelledby="nav-specs-tab">
                                                    <h5 class="fw-bold mb-4" style="color: #2c3e50;">Technical Specifications</h5>
                                                    <div class="table-responsive">
                                                        <table class="table table-hover align-middle mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3" style="width: 30%; border-top: none;">
                                                                        <i class="fas fa-microchip me-2"></i>CPU
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="border-top: none; color: #2c3e50;">
                                                                        ${product.cpu != null && product.cpu != "" ? product.cpu : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-memory me-2"></i>RAM
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.ram != null && product.ram != "" ? product.ram : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-hdd me-2"></i>Storage
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.storage != null && product.storage != "" ? product.storage : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-desktop me-2"></i>GPU
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.gpu != null && product.gpu != "" ? product.gpu : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-expand me-2"></i>Display
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.screen != null && product.screen != "" ? product.screen : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-battery-full me-2"></i>Battery
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.battery != null && product.battery != "" ? product.battery : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th scope="row" class="text-muted py-3">
                                                                        <i class="fas fa-weight me-2"></i>Weight
                                                                    </th>
                                                                    <td class="fw-bold py-3" style="color: #2c3e50;">
                                                                        ${product.weight != null && product.weight != "" ? product.weight : 'Updating...'}
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-lg-4 col-xl-3">
                                    <div class="row g-4 fruite">
                                        <div class="col-lg-12">

                                            <div class="mb-4">
                                                <h4>Categories</h4>
                                                <ul class="list-unstyled fruite-categorie">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                                            <span>(3)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Dell</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Asus</a>
                                                            <span>(2)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Acer</a>
                                                            <span>(8)</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="#"><i class="fas fa-apple-alt me-2"></i>Lenovo</a>
                                                            <span>(5)</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Single Product End -->

                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>

                    <script>
                        $(document).ready(function () {
                            $('.col-lg-6 form').submit(function (event) {
                                event.preventDefault(); 
                                
                                var form = $(this);
                                var url = form.attr('action');
                                // Chuyển sang API endpoint
                                var apiUrl = "/api/add-product-from-view-detail";

                                $.ajax({
                                    type: "POST",
                                    url: apiUrl,
                                    data: form.serialize(), 
                                    success: function (response) {
                                        $('#showCartId').text(response);
                                        
                                        var toast = $('<div style="position: fixed; top: 100px; right: 20px; z-index: 9999; background: #81c408; color: white; padding: 15px 25px; border-radius: 5px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); display: none;">' + 
                                                    '<i class="fa fa-check-circle me-2"></i> Added to cart!' + 
                                                    '</div>');
                                        $('body').append(toast);
                                        toast.fadeIn().delay(2000).fadeOut(function() { $(this).remove(); });
                                    },
                                    error: function (error) {
                                        alert('Error adding product to cart.');
                                    }
                                });
                            });
                        });
                    </script>
                </body>

                </html>
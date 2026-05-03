<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Products - Laptopshop</title>
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
                                            <li class="breadcrumb-item active" aria-current="page">Product List
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="row g-4 fruite">
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4">
                                            <div class="col-12">
                                                <div class="mb-2"><b>Search Products</b></div>
                                                <div class="input-group mb-4">
                                                    <input type="text" class="form-control p-3" placeholder="Search by name..."
                                                        id="nameSearch">
                                                    <span class="input-group-text bg-primary text-white px-3" id="btnSearch" style="cursor: pointer;">
                                                        <i class="fa fa-search"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-12" id="factoryFilter">
                                                <div class="mb-2"><b>Manufacturer</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-1"
                                                        value="APPLE">
                                                    <label class="form-check-label" for="factory-1">Apple</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-2"
                                                        value="ASUS">
                                                    <label class="form-check-label" for="factory-2">Asus</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-3"
                                                        value="LENOVO">
                                                    <label class="form-check-label" for="factory-3">Lenovo</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                                        value="DELL">
                                                    <label class="form-check-label" for="factory-4">Dell</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                                        value="LG">
                                                    <label class="form-check-label" for="factory-5">LG</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                                        value="ACER">
                                                    <label class="form-check-label" for="factory-6">Acer</label>
                                                </div>

                                            </div>
                                            <div class="col-12" id="targetFilter">
                                                <div class="mb-2"><b>Usage Purpose</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="GAMING">
                                                    <label class="form-check-label" for="target-1">Gaming</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="SINHVIEN-VANPHONG">
                                                    <label class="form-check-label" for="target-2">Student - Office</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="THIET-KE-DO-HOA">
                                                    <label class="form-check-label" for="target-3">Graphics Design</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="MONG-NHE">
                                                    <label class="form-check-label" for="target-4">Thin & Light</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-5"
                                                        value="DOANH-NHAN">
                                                    <label class="form-check-label" for="target-5">Business</label>
                                                </div>


                                            </div>
                                            <div class="col-12" id="priceFilter">
                                                <div class="mb-2"><b>Price Range</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-10-trieu">
                                                    <label class="form-check-label" for="price-2">Under 10 million</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="10-15-trieu">
                                                    <label class="form-check-label" for="price-3">10 - 15 million</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="15-20-trieu">
                                                    <label class="form-check-label" for="price-4">15 - 20 million</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-20-trieu">
                                                    <label class="form-check-label" for="price-5">Above 20 million</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-2"><b>Sort By</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Price: Low to High</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Price: High to Low</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">No Sorting</label>
                                                </div>

                                            </div>
                                            <div class="col-12 d-flex gap-2">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 flex-grow-1"
                                                    id="btnFilter">
                                                    Filter
                                                </button>
                                                <button
                                                    class="btn border-danger rounded-pill px-4 py-3 text-danger text-uppercase mb-4"
                                                    id="btnRefresh">
                                                    <i class="fas fa-sync-alt"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8 text-center">
                                        <div class="row g-4">
                                            <c:if test="${totalPages == 0 }">
                                                <div>No products found </div>
                                            </c:if>
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                style="height:214.200px"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Laptop
                                                        </div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 class="product-name" style="font-size: 15px;">
                                                                <a href="/product/${product.id}">
                                                                    ${product.name}
                                                                </a>
                                                            </h4>
                                                            <p class="product-short-desc" style="font-size: 13px;">
                                                                ${product.shortDesc}</p>
                                                            <div
                                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark  fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    đ
                                                                </p>
                                                                <form action="/add-product-to-cartALL/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />

                                                                    <button
                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <c:if test="${totalPages > 0 }">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                        <c:choose>
                                                            <c:when test="${currentPage == 1}">
                                                                <a class="page-link" aria-disabled="true">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="page-link"
                                                                    href="/products?page=${currentPage - 1}&${querySString}">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>

                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/products?page=${loop.index + 1}&${querySString}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li
                                                        class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                        <c:choose>
                                                            <c:when test="${currentPage == totalPages}">
                                                                <a class="page-link" aria-disabled="true">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a class="page-link"
                                                                    href="/products?page=${currentPage + 1}&${querySString}">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>


                                                </div>
                                            </c:if>

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
                    <jsp:include page="../layout/scripts.jsp" />

                    <script>
                        $(document).ready(function () {
                            $('.fruite-item form').submit(function (event) {
                                event.preventDefault(); 
                                
                                var form = $(this);
                                var isLoggedIn = $('#isLoggedInFlag').length > 0;
                                
                                if (!isLoggedIn) {
                                    // Extract ID from form action or a hidden input if exists
                                    var action = form.attr('action');
                                    var productId = action.substring(action.lastIndexOf('/') + 1);
                                    GuestCart.add(productId, 1);
                                    
                                    var toast = $('<div style="position: fixed; top: 100px; right: 20px; z-index: 9999; background: #81c408; color: white; padding: 15px 25px; border-radius: 5px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); display: none;">' + 
                                                '<i class="fa fa-check-circle me-2"></i> Added to guest cart!' + 
                                                '</div>');
                                    $('body').append(toast);
                                    toast.fadeIn().delay(2000).fadeOut(function() { $(this).remove(); });
                                    return;
                                }

                                var url = form.attr('action');
                                var apiUrl = url.replace('/add-product-to-cart/', '/api/add-product-to-cart/')
                                                .replace('/add-product-to-cartALL/', '/api/add-product-to-cart/');

                                $.ajax({
                                    type: "POST",
                                    url: apiUrl,
                                    data: form.serialize(), 
                                    success: function (response) {
                                        if (isNaN(response)) {
                                            window.location.href = '/login';
                                            return;
                                        }
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Shopping Cart - Laptopshop</title>
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
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <div id="isLoggedInFlag" style="display: none;"></div>
                    </c:if>

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Cart Details</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Product</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cartTableBody">
                                        <c:if test="${ empty cartDetails and not empty pageContext.request.userPrincipal}">
                                            <tr>
                                                <td colspan="6">
                                                    Your shopping cart is empty
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                            <tr>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <a href="/product/${cartDetail.product.id}" target="_blank">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}"
                                                            data-cart-detail-id="${cartDetail.id}"
                                                            data-cart-detail-price="${cartDetail.price}"
                                                            data-cart-detail-index="${status.index}">
                                                        <div class="input-group-btn">
                                                            <button
                                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <form method="post" action="/delete-cart-product/${cartDetail.id}" id="deleteForm-${cartDetail.id}">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    </form>
                                                    <button type="button"
                                                        class="btn btn-md rounded-circle bg-light border mt-4 btn-delete-cart"
                                                        data-cart-id="${cartDetail.id}"
                                                        data-product-name="${cartDetail.product.name}"
                                                        data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                                                        <i class="fa fa-times text-danger"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                                <div id="cartSummarySection" class="mt-5 row g-4 justify-content-start">
                                    <div class="col-12 col-md-8">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4">Order <span class="fw-normal">Information</span>
                                                </h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">Subtotal:</h5>
                                                    <p class="mb-0" id="cartTotalPrice" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">Shipping Fee</h5>
                                                    <div class="">
                                                        <p class="mb-0">0 đ</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4">Total Amount</h5>
                                                <p class="mb-0 pe-4" id="cartTotalAmount" data-cart-total-price="${totalPrice}">
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                </p>
                                            </div>
                                            
                                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                                <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div style="display: none;">
                                                        <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                            varStatus="status">
                                                            <div class="mb-3">
                                                                <div class="form-group">
                                                                    <label>Id:</label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.id}"
                                                                        path="cartDetails[${status.index}].id" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Quantity:</label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.quantity}"
                                                                        path="cartDetails[${status.index}].quantity" />
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <button
                                                        ${empty cartDetails ? 'disabled' : ''}
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 ${empty cartDetails ? 'opacity-50' : ''}">Checkout
                                                    </button>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${empty pageContext.request.userPrincipal}">
                                                <a href="/checkout" id="guestCheckoutBtn"
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 d-inline-block">Checkout
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>
                    <jsp:include page="../layout/scripts.jsp" />

                    <!-- Delete Confirmation Modal -->
                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content" style="border-radius: 16px; overflow: hidden; border: none; box-shadow: 0 20px 60px rgba(0,0,0,0.15);">
                                <div class="modal-header" style="background: linear-gradient(135deg, #ff6b6b, #ee5a24); border: none; padding: 1.5rem 2rem;">
                                    <div class="d-flex align-items-center gap-3">
                                        <div style="background: rgba(255,255,255,0.2); border-radius: 50%; width:42px; height:42px; display:flex; align-items:center; justify-content:center;">
                                            <i class="fa fa-trash" style="color: #fff; font-size: 1.1rem;"></i>
                                        </div>
                                        <h5 class="modal-title mb-0" id="deleteModalLabel" style="color: #fff; font-weight: 700;">Confirm Removal</h5>
                                    </div>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body" style="padding: 2rem;">
                                    <p class="mb-1" style="color: #555;">Are you sure you want to remove</p>
                                    <p id="deleteProductName" class="fw-bold" style="color: #222; font-size: 1rem;"></p>
                                    <p class="mb-0 small" style="color: #999;">from your cart? This action cannot be undone.</p>
                                </div>
                                <div class="modal-footer" style="border: none; padding: 1rem 2rem 1.5rem; gap: 0.75rem;">
                                    <button type="button" class="btn btn-outline-secondary px-4" data-bs-dismiss="modal"
                                        style="border-radius: 8px;">Cancel</button>
                                    <button type="button" id="confirmDeleteBtn" class="btn px-4 fw-bold"
                                        style="background: linear-gradient(135deg, #ff6b6b, #ee5a24); color: #fff; border-radius: 8px; border: none;">
                                        <i class="fa fa-trash me-2"></i>Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            var deleteModal = document.getElementById('deleteConfirmModal');
                            var confirmBtn  = document.getElementById('confirmDeleteBtn');
                            var currentFormId = null;
                            var currentGuestProductId = null;

                            deleteModal.addEventListener('show.bs.modal', function(event) {
                                var trigger = event.relatedTarget;
                                var cartId  = trigger.getAttribute('data-cart-id');
                                var guestId = trigger.getAttribute('data-guest-id');
                                var name    = trigger.getAttribute('data-product-name');
                                
                                if (cartId) {
                                    currentFormId = 'deleteForm-' + cartId;
                                    currentGuestProductId = null;
                                } else {
                                    currentFormId = null;
                                    currentGuestProductId = guestId;
                                }
                                document.getElementById('deleteProductName').textContent = '"' + name + '"';
                            });

                            confirmBtn.addEventListener('click', function() {
                                if (currentFormId) {
                                    document.getElementById(currentFormId).submit();
                                } else if (currentGuestProductId) {
                                    GuestCart.remove(parseInt(currentGuestProductId));
                                    location.reload();
                                }
                            });

                            // Render guest cart if not logged in
                            if ($('#isLoggedInFlag').length === 0) {
                                var guestCart = GuestCart.get();
                                if (guestCart.length === 0) {
                                    $('#cartTableBody').html('<tr><td colspan="6" class="text-center py-5">Your shopping cart is empty</td></tr>');
                                    $('#cartSummarySection').hide();
                                } else {
                                    var productIds = guestCart.map(item => parseInt(item.productId));
                                    var csrfToken = $("meta[name='_csrf']").attr("content");
                                    
                                    $.ajax({
                                        url: '/api/products/details',
                                        type: 'POST',
                                        contentType: 'application/json',
                                        data: JSON.stringify(productIds),
                                        beforeSend: function(xhr) {
                                            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
                                        },
                                        success: function(products) {
                                            if (!products || products.length === 0) {
                                                $('#cartTableBody').html('<tr><td colspan="6" class="text-center py-5">Your products are no longer available</td></tr>');
                                                $('#cartSummarySection').hide();
                                                return;
                                            }
                                            
                                            var html = '';
                                            var total = 0;
                                            products.forEach(product => {
                                                var guestItem = guestCart.find(item => item.productId == product.id);
                                                var quantity = guestItem ? guestItem.quantity : 1;
                                                var itemTotal = product.price * quantity;
                                                total += itemTotal;
                                                
                                                html += `
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center">
                                                                <img src="/images/product/\${product.image}"
                                                                    class="img-fluid me-5 rounded-circle"
                                                                    style="width: 80px; height: 80px;" alt="">
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <p class="mb-0 mt-4">
                                                                <a href="/product/\${product.id}" target="_blank">\${product.name}</a>
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4">\${new Intl.NumberFormat().format(product.price)} đ</p>
                                                        </td>
                                                        <td>
                                                            <div class="input-group quantity mt-4" style="width: 100px;">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <input type="text" class="form-control form-control-sm text-center border-0" 
                                                                    value="\${quantity}" readonly
                                                                    data-guest-id="\${product.id}"
                                                                    data-cart-detail-price="\${product.price}">
                                                                <div class="input-group-btn">
                                                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4" data-cart-detail-id="\${product.id}">\${new Intl.NumberFormat().format(itemTotal)} đ</p>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-md rounded-circle bg-light border mt-4"
                                                                data-guest-id="\${product.id}"
                                                                data-product-name="\${product.name}"
                                                                data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                                                                <i class="fa fa-times text-danger"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                `;
                                            });
                                            $('#cartTableBody').html(html);
                                            $('#cartTotalPrice').text(new Intl.NumberFormat().format(total) + ' đ');
                                            $('#cartTotalAmount').text(new Intl.NumberFormat().format(total) + ' đ');
                                            $('#cartSummarySection').show();
                                        },
                                        error: function() {
                                            $('#cartTableBody').html('<tr><td colspan="6" class="text-center py-5 text-danger">Error loading cart details.</td></tr>');
                                        }
                                    });
                                }
                            }

                            // Guest Checkout Handler
                            $('#guestCheckoutBtn').on('click', function(e) {
                                e.preventDefault();
                                Swal.fire({
                                    title: 'Login Required',
                                    text: 'Please login to proceed with your payment. Your cart will be saved automatically.',
                                    icon: 'info',
                                    showCancelButton: true,
                                    confirmButtonColor: '#81c408',
                                    cancelButtonColor: '#6c757d',
                                    confirmButtonText: 'Login Now',
                                    cancelButtonText: 'Continue Shopping'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.href = '/login';
                                    }
                                });
                            });
                        });
                    </script>

                </body>

                </html>
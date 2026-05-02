<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Order History - Laptopshop</title>
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

                <!-- Cart Page Start -->
                <div class="container-fluid py-5">
                    <div class="container py-5">
                        <div class="mb-4">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Order History</li>
                                </ol>
                            </nav>
                            <h1 class="mb-0">Order History</h1>
                        </div>

                        <c:if test="${empty orders}">
                            <div class="alert alert-info text-center" role="alert">
                                No orders found.
                            </div>
                        </c:if>


                        <c:forEach var="order" items="${orders}">
                            <div class="card mb-5 shadow-sm border-0 rounded-3">
                                <div class="card-header bg-primary text-white py-3 rounded-top-3">
                                    <div class="row align-items-center">
                                        <div class="col-md-6">
                                            <h5 class="mb-0 text-white"><i class="fas fa-shopping-bag me-2"></i>Order: #${order.id}</h5>
                                        </div>
                                        <div class="col-md-6 text-md-end mt-2 mt-md-0">
                                            <span class="badge 
                                                <c:choose>
                                                    <c:when test='${order.status == "UNPAID"}'>bg-light text-dark</c:when>
                                                    <c:when test='${order.status == "PENDING"}'>bg-warning text-dark</c:when>
                                                    <c:when test='${order.status == "SUCCESS"}'>bg-success</c:when>
                                                    <c:when test='${order.status == "SHIPPING"}'>bg-info text-dark</c:when>
                                                    <c:when test='${order.status == "CANCEL"}'>bg-danger</c:when>
                                                    <c:otherwise>bg-secondary</c:otherwise>
                                                </c:choose>
                                            px-3 py-2 fs-6">${order.status}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-4">
                                    <div class="row mb-4">
                                        <div class="col-md-6 border-end">
                                            <h6 class="text-primary fw-bold mb-3"><i class="fas fa-user me-2"></i>Shipping Details</h6>
                                            <p class="mb-1"><strong>Name:</strong> ${order.receiverName}</p>
                                            <p class="mb-1"><strong>Address:</strong> ${order.receiverAddress}</p>
                                            <p class="mb-1"><strong>Phone:</strong> ${order.receiverPhone}</p>
                                            <p class="mb-1"><strong>Method:</strong> ${order.paymentMethod}</p>
                                            <p class="mb-0"><strong>Payment:</strong>
                                                <span
                                                    class="${order.paymentStatus == 'PAYMENT_SUCCESS' ? 'text-success' : 'text-danger'}">
                                                    ${order.paymentStatus}
                                                </span>
                                            </p>
                                        </div>
                                        <div class="col-md-6 ps-md-4">
                                            <h6 class="text-primary fw-bold mb-3"><i
                                                    class="fas fa-history me-2"></i>Order Status Timeline</h6>
                                            <ul class="list-unstyled small">
                                                <c:if test="${not empty order.orderDate}">
                                                    <li class="mb-1">
                                                        <span class="text-muted"><fmt:formatDate value="${order.orderDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></span>: 
                                                        <span class="fw-bold">Placed</span>
                                                    </li>
                                                </c:if>
                                                <c:if test="${not empty order.pendingDate}">
                                                    <li class="mb-1">
                                                        <span class="text-muted"><fmt:formatDate value="${order.pendingDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></span>: 
                                                        <span class="fw-bold text-warning">Pending Confirmation</span>
                                                    </li>
                                                </c:if>
                                                <c:if test="${not empty order.shippingDate}">
                                                    <li class="mb-1">
                                                        <span class="text-muted"><fmt:formatDate value="${order.shippingDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></span>: 
                                                        <span class="fw-bold text-info">Shipping</span>
                                                    </li>
                                                </c:if>
                                                <c:if test="${not empty order.completeDate}">
                                                    <li class="mb-1">
                                                        <span class="text-muted"><fmt:formatDate value="${order.completeDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></span>: 
                                                        <span class="fw-bold text-success">Completed</span>
                                                    </li>
                                                </c:if>
                                                <c:if test="${not empty order.cancelDate}">
                                                    <li class="mb-1">
                                                        <span class="text-muted"><fmt:formatDate value="${order.cancelDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></span>: 
                                                        <span class="fw-bold text-danger">Canceled</span>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="table-responsive mb-4">
                                        <table class="table table-bordered align-middle">
                                            <thead class="table-light">
                                                <tr>
                                                    <th scope="col" colspan="2">Product</th>
                                                    <th scope="col" class="text-center">Price</th>
                                                    <th scope="col" class="text-center">Qty</th>
                                                    <th scope="col" class="text-end">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr>
                                                        <td style="width: 80px;">
                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                class="img-fluid rounded" style="max-height: 60px;"
                                                                alt="">
                                                        </td>
                                                        <td>
                                                            <a href="/product/${orderDetail.product.id}"
                                                                target="_blank"
                                                                class="text-decoration-none fw-bold text-dark">
                                                                ${orderDetail.product.name}
                                                            </a>
                                                        </td>
                                                        <td class="text-center">
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price}" /> đ
                                                        </td>
                                                        <td class="text-center">${orderDetail.quantity}</td>
                                                        <td class="text-end fw-bold">
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price * orderDetail.quantity}" />
                                                            đ
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4" class="text-end fw-bold">Grand Total:</td>
                                                    <td class="text-end fw-bold text-danger fs-5">
                                                        <fmt:formatNumber type="number" value="${order.totalPrice}" /> VNĐ
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="d-flex justify-content-end gap-2">
                                        <c:if test="${order.status == 'UNPAID' || order.status == 'PENDING'}">
                                            <button type="button" class="btn btn-outline-primary btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#updateModal${order.id}">
                                                <i class="fas fa-edit me-1"></i>Update Info
                                            </button>

                                            <form id="cancelForm${order.id}" action="${pageContext.request.contextPath}/cancel-order/${order.id}" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="confirmCancel('${order.id}')">
                                                    <i class="fas fa-times me-1"></i>Cancel Order
                                                </button>
                                            </form>
                                        </c:if>

                                        <c:if test="${order.status == 'UNPAID'}">
                                            <form id="codForm${order.id}" action="${pageContext.request.contextPath}/change-payment-to-cod" method="post" class="d-inline">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <input type="hidden" name="id" value="${order.id}" />
                                                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="confirmCOD('${order.id}')">
                                                    <i class="fas fa-exchange-alt me-1"></i>Change to COD
                                                </button>
                                            </form>
                                            <a href="/payment/${order.id}" class="btn btn-primary btn-sm">
                                                <i class="fas fa-credit-card me-1"></i>Pay Now
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <!-- Update Modal -->
                            <div class="modal fade" id="updateModal${order.id}" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="${pageContext.request.contextPath}/update-order-info" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="modal-header">
                                                <h5 class="modal-title">Update Shipping Information</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="${order.id}">
                                                <div class="mb-3">
                                                    <label class="form-label">Receiver Name</label>
                                                    <input type="text" class="form-control" name="receiverName"
                                                        value="${order.receiverName}" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Shipping Address</label>
                                                    <textarea class="form-control" name="receiverAddress" rows="2"
                                                        required>${order.receiverAddress}</textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone Number</label>
                                                    <input type="text" class="form-control" name="receiverPhone"
                                                        value="${order.receiverPhone}" required>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Pagination -->
                        <c:if test="${totalPages > 1}">
                            <div class="row mt-5">
                                <div class="col-12">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="/order-history?page=${currentPage - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <li class="page-item ${currentPage == loop.index ? 'active' : ''}">
                                                    <a class="page-link"
                                                        href="/order-history?page=${loop.index}">${loop.index}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                                <a class="page-link" href="/order-history?page=${currentPage + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <!-- Cart Page End -->


                <jsp:include page="../layout/footer.jsp" />
                <jsp:include page="../layout/scripts.jsp" />


                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

                <script>
                    function confirmCancel(orderId) {
                        Swal.fire({
                            title: 'Cancel Order?',
                            text: "Are you sure you want to cancel this order? This action cannot be undone.",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#d33',
                            cancelButtonColor: '#3085d6',
                            confirmButtonText: 'Yes, cancel it!',
                            cancelButtonText: 'No, keep it'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                document.getElementById('cancelForm' + orderId).submit();
                            }
                        })
                    }

                    function confirmCOD(orderId) {
                        Swal.fire({
                            title: 'Switch to COD?',
                            text: "Change payment method to Cash on Delivery?",
                            icon: 'question',
                            showCancelButton: true,
                            confirmButtonColor: '#81c408',
                            cancelButtonColor: '#6c757d',
                            confirmButtonText: 'Yes, change to COD',
                            cancelButtonText: 'No, stay with QR'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                document.getElementById('codForm' + orderId).submit();
                            }
                        })
                    }
                </script>
            </body>

            </html>
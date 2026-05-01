<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Order Detail - PhucXoIT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

    <style>
        :root {
            --bg-light: #f8fafc;
            --card-bg: #ffffff;
            --accent-blue: #0d6efd;
            --border-color: #e2e8f0;
            --text-dark: #334155;
            --text-muted: #64748b;
            --money-green: #10b981;
        }

        body {
            font-family: 'Inter', sans-serif !important;
            background-color: var(--bg-light) !important;
            color: var(--text-dark);
        }

        #layoutSidenav_content {
            background-color: #f4f7f6;
        }

        /* Container & Animation */
        .detail-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        /* Table Styling */
        .table { color: var(--text-dark) !important; vertical-align: middle; }
        .table thead th {
            background: #f8fafc;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            padding: 18px;
            border-bottom: 2px solid var(--border-color) !important;
        }
        .table tbody tr { border-bottom: 1px solid var(--border-color); transition: 0.3s; }
        .table tbody tr:hover { background: #f8fafc !important; }

        /* Product Image Style */
        .product-img-circle {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: 0.3s;
        }
        tr:hover .product-img-circle {
            border-color: var(--accent-blue);
            transform: scale(1.05);
        }

        /* Price Typography */
        .price-text { color: var(--money-green); font-weight: 700; }
        .total-item-text { font-weight: 800; font-size: 1.1rem; color: var(--text-dark); }

        /* Product Link */
        .product-link {
            color: var(--text-dark);
            text-decoration: none;
            font-weight: 700;
            transition: 0.3s;
        }
        .product-link:hover { color: var(--accent-blue); }

        /* Buttons */
        .btn-back-modern {
            background: #f1f5f9;
            border: 1px solid var(--border-color);
            color: var(--text-dark);
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            transition: 0.3s;
            margin-top: 20px;
        }
        .btn-back-modern:hover {
            background: #e2e8f0;
            transform: translateX(-5px);
        }
        
        .border-secondary {
            border-color: var(--border-color) !important;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Chi tiết đơn hàng</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/order">Đơn hàng</a></li>
                        <li class="breadcrumb-item active">Mã đơn ${id}</li>
                    </ol>

                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="detail-container h-100 mb-0">
                                <h4 class="mb-4" style="color: var(--accent-purple); font-weight: 700;">
                                    <i class="fas fa-user-tag me-2"></i>Thông tin nhận hàng
                                </h4>
                                <div class="mb-3">
                                    <label class="small text-muted text-uppercase d-block">Họ tên người nhận</label>
                                    <span class="fw-bold">${orders.receiverName}</span>
                                </div>
                                <div class="mb-3">
                                    <label class="small text-muted text-uppercase d-block">Số điện thoại</label>
                                    <span class="fw-bold">${orders.receiverPhone}</span>
                                </div>
                                <div class="mb-3">
                                    <label class="small text-muted text-uppercase d-block">Địa chỉ</label>
                                    <span class="fw-bold">${orders.receiverAddress}</span>
                                </div>
                                <div class="mb-0">
                                    <label class="small text-muted text-uppercase d-block">Người đặt</label>
                                    <span class="fw-bold">${orders.user.fullName} (${orders.user.email})</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="detail-container h-100 mb-0">
                                <h4 class="mb-4" style="color: var(--money-green); font-weight: 700;">
                                    <i class="fas fa-credit-card me-2"></i>Thanh toán
                                </h4>
                                <div class="mb-3">
                                    <label class="small text-muted text-uppercase d-block">Phương thức</label>
                                    <span class="fw-bold badge bg-secondary">${orders.paymentMethod}</span>
                                </div>
                                <div class="mb-3">
                                    <label class="small text-muted text-uppercase d-block">Trạng thái</label>
                                    <span class="fw-bold ${orders.paymentStatus == 'PAYMENT_SUCCESS' ? 'text-success' : 'text-danger'}">
                                        ${orders.paymentStatus}
                                    </span>
                                </div>
                                <div class="mb-0">
                                    <label class="small text-muted text-uppercase d-block">Tổng tiền</label>
                                    <span class="fw-bold fs-4 price-text">
                                        <fmt:formatNumber type="number" value="${orders.totalPrice}" /> đ
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="detail-container h-100 mb-0">
                                <h4 class="mb-4" style="color: #fbbf24; font-weight: 700;">
                                    <i class="fas fa-clock-rotate-left me-2"></i>Lịch sử trạng thái
                                </h4>
                                <ul class="list-unstyled mb-0" style="font-size: 0.85rem;">
                                    <c:if test="${not empty orders.orderDate}">
                                        <li class="mb-2 pb-2 border-bottom border-secondary">
                                            <div class="text-muted small"><fmt:formatDate value="${orders.orderDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></div>
                                            <div class="fw-bold">🆕 Đã đặt đơn</div>
                                        </li>
                                    </c:if>
                                    <c:if test="${not empty orders.pendingDate}">
                                        <li class="mb-2 pb-2 border-bottom border-secondary">
                                            <div class="text-muted small"><fmt:formatDate value="${orders.pendingDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></div>
                                            <div class="fw-bold text-warning">🕒 Chờ xác nhận</div>
                                        </li>
                                    </c:if>
                                    <c:if test="${not empty orders.shippingDate}">
                                        <li class="mb-2 pb-2 border-bottom border-secondary">
                                            <div class="text-muted small"><fmt:formatDate value="${orders.shippingDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></div>
                                            <div class="fw-bold text-info">🚚 Đang giao hàng</div>
                                        </li>
                                    </c:if>
                                    <c:if test="${not empty orders.completeDate}">
                                        <li class="mb-2 pb-2 border-bottom border-secondary">
                                            <div class="text-muted small"><fmt:formatDate value="${orders.completeDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></div>
                                            <div class="fw-bold text-success">✅ Hoàn thành</div>
                                        </li>
                                    </c:if>
                                    <c:if test="${not empty orders.cancelDate}">
                                        <li class="mb-0">
                                            <div class="text-muted small"><fmt:formatDate value="${orders.cancelDateAsDate}" pattern="dd/MM/yyyy HH:mm" /></div>
                                            <div class="fw-bold text-danger">❌ Đã hủy</div>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="detail-container">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 style="font-weight: 800; letter-spacing: -0.5px;">
                                <i class="fas fa-receipt text-purple me-2" style="color: var(--accent-purple);"></i>
                                Danh sách sản phẩm mua
                            </h3>
                            <a href="/admin/order/update/${orders.id}" class="btn btn-warning btn-sm fw-bold">
                                <i class="fas fa-pen me-1"></i> Sửa đơn hàng
                            </a>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width: 120px;">Sản phẩm</th>
                                        <th>Tên máy</th>
                                        <th>Đơn giá</th>
                                        <th>Số lượng</th>
                                        <th class="text-end">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderDetail}">
                                        <tr>
                                            <td>
                                                <img class="product-img-circle" 
                                                     src="/images/product/${order.product.image}" 
                                                     alt="Product image">
                                            </td>
                                            <td>
                                                <a href="/product/${order.product.id}" target="_blank" class="product-link">
                                                    ${order.product.name}
                                                </a>
                                                <div class="small text-muted mt-1">Hãng: ${order.product.factory}</div>
                                            </td>
                                            <td>
                                                <span class="price-text">
                                                    <fmt:formatNumber type="number" value="${order.product.price}" /> đ
                                                </span>
                                            </td>
                                            <td class="fw-bold">${order.quantity} chiếc</td>
                                            <td class="text-end">
                                                <span class="total-item-text">
                                                    <fmt:formatNumber type="number" value="${order.quantity * order.price}" /> đ
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="text-start">
                            <a href="/admin/order" class="btn-back-modern">
                                <i class="fas fa-arrow-left me-2"></i> Quay lại quản lý đơn
                            </a>
                        </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>
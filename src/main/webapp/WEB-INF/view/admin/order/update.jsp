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
    <title>Update Order - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

    <style>
        :root {
            --bg-light: #f8fafc;
            --card-bg: #ffffff;
            --accent-blue: #0d6efd;
            --border-color: #e2e8f0;
            --text-dark: #334155;
            --text-muted: #64748b;
            --input-bg: #ffffff;
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
        .update-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            margin: 40px auto;
        }

        /* Summary Box */
        .order-summary-bar {
            background: #f8fafc;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            justify-content: space-around;
            margin-bottom: 30px;
            border: 1px solid var(--border-color);
        }

        .summary-item label {
            display: block;
            font-size: 0.7rem;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 1px;
            margin-bottom: 5px;
            font-weight: 700;
        }

        .summary-item span {
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--text-dark);
        }

        .price-highlight {
            color: var(--money-green) !important;
        }

        /* Form Inputs */
        .form-label {
            font-weight: 700;
            font-size: 0.8rem;
            color: var(--text-dark);
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control, .form-select {
            background-color: var(--input-bg) !important;
            border: 1px solid var(--border-color) !important;
            color: var(--text-dark) !important;
            border-radius: 10px !important;
            padding: 10px 15px !important;
            transition: all 0.2s ease;
        }

        .form-control:disabled {
            background-color: #f1f5f9 !important;
            color: var(--text-muted) !important;
        }

        .form-select:focus, .form-control:focus {
            border-color: var(--accent-blue) !important;
            box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1) !important;
            outline: none;
        }

        /* Custom Buttons */
        .btn-update-order {
            background: #ffc107;
            border: none;
            color: #000;
            font-weight: 700;
            padding: 12px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(255, 193, 7, 0.2);
            transition: 0.3s;
            width: 100%;
        }

        .btn-update-order:hover {
            background: #ffca2c;
            transform: translateY(-2px);
        }

        .btn-cancel {
            background: #f1f5f9;
            border: 1px solid var(--border-color);
            color: var(--text-dark);
            padding: 12px 30px;
            border-radius: 10px;
            transition: 0.3s;
            text-decoration: none;
            display: block;
            text-align: center;
            font-weight: 600;
        }

        .btn-cancel:hover {
            background: #e2e8f0;
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
                    <h1 class="mt-4">Order Management</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none" style="color: var(--text-muted);">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/order" class="text-decoration-none" style="color: var(--text-muted);">Orders</a></li>
                        <li class="breadcrumb-item active">Update Status</li>
                    </ol>

                    <div class="update-container">
                        <div class="d-flex align-items-center mb-4">
                            <div class="icon-box me-3" style="background: rgba(255, 202, 40, 0.1); padding: 12px; border-radius: 12px;">
                                <i class="fas fa-truck-ramp-box text-warning fa-xl"></i>
                            </div>
                            <h3 class="m-0" style="font-weight: 800; letter-spacing: -0.5px;">Update Order</h3>
                        </div>

                        <div class="order-summary-bar">
                            <div class="summary-item">
                                <label>Order ID</label>
                                <span>${newOrder.id}</span>
                            </div>
                             <div class="summary-item">
                                 <label>Method</label>
                                 <span class="badge ${newOrder.paymentMethod eq 'VIETQR' ? 'bg-info text-dark' : 'bg-light text-muted'}">
                                     ${newOrder.paymentMethod}
                                 </span>
                             </div>
                             <div class="summary-item">
                                 <label>Total Payment</label>
                                 <span class="price-highlight">
                                     <fmt:formatNumber type="number" value="${newOrder.totalPrice}" /> VNĐ
                                 </span>
                             </div>
                        </div>

                        <form:form action="/admin/order/update" method="post" modelAttribute="newOrder" class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label">Customer Name / Role</label>
                                <form:input type="text" class="form-control" path="user.role.name" disabled="true" />
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Receiver Name</label>
                                <form:input type="text" class="form-control" path="receiverName" />
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Phone Number</label>
                                <form:input type="text" class="form-control" path="receiverPhone" />
                            </div>

                            <div class="col-12">
                                <label class="form-label">Shipping Address</label>
                                <form:textarea class="form-control" path="receiverAddress" rows="2" />
                            </div>

                            <div class="col-md-6">
                                 <label class="form-label">Shipping Status</label>
                                 <form:select class="form-select" path="status">
                                     <form:option value="UNPAID">💳 Unpaid (UNPAID)</form:option>
                                     <form:option value="PENDING">🕒 Pending (PENDING)</form:option>
                                     <form:option value="SHIPPING">🚚 Shipping (SHIPPING)</form:option>
                                     <form:option value="COMPLETE">✅ Completed (COMPLETE)</form:option>
                                     <form:option value="CANCEL">❌ Canceled (CANCEL)</form:option>
                                 </form:select>
                             </div>

                             <div class="col-md-6">
                                 <label class="form-label">Payment Status</label>
                                 <form:select class="form-select" path="paymentStatus">
                                     <form:option value="PAYMENT_UNPAID">❌ Unpaid (UNPAID)</form:option>
                                     <form:option value="PAYMENT_PENDING">⏳ Pending Confirmation (PENDING)</form:option>
                                     <form:option value="PAYMENT_SUCCESS">✅ Paid (SUCCESS)</form:option>
                                 </form:select>
                             </div>

                            <form:input type="hidden" path="id" />

                            <div class="col-12 mt-5">
                                <div class="row g-3 d-flex justify-content-center align-items-center">
                                    <div class="col-sm-6 ">
                                        <a href="/admin/order" class="btn-cancel">Cancel</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-update-order">Update Order</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
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
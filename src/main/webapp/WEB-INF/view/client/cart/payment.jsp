<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>VietQR Payment - Laptopshop</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                <link href="/client/css/style.css" rel="stylesheet">
                <style>
                    .payment-card {
                        max-width: 500px;
                        margin: 50px auto;
                        border-radius: 20px;
                        overflow: hidden;
                        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                    }
                    .qr-container {
                        background: #f8f9fa;
                        padding: 30px;
                        text-align: center;
                    }
                    .qr-image {
                        max-width: 100%;
                        border-radius: 15px;
                        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
                    }
                    .btn-confirm {
                        background: #81c408;
                        color: white;
                        border: none;
                        padding: 12px 30px;
                        border-radius: 50px;
                        font-weight: bold;
                        transition: all 0.3s;
                    }
                    .btn-confirm:hover {
                        background: #6ba306;
                        transform: translateY(-2px);
                        color: white;
                    }
                </style>
            </head>

            <body class="bg-light">
                <jsp:include page="../layout/header.jsp" />

                <div class="container py-5">
                    <div class="payment-card bg-white">
                        <div class="p-4 text-center border-bottom">
                            <h4 class="fw-bold mb-0 text-primary">Pay via VietQR</h4>
                        </div>
                        
                        <div class="qr-container">
                            <p class="text-muted mb-4">Scan the QR code with your banking app to pay</p>
                            <!-- VietQR API URL -->
                            <img src="https://img.vietqr.io/image/BIDV-7290288010-compact2.png?amount=${order.totalPrice}&addInfo=LAPTOP${order.id}&accountName=CAO%20MINH%20NHAT" 
                                 class="qr-image mb-4" alt="VietQR Payment">
                            
                            <div class="alert alert-info text-start" style="font-size: 0.9rem;">
                                <div class="mb-2"><strong>Bank:</strong> BIDV (Bank for Investment and Development of Vietnam)</div>
                                <div class="mb-2"><strong>Account Holder:</strong> CAO MINH NHAT</div>
                                <div class="mb-2"><strong>Amount:</strong> <fmt:formatNumber value="${order.totalPrice}" type="number" /> VNĐ</div>
                                <div><strong>Reference:</strong> LAPTOP${order.id}</div>
                            </div>
                        </div>

                        <div class="p-4 text-center">
                            <form action="/confirm-payment" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="id" value="${order.id}" />
                                <button type="submit" class="btn-confirm w-100 mb-3">
                                    <i class="fas fa-check-circle me-2"></i>I have transferred successfully
                                </button>
                            </form>
                            <a href="/" class="text-muted" style="text-decoration: none; font-size: 0.85rem;">
                                <i class="fas fa-arrow-left me-1"></i> Back to Home
                            </a>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/js/main.js"></script>
            </body>

            </html>

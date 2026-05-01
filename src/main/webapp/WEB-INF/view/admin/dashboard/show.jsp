<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Phuc Viet - Dự án laptopshop" />
            <meta name="author" content="Phuc Viet IT" />
            <title>Dashboard - Phuc Viet IT</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                rel="stylesheet">
            <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />            <style>
                body {
                    font-family: 'Inter', sans-serif !important;
                    background-color: #f8fafc !important;
                }

                /* Tổng thể layout content */
                #layoutSidenav_content {
                    background-color: #f4f7f6;
                    background-image: none;
                }

                .container-fluid {
                    padding-top: 2rem !important;
                }

                h1.mt-4 {
                    color: #1e293b;
                    font-weight: 800;
                    letter-spacing: -0.5px;
                    margin-bottom: 0.5rem;
                }

                .breadcrumb {
                    background: #ffffff;
                    padding: 10px 20px;
                    border-radius: 10px;
                    border: 1px solid #e2e8f0;
                }

                .breadcrumb-item.active {
                    color: #0d6efd !important;
                    font-weight: 500;
                }

                /* Thẻ Card Thống Kê Modern Light */
                .stat-card {
                    border: 1px solid #e2e8f0 !important;
                    border-radius: 16px !important;
                    overflow: hidden;
                    transition: all 0.3s ease;
                    min-height: 160px;
                    display: flex;
                    flex-direction: column;
                    background: #ffffff !important;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                }

                .stat-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
                }

                .stat-card .card-body {
                    padding: 1.5rem;
                    flex-grow: 1;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                    position: relative;
                }

                .stat-card i.bg-icon {
                    position: absolute;
                    right: 20px;
                    top: 50%;
                    transform: translateY(-50%);
                    font-size: 3rem;
                    opacity: 0.2;
                }

                .stat-value {
                    font-size: 2.5rem;
                    font-weight: 800;
                    line-height: 1;
                    color: #1e293b;
                    margin-top: 10px;
                }

                .stat-label {
                    font-size: 0.85rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    font-weight: 700;
                    color: #64748b;
                }

                /* Footer của Card */
                .stat-card .card-footer {
                    background: #f8fafc !important;
                    border-top: 1px solid #e2e8f0 !important;
                    padding: 0.8rem 1.5rem !important;
                }

                .stat-card .card-footer a {
                    font-weight: 600;
                    color: #0d6efd !important;
                    text-decoration: none;
                }

                /* Accent colors for icons and values */
                .card-user i.bg-icon { color: #3b82f6; opacity: 0.4; }
                .card-product i.bg-icon { color: #f43f5e; opacity: 0.4; }
                .card-order i.bg-icon { color: #10b981; opacity: 0.4; }

                .card-user { border-top: 4px solid #3b82f6 !important; }
                .card-product { border-top: 4px solid #f43f5e !important; }
                .card-order { border-top: 4px solid #10b981 !important; }

                @keyframes slideUpFade {
                    from { opacity: 0; transform: translateY(20px); }
                    to { opacity: 1; transform: translateY(0); }
                }

                .animate-in {
                    animation: slideUpFade 0.5s ease forwards;
                }

                .delay-1 {
                    animation-delay: 0.1s;
                }

                .delay-2 {
                    animation-delay: 0.2s;
                }

                .delay-3 {
                    animation-delay: 0.3s;
                }
            </style>
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4 animate-in">Dashboard Overview</h1>
                            <ol class="breadcrumb mb-4 animate-in">
                                <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                        style="color: #aaa;">Admin</a></li>
                                <li class="breadcrumb-item active">Thống kê hệ thống</li>
                            </ol>

                            <div class="row mt-5">
                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-user text-white animate-in delay-1">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Tổng người dùng</div>
                                                <div class="stat-value">${countUser}</div>
                                            </div>
                                            <i class="fas fa-users bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/user">
                                                Xem chi tiết
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-product text-white animate-in delay-2">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Sản phẩm hiện có</div>
                                                <div class="stat-value">${countProduct}</div>
                                            </div>
                                            <i class="fas fa-box-open bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/product">
                                                Quản lý kho
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-md-6 mb-4">
                                    <div class="card stat-card card-order text-white animate-in delay-3">
                                        <div class="card-body">
                                            <div style="position: relative; z-index: 2;">
                                                <div class="stat-label">Đơn hàng mới</div>
                                                <div class="stat-value">${countOrder}</div>
                                            </div>
                                            <i class="fas fa-shopping-cart bg-icon"></i>
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link text-decoration-none"
                                                href="/admin/order">
                                                Kiểm tra đơn
                                            </a>
                                            <div class="small text-white"><i class="fas fa-chevron-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>

        </html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Product Detail - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
            --success-green: #10b981;
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
        .showcase-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        /* Image Section */
        .product-image-box {
            background: #f8fafc;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 20px;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 400px;
        }

        .product-image-box img {
            max-width: 100%;
            height: auto;
            object-fit: contain;
            filter: drop-shadow(0 10px 15px rgba(0,0,0,0.1));
            transition: transform 0.5s ease;
        }

        .product-image-box:hover img {
            transform: scale(1.05);
        }

        /* Info Section */
        .product-title {
            font-size: 2.5rem;
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 10px;
            color: var(--text-dark);
        }

        .price-tag {
            font-size: 2rem;
            font-weight: 700;
            color: var(--success-green);
            margin-bottom: 25px;
            display: block;
        }

        /* Specs Grid */
        .specs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-top: 30px;
        }

        .spec-item {
            background: #f8fafc;
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 12px;
            transition: 0.3s;
        }

        .spec-item:hover {
            border-color: var(--accent-blue);
        }

        .spec-label {
            display: block;
            font-size: 0.75rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 5px;
            font-weight: 700;
        }

        .spec-value {
            font-weight: 600;
            font-size: 1rem;
            color: var(--text-dark);
        }

        /* Description Box */
        .desc-box {
            margin-top: 30px;
            padding: 20px;
            background: #f8fafc;
            border-radius: 12px;
            border-left: 4px solid var(--accent-blue);
        }

        /* Action Buttons */
        .btn-back {
            background: #f1f5f9;
            border: 1px solid var(--border-color);
            color: var(--text-dark);
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            transition: 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .btn-back:hover {
            background: #e2e8f0;
            transform: translateX(-5px);
        }

        .badge-id {
            background: var(--accent-blue);
            color: #fff;
            font-size: 0.8rem;
            padding: 5px 12px;
            border-radius: 20px;
            vertical-align: middle;
            margin-left: 10px;
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
                    <h1 class="mt-4">Chi tiết sản phẩm</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/admin/product">Sản phẩm</a></li>
                        <li class="breadcrumb-item active">Thông tin chi tiết</li>
                    </ol>

                    <div class="showcase-container">
                        <div class="row g-5">
                            <div class="col-lg-5">
                                <div class="product-image-box">
                                    <img src="/images/product/${product.image}" alt="${product.name}">
                                </div>
                            </div>

                            <div class="col-lg-7">
                                <div class="d-flex align-items-center mb-2">
                                    <span class="text-muted">Mã sản phẩm:</span>
                                    <span class="badge-id">${product.id}</span>
                                </div>
                                <h2 class="product-title">${product.name}</h2>
                                
                                <span class="price-tag">
                                    <fmt:formatNumber value="${product.price}" type="number" /> VNĐ
                                </span>

                                <div class="desc-box">
                                    <label class="spec-label">Mô tả ngắn gọn</label>
                                    <p class="mb-0 text-white-50">${product.shortDesc}</p>
                                </div>

                                <div class="specs-grid">
                                    <div class="spec-item">
                                        <span class="spec-label"><i class="fas fa-industry me-2"></i>Hãng sản xuất</span>
                                        <span class="spec-value">${product.factory}</span>
                                    </div>
                                    <div class="spec-item">
                                        <span class="spec-label"><i class="fas fa-bullseye me-2"></i>Phân khúc</span>
                                        <span class="spec-value">${product.target}</span>
                                    </div>
                                    <div class="spec-item">
                                        <span class="spec-label"><i class="fas fa-cubes me-2"></i>Số lượng kho</span>
                                        <span class="spec-value ${product.quantity > 0 ? 'text-success' : 'text-danger'}">
                                            ${product.quantity} máy
                                        </span>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <label class="spec-label">Thông số chi tiết</label>
                                    <p class="mt-2" style="line-height: 1.8; color: #cbd5e1;">
                                        ${product.detailDesc}
                                    </p>
                                </div>

                                <div class="mt-5 border-top pt-4" style="border-color: var(--border-glass) !important;">
                                    <div class="d-flex gap-3">
                                        <a href="/admin/product" class="btn-back">
                                            <i class="fas fa-arrow-left me-2"></i> Quay lại
                                        </a>
                                        <a href="/admin/product/update/${product.id}" class="btn btn-warning px-4 d-inline-flex align-items-center" style="border-radius: 12px; font-weight: 600;">
                                            <i class="fas fa-edit me-2"></i> Chỉnh sửa sản phẩm
                                        </a>
                                    </div>
                                </div>
                            </div>
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
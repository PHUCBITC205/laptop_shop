<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Manage Products - Phuc Viet IT</title>
    <link href="/css/styles.css" rel="stylesheet" />
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
        }

        body {
            font-family: 'Inter', sans-serif !important;
            background-color: var(--bg-light) !important;
            color: var(--text-dark);
        }

        #layoutSidenav_content {
            background-color: #f4f7f6;
        }

        /* Breadcrumb Style */
        .breadcrumb {
            background: var(--card-bg);
            padding: 12px 20px;
            border-radius: 10px;
            border: 1px solid var(--border-color);
        }

        .breadcrumb-item a {
            color: var(--text-muted);
            text-decoration: none;
        }

        .breadcrumb-item.active {
            color: var(--accent-blue) !important;
            font-weight: 600;
        }

        /* Table Card Container */
        .table-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        /* Custom Table Styling */
        .table {
            color: var(--text-dark) !important;
            vertical-align: middle;
        }

        .table thead th {
            background: #f8fafc;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 1px;
            font-weight: 700;
            padding: 15px;
            border-bottom: 2px solid var(--border-color) !important;
        }

        .table tbody tr {
            border-bottom: 1px solid var(--border-color);
            transition: 0.3s;
        }

        .table tbody tr:hover {
            background: #f1f5f9 !important;
        }

        .table td {
            padding: 15px;
        }

        /* Buttons & Actions */
        .btn-create {
            background: var(--accent-blue);
            border: none;
            padding: 10px 24px;
            border-radius: 10px;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(13, 110, 253, 0.2);
        }

        .btn-create:hover {
            background: #0b5ed7;
            transform: translateY(-2px);
        }

        .btn-action {
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            transition: 0.3s;
            margin: 0 2px;
        }

        /* Pagination */
        .pagination .page-item .page-link {
            background: #ffffff !important;
            border: 1px solid var(--border-color) !important;
            color: var(--text-muted) !important;
            border-radius: 8px !important;
            padding: 8px 16px;
            font-weight: 600;
        }

        .pagination .page-item.active .page-link {
            background: var(--accent-blue) !important;
            color: #fff !important;
            border-color: var(--accent-blue) !important;
        }

        /* Modal Light Style */
        .modal-content {
            background: #ffffff !important;
            border-radius: 20px !important;
            border: none !important;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .modal-header h5 {
            color: var(--text-dark) !important;
        }

        .modal-body p.text-white {
            color: var(--text-dark) !important;
        }

        .modal-footer .btn-secondary {
            background: #f1f5f9 !important;
            color: var(--text-dark) !important;
            border: 1px solid var(--border-color) !important;
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
                    <h1 class="mt-4">Quản lý sản phẩm</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                        <li class="breadcrumb-item active">Sản phẩm</li>
                    </ol>

                        <div class="table-container mb-4">
                            <div class="row g-3 align-items-center">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-color text-muted">
                                            <i class="fas fa-search"></i>
                                        </span>
                                        <input type="text" class="form-control" 
                                               id="adminNameSearch" placeholder="Tìm theo tên sản phẩm...">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select" id="adminFactoryFilter">
                                        <option value="">-- Tất cả hãng --</option>
                                        <option value="APPLE">Apple</option>
                                        <option value="ASUS">Asus</option>
                                        <option value="LENOVO">Lenovo</option>
                                        <option value="DELL">Dell</option>
                                        <option value="LG">LG</option>
                                        <option value="ACER">Acer</option>
                                    </select>
                                </div>
                                <div class="col-md-5 d-flex gap-2">
                                    <button class="btn btn-primary px-4 fw-bold" id="adminBtnFilter">
                                        Lọc dữ liệu
                                    </button>
                                    <button class="btn btn-outline-secondary" id="adminBtnRefresh" title="Làm mới">
                                        <i class="fas fa-sync-alt"></i>
                                    </button>
                                    <a href="/admin/product/create" class="btn btn-create ms-auto">
                                        <i class="fas fa-plus-circle me-2"></i>Thêm mới
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="table-container">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h3 class="m-0" style="font-weight: 700;">Danh sách Laptop</h3>
                            </div>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá thành</th>
                                        <th>Hãng sản xuất</th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" items="${products}">
                                        <tr>
                                            <td class="text-muted">${product.id}</td>
                                            <td class="fw-bold">${product.name}</td>
                                            <td>
                                                <span class="price-text">
                                                    <fmt:formatNumber value="${product.price}" type="number" /> đ
                                                </span>
                                            </td>
                                            <td><span class="factory-badge">${product.factory}</span></td>
                                            <td class="text-center">
                                                <a href="/admin/product/${product.id}" class="btn-action btn btn-outline-info" title="Xem">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                                <a href="/admin/product/update/${product.id}" class="btn-action btn btn-outline-warning" title="Sửa">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <button 
                                                    class="btn-action btn btn-outline-danger btn-delete-product" 
                                                    title="Xóa"
                                                    data-id="${product.id}"
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#deleteProductModal">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <nav aria-label="Page navigation" class="mt-4">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${1 eq currentPage ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/product?page=${currentPage - 1}${queryString}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                    <li class="page-item ${(loop.index + 1) eq currentPage ? 'active' : ''}">
                                        <a class="page-link" href="/admin/product?page=${loop.index + 1}${queryString}">
                                            ${loop.index + 1}
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${totalPages eq currentPage ? 'disabled' : ''}">
                                    <a class="page-link" href="/admin/product?page=${currentPage + 1}${queryString}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="/js/scripts.js"></script>

    <div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-0 pt-4 px-4">
                    <h5 class="modal-title fw-bold" id="deleteModalLabel">Xác nhận xóa sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body px-4 py-3">
                    <div class="text-center mb-4">
                        <div class="d-inline-flex align-items-center justify-content-center bg-danger bg-opacity-10 rounded-circle mb-3" style="width: 80px; height: 80px;">
                            <i class="fas fa-laptop-code text-danger fs-1"></i>
                        </div>
                        <p class="mb-1 fw-bold fs-5">Bạn có chắc chắn muốn xóa sản phẩm này?</p>
                        <p class="text-muted">Mã sản phẩm: <span id="displayProductId" class="badge bg-secondary"></span>. Hành động này không thể hoàn tác.</p>
                    </div>
                </div>
                <div class="modal-footer border-0 pb-4 px-4 gap-2">
                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Hủy bỏ</button>
                    <form action="/admin/product/delete" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="id" id="inputProductId" />
                        <button type="submit" class="btn btn-danger rounded-pill px-4 shadow-sm">XÁC NHẬN XÓA</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Xử lý Modal xóa sản phẩm
            $('.btn-delete-product').click(function() {
                const productId = $(this).data('id');
                $('#displayProductId').text(productId);
                $('#inputProductId').val(productId);
            });

            // Lấy tham số từ URL để đổ lại vào các ô filter
            const params = new URLSearchParams(window.location.search);
            if (params.has('name')) $('#adminNameSearch').val(params.get('name'));
            if (params.has('factory')) $('#adminFactoryFilter').val(params.get('factory'));

            // Xử lý nút Lọc
            $('#adminBtnFilter').click(function () {
                const name = $('#adminNameSearch').val();
                const factory = $('#adminFactoryFilter').val();
                
                const currentUrl = new URL(window.location.href);
                const searchParams = currentUrl.searchParams;

                searchParams.set('page', '1');
                
                if (name && name.trim() !== '') {
                    searchParams.set('name', name.trim());
                } else {
                    searchParams.delete('name');
                }

                if (factory && factory !== '') {
                    searchParams.set('factory', factory);
                } else {
                    searchParams.delete('factory');
                }

                window.location.href = currentUrl.toString();
            });

            // Xử lý nút Refresh
            $('#adminBtnRefresh').click(function () {
                window.location.href = '/admin/product';
            });

            // Nhấn Enter trong ô tìm kiếm
            $('#adminNameSearch').keypress(function (e) {
                if (e.which == 13) {
                    $('#adminBtnFilter').click();
                }
            });
        });
    </script>
</body>

</html>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Phuc Viet IT - Dự án laptopshop" />
                <meta name="author" content="Phuc Viet IT" />
                <title>Users Management - Phuc Viet IT</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <link rel="shortcut icon" href="https://scontent.fvii2-1.fna.fbcdn.net/..." type="image/x-icon">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
                    rel="stylesheet">
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
                        transition: 0.3s;
                    }

                    .breadcrumb-item a:hover {
                        color: var(--accent-blue);
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
                        transition: 0.3s;
                        border-bottom: 1px solid var(--border-color);
                    }

                    .table tbody tr:hover {
                        background: #f1f5f9 !important;
                    }

                    .table td {
                        padding: 15px;
                    }

                    /* Status Badge for Roles */
                    .role-badge {
                        background: #e0f2fe;
                        color: #0369a1;
                        padding: 4px 12px;
                        border-radius: 20px;
                        font-size: 0.8rem;
                        font-weight: 600;
                    }

                    /* Modern Buttons */
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

                    /* Pagination Styling */
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
                                <h1 class="mt-4">User Management</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>

                                <div class="table-container">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h3 class="m-0" style="font-weight: 700; color: var(--text-dark);">User List</h3>
                                        <a href="/admin/user/create" class="btn btn-primary btn-create">
                                            <i class="fas fa-user-plus me-2"></i>Add User
                                        </a>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Basic Info</th>
                                                    <th>Full Name</th>
                                                    <th>Role</th>
                                                    <th class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${user1}">
                                                    <tr>
                                                        <td class="fw-bold" style="color: var(--text-muted);">${user.id}
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="avatar-circle me-3"
                                                                    style="width: 40px; height: 40px; background: #f8fafc; border-radius: 50%; display: flex; align-items: center; justify-content: center; border: 1px solid var(--border-color);">
                                                                    <i class="fas fa-envelope text-muted"
                                                                        style="font-size: 0.9rem;"></i>
                                                                </div>
                                                                <span>${user.email}</span>
                                                            </div>
                                                        </td>
                                                        <td>${user.fullName}</td>
                                                        <td><span class="role-badge">${user.role.name}</span></td>
                                                        <td class="text-center">
                                                            <a href="/admin/user/${user.id}"
                                                                class="btn btn-action btn-outline-info" title="View">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-action btn-outline-warning" title="Edit">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <button 
                                                                class="btn btn-action btn-outline-danger btn-delete-user" 
                                                                title="Delete"
                                                                data-id="${user.id}"
                                                                data-bs-toggle="modal" 
                                                                data-bs-target="#deleteUserModal">
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
                                            <li class="page-item ${currentUser == 1 ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/user?page=${currentUser - 1}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
                                                </a>
                                            </li>

                                            <c:forEach begin="0" end="${totalUser - 1}" varStatus="loop">
                                                <li
                                                    class="page-item ${(loop.index + 1) eq currentUser ? 'active' : ''}">
                                                    <a class="page-link" href="/admin/user?page=${loop.index + 1}">
                                                        ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                            <li class="page-item ${currentUser == totalUser ? 'disabled' : ''}">
                                                <a class="page-link" href="/admin/user?page=${currentUser + 1}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
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
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="/js/scripts.js"></script>

                <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header border-0 pt-4 px-4">
                                <h5 class="modal-title fw-bold" id="deleteModalLabel">Confirm User Deletion</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body px-4 py-3">
                                <div class="text-center mb-4">
                                    <div class="d-inline-flex align-items-center justify-content-center bg-danger bg-opacity-10 rounded-circle mb-3" style="width: 80px; height: 80px;">
                                        <i class="fas fa-exclamation-triangle text-danger fs-1"></i>
                                    </div>
                                    <p class="mb-1 fw-bold fs-5">Confirm User Deactivation</p>
                                    <p class="text-muted">This action will deactivate the account with ID <span id="displayUserId" class="badge bg-secondary"></span>. They will no longer be able to log in.</p>
                                </div>
                            </div>
                            <div class="modal-footer border-0 pb-4 px-4 gap-2">
                                <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
                                <form action="/admin/user/delete" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="id" id="inputUserId" />
                                    <button type="submit" class="btn btn-danger rounded-pill px-4 shadow-sm">CONFIRM DELETE</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    $(document).ready(function() {
                        $('.btn-delete-user').click(function() {
                            const userId = $(this).data('id');
                            $('#displayUserId').text(userId);
                            $('#inputUserId').val(userId);
                        });
                    });
                </script>
            </body>

            </html>
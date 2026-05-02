<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Profile - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
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
                        --input-bg: #ffffff;
                    }

                    body {
                        font-family: 'Inter', sans-serif !important;
                        background-color: var(--bg-light) !important;
                        color: var(--text-dark);
                    }

                    #layoutSidenav_content {
                        background-color: #f4f7f6;
                    }

                    .profile-card {
                        background: var(--card-bg);
                        border: 1px solid var(--border-color);
                        border-radius: 16px;
                        padding: 40px;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                        animation: fadeInUp 0.6s ease-out;
                    }

                    @keyframes fadeInUp {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }

                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }

                    .form-control {
                        background: var(--input-bg) !important;
                        border: 1px solid var(--border-color) !important;
                        color: var(--text-dark) !important;
                        padding: 12px 20px;
                        border-radius: 10px;
                    }

                    .form-control:focus {
                        border-color: var(--accent-blue) !important;
                        box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1) !important;
                    }

                    .form-control:disabled,
                    .form-control[readonly] {
                        background: #f1f5f9 !important;
                        opacity: 0.7;
                    }

                    .form-label {
                        font-weight: 700;
                        color: var(--text-dark);
                        margin-bottom: 8px;
                        font-size: 0.8rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .avatar-preview {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        object-fit: cover;
                        border: 4px solid #fff;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                        padding: 2px;
                        background: #f1f5f9;
                    }

                    /* Buttons */
                    .btn-primary {
                        background: var(--accent-blue) !important;
                        border: none !important;
                        padding: 12px 30px !important;
                        border-radius: 10px !important;
                        font-weight: 600 !important;
                        transition: all 0.3s ease !important;
                    }

                    .btn-primary:hover {
                        background: #0b5ed7 !important;
                        transform: translateY(-2px);
                        box-shadow: 0 4px 10px rgba(13, 110, 253, 0.2) !important;
                    }

                    .btn-secondary {
                        background: #f1f5f9 !important;
                        border: 1px solid var(--border-color) !important;
                        color: var(--text-dark) !important;
                        padding: 12px 30px !important;
                        border-radius: 10px !important;
                        transition: all 0.3s ease !important;
                    }

                    .btn-secondary:hover {
                        background: #e2e8f0 !important;
                        transform: translateY(-2px);
                    }
                    
                    .btn-outline-light {
                        border-color: var(--border-color) !important;
                        color: var(--text-dark) !important;
                    }
                    
                    .btn-outline-light:hover {
                        background: #f1f5f9 !important;
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
                                <h1 class="mt-4">Personal Profile</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                            style="color: var(--text-muted);">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ol>

                                <div class="row justify-content-center">
                                    <div class="col-lg-8">
                                        <div class="profile-card mb-5">
                                            <c:if test="${not empty success}">
                                                <div
                                                    class="alert alert-success border-0 bg-success bg-opacity-25 text-white mb-4">
                                                    ${success}</div>
                                            </c:if>
                                            <form:form method="post" action="/admin/profile" modelAttribute="newUser"
                                                enctype="multipart/form-data">
                                                <form:hidden path="id" />

                                                <div class="text-center mb-5">
                                                    <img src="/images/avatar/${newUser.avatar}" alt="Avatar"
                                                        class="avatar-preview mb-3"
                                                        onerror="this.src='/images/avatar/default.png'"
                                                        id="avatarPreview">
                                                    <div class="mt-3">
                                                        <label for="avatarFile" class="btn btn-outline-light btn-sm">
                                                            <i class="fas fa-camera me-2"></i>Change Avatar
                                                        </label>
                                                        <input type="file" id="avatarFile" name="phucvietFile"
                                                            class="d-none" accept="image/*"
                                                            onchange="previewImage(this)">
                                                    </div>
                                                </div>

                                                <div class="row g-4">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email</label>
                                                        <form:input path="email" type="email" class="form-control"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Role</label>
                                                        <input type="text" class="form-control"
                                                            value="${newUser.role.name}" disabled />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="form-label">Full Name</label>
                                                        <form:input path="fullName" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Phone Number</label>
                                                        <form:input path="phone" type="text" class="form-control" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Address</label>
                                                        <form:input path="address" type="text" class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="d-flex justify-content-around align-items-center mt-5">
                                                    <a href="/admin" class="btn btn-secondary me-2">
                                                        <i class="fas fa-times me-2"></i>Cancel
                                                    </a>
                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="fas fa-save me-2"></i>Save Changes
                                                    </button>
                                                </div>
                                            </form:form>
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
                <script src="/js/scripts.js"></script>
                <script>
                    function previewImage(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                document.getElementById('avatarPreview').src = e.target.result;
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>
            </body>

            </html>
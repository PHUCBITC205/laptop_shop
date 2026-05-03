<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Create User - Phuc Viet IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

                    /* Container Style */
                    .create-form-container {
                        background: var(--card-bg);
                        border: 1px solid var(--border-color);
                        border-radius: 16px;
                        padding: 40px;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                        margin-bottom: 50px;
                    }

                    /* Form Styling */
                    .form-label {
                        font-weight: 700;
                        font-size: 0.8rem;
                        color: var(--text-dark);
                        margin-bottom: 8px;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .form-control,
                    .form-select {
                        background-color: var(--input-bg) !important;
                        border: 1px solid var(--border-color) !important;
                        color: var(--text-dark) !important;
                        border-radius: 10px !important;
                        padding: 10px 15px !important;
                        transition: all 0.2s ease !important;
                    }

                    .form-control:focus,
                    .form-select:focus {
                        border-color: var(--accent-blue) !important;
                        box-shadow: 0 0 0 4px rgba(13, 110, 253, 0.1) !important;
                    }

                    .invalid-feedback {
                        font-size: 0.8rem;
                        color: #dc3545;
                        margin-top: 5px;
                    }

                    /* Avatar Section */
                    .avatar-preview-box {
                        border: 2px dashed var(--border-color);
                        border-radius: 16px;
                        padding: 20px;
                        text-align: center;
                        background: #f8fafc;
                        transition: 0.3s;
                    }

                    #avatarPreview {
                        width: 130px;
                        height: 130px;
                        object-fit: cover;
                        border-radius: 50%;
                        border: 4px solid #fff;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                        margin-bottom: 15px;
                    }

                    /* Create Button */
                    .btn-create-submit {
                        background: var(--accent-blue);
                        border: none;
                        color: #fff;
                        font-weight: 700;
                        padding: 12px 30px;
                        border-radius: 10px;
                        box-shadow: 0 4px 10px rgba(13, 110, 253, 0.2);
                        transition: 0.3s;
                    }

                    .btn-create-submit:hover {
                        background: #0b5ed7;
                        transform: translateY(-2px);
                    }
                </style>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            if (e.target.files && e.target.files[0]) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL).fadeIn();
                                $("#avatarPreview").css({ "display": "inline-block" });
                            }
                        });
                    });
                </script>
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
                                    <li class="breadcrumb-item active">Add New User</li>
                                </ol>

                                <div class="row justify-content-center">
                                    <div class="col-xl-10">
                                        <div class="create-form-container">
                                            <div class="d-flex align-items-center mb-4 border-bottom pb-3"
                                                style="border-color: var(--border-glass) !important;">
                                                <div class="icon-box me-3"
                                                    style="background: rgba(124, 77, 255, 0.1); padding: 12px; border-radius: 12px;">
                                                    <i class="fas fa-user-plus text-purple fa-xl"
                                                        style="color: var(--accent-purple);"></i>
                                                </div>
                                                <h3 class="m-0" style="font-weight: 800;">Create New Account</h3>
                                            </div>

                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" class="row g-4" enctype="multipart/form-data">
                                                <div class="col-md-6">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Email Address</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                        path="email" placeholder="example@gmail.com" />
                                                    ${errorEmail}
                                                </div>

                                                <div class="col-md-6">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Password</label>
                                                    <form:input type="password"
                                                        class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                        path="password" placeholder="••••••••" />
                                                    ${errorPassword}
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label">Phone Number</label>
                                                    <form:input type="text" class="form-control" path="phone"
                                                        placeholder="0xxx xxx xxx" />
                                                </div>

                                                <div class="col-md-6">
                                                    <c:set var="errorFullName">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <label class="form-label">Full Name</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                        path="fullName" placeholder="Enter full name" />
                                                    ${errorFullName}
                                                </div>

                                                <div class="col-md-8">
                                                    <label class="form-label">Address</label>
                                                    <form:input type="text" class="form-control" path="address"
                                                        placeholder="Home address" />
                                                </div>

                                                <div class="col-md-4">
                                                    <label class="form-label">System Role</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">ADMIN (Administrator)</form:option>
                                                        <form:option value="USER">USER (Customer)</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="col-12 mt-4">
                                                    <div class="avatar-preview-box">
                                                        <div class="row align-items-center">
                                                            <div class="col-md-4">
                                                                <img id="avatarPreview"
                                                                    src="/images/avatar/default-avatar.png"
                                                                    alt="preview" style="display: none;" />
                                                                <div id="placeholder" class="mb-2"
                                                                    style="font-size: 3rem; color: var(--border-glass);">
                                                                    <i class="fas fa-image"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8 text-md-start">
                                                                <label for="avatarFile" class="form-label">Upload Profile Picture</label>
                                                                <input class="form-control" type="file" id="avatarFile"
                                                                    accept=".png, .jpg, .jpeg" name="phucvietFile" />
                                                                <p class="small text-muted mt-2">Max size 2MB.
                                                                    Supports JPG, PNG.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12 mt-5 text-center">
                                                    <hr style="border-color: var(--border-glass) !important;">
                                                    <div class="d-flex gap-3 justify-content-around flex-wrap">
                                                        <a href="/admin/user"
                                                            class="btn btn-outline-secondary px-3 py-2 w-auto">
                                                            Cancel
                                                        </a>

                                                        <button type="submit"
                                                            class="btn btn-create-submit px-3 py-2 w-auto">
                                                            Create
                                                        </button>
                                                    </div>

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
            </body>

            </html>
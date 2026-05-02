<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Create Product - Phuc Viet IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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

                        /* Form Container */
                        .form-container {
                            background: var(--card-bg);
                            border: 1px solid var(--border-color);
                            border-radius: 16px;
                            padding: 40px;
                            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                            margin-bottom: 50px;
                        }

                        /* Input Styling */
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

                        /* Image Preview Box */
                        .image-preview-wrapper {
                            border: 2px dashed var(--border-color);
                            border-radius: 16px;
                            padding: 20px;
                            background: #f8fafc;
                            text-align: center;
                            transition: 0.3s;
                        }

                        #avatarPreview {
                            max-width: 100%;
                            max-height: 250px;
                            border-radius: 12px;
                            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                            display: none;
                            margin: 0 auto;
                        }

                        /* Custom Button */
                        .btn-submit {
                            background: var(--accent-blue);
                            border: none;
                            color: #fff;
                            font-weight: 700;
                            padding: 12px 30px;
                            border-radius: 10px;
                            box-shadow: 0 4px 10px rgba(13, 110, 253, 0.2);
                            transition: 0.3s;
                        }

                        .btn-submit:hover {
                            background: #0b5ed7;
                            transform: translateY(-2px);
                        }
                        
                        .text-purple {
                            color: var(--accent-blue) !important;
                            font-weight: 700;
                        }

                        .btn-cancel {
                            background: #fff;
                            border: 1px solid #e2e8f0;
                            color: #64748b;
                            padding: 12px 30px;
                            border-radius: 12px;
                            font-weight: 600;
                            transition: 0.3s;
                            text-decoration: none;
                            display: inline-block;
                        }

                        .btn-cancel:hover {
                            background: #f1f5f9;
                            color: var(--accent-blue) !important;
                            border-color: var(--accent-blue);
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
                                    <h1 class="mt-4">Product Management</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Add New Product</li>
                                    </ol>

                                    <div class="row justify-content-center">
                                        <div class="col-xl-11">
                                            <div class="form-container">
                                                <div class="d-flex align-items-center mb-4 border-bottom pb-3"
                                                    style="border-color: var(--border-glass) !important;">
                                                    <div class="icon-box me-3"
                                                        style="background: rgba(124, 77, 255, 0.1); padding: 12px; border-radius: 12px;">
                                                        <i class="fas fa-box-open text-purple fa-xl"
                                                            style="color: var(--accent-purple);"></i>
                                                    </div>
                                                    <h3 class="m-0" style="font-weight: 800;">New Product Information</h3>
                                                </div>

                                                <form:form method="post" action="/admin/product/create"
                                                    modelAttribute="newProduct" class="row g-4"
                                                    enctype="multipart/form-data">

                                                    <div class="col-lg-8">
                                                        <div class="row g-3">
                                                            <div class="col-md-8">
                                                                <label class="form-label">Product Name</label>
                                                                <spring:bind path="name">
                                                                    <form:input type="text"
                                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                        path="name"
                                                                        placeholder="Ex: MacBook Pro M3 2024" />
                                                                    <form:errors path="name"
                                                                        cssClass="invalid-feedback" />
                                                                </spring:bind>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label class="form-label">Price (VNĐ)</label>
                                                                <spring:bind path="price">
                                                                    <form:input type="number"
                                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                        path="price" />
                                                                    <form:errors path="price"
                                                                        cssClass="invalid-feedback" />
                                                                </spring:bind>
                                                            </div>

                                                            <div class="col-12">
                                                                <label class="form-label">Detailed Description</label>
                                                                <spring:bind path="detailDesc">
                                                                    <form:textarea rows="4"
                                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                        path="detailDesc"
                                                                        placeholder="Outstanding features" />
                                                                    <form:errors path="detailDesc"
                                                                        cssClass="invalid-feedback" />
                                                                </spring:bind>
                                                            </div>

                                                            <div class="col-12">
                                                                <label class="form-label">Short Description</label>
                                                                <spring:bind path="shortDesc">
                                                                    <form:input type="text"
                                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                        path="shortDesc"
                                                                        placeholder="Enter detailed specs (CPU, RAM, SSD...)" />
                                                                    <form:errors path="shortDesc"
                                                                        cssClass="invalid-feedback" />
                                                                </spring:bind>
                                                            </div>

                                                            <!-- Technical Specs Section -->
                                                            <div class="col-12 mt-4 mb-2">
                                                                <h5 class="text-purple" style="color: var(--accent-purple);">Technical Specifications</h5>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <label class="form-label">CPU</label>
                                                                <form:input type="text" class="form-control" path="cpu" placeholder="Ex: Intel Core i7-13700H" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">RAM</label>
                                                                <form:input type="text" class="form-control" path="ram" placeholder="Ex: 16GB DDR5 5200MHz" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">Storage</label>
                                                                <form:input type="text" class="form-control" path="storage" placeholder="Ex: 512GB SSD NVMe" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">GPU</label>
                                                                <form:input type="text" class="form-control" path="gpu" placeholder="Ex: NVIDIA RTX 4060 8GB" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">Display</label>
                                                                <form:input type="text" class="form-control" path="screen" placeholder="Ex: 15.6 inch QHD 165Hz" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">Battery</label>
                                                                <form:input type="text" class="form-control" path="battery" placeholder="Ex: 4-cell, 90Wh" />
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="form-label">Weight</label>
                                                                <form:input type="text" class="form-control" path="weight" placeholder="Ex: 2.1 kg" />
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label class="form-label">Stock Quantity</label>
                                                                <spring:bind path="quantity">
                                                                    <form:input type="number"
                                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                        path="quantity" />
                                                                    <form:errors path="quantity"
                                                                        cssClass="invalid-feedback" />
                                                                </spring:bind>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label class="form-label">Manufacturer</label>
                                                                <form:select class="form-select" path="factory">
                                                                    <form:option value="APPLE">Apple (Macbook)</form:option>
                                                                    <form:option value="ASUS">Asus</form:option>
                                                                    <form:option value="LENOVO">Lenovo</form:option>
                                                                    <form:option value="DELL">Dell</form:option>
                                                                    <form:option value="LG">LG</form:option>
                                                                    <form:option value="ACER">Acer</form:option>
                                                                </form:select>
                                                            </div>

                                                            <div class="col-md-4">
                                                                <label class="form-label">Category (Target)</label>
                                                                <form:select class="form-select" path="target">
                                                                    <form:option value="GAMING">Gaming</form:option>
                                                                    <form:option value="STUDENT-OFFICE">Student - Office</form:option>
                                                                    <form:option value="GRAPHIC-DESIGN">Graphic Design</form:option>
                                                                    <form:option value="THIN-LIGHT">Thin & Light</form:option>
                                                                    <form:option value="BUSINESS">Business</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4">
                                                        <div
                                                            class="image-preview-wrapper h-100 d-flex flex-column justify-content-center">
                                                            <label class="form-label d-block mb-3">Product Image</label>
                                                            <div class="mb-3">
                                                                <img id="avatarPreview" src="#" alt="preview" />
                                                                <div id="imgPlaceholder" class="py-5"
                                                                    style="color: var(--border-glass); font-size: 4rem;">
                                                                    <i class="fas fa-cloud-upload-alt"></i>
                                                                </div>
                                                            </div>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" name="anhProduct" />
                                                            <p class="small text-muted mt-3">Use high-quality images for the best store display.</p>
                                                        </div>
                                                    </div>

                                                    <div class="col-12 mt-5 text-end border-top pt-4 d-flex justify-content-around align-items-center"
                                                        style="border-color: var(--border-glass) !important;">
                                                         <a href="/admin/product" class="btn-cancel me-3">Cancel</a>
                                                        <button type="submit" class="btn btn-submit">Confirm Add Product</button>
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
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <title>Update Product - Phuc Viet IT</title>
                        <link href="/css/styles.css" rel="stylesheet" />
                        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                            crossorigin="anonymous"></script>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

                            /* Form Container Style */
                            .update-form-container {
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
                                height: 100%;
                                display: flex;
                                flex-direction: column;
                                justify-content: center;
                            }

                            #avatarPreview {
                                max-width: 100%;
                                max-height: 280px;
                                border-radius: 12px;
                                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                                margin: 0 auto 15px;
                                border: 4px solid #fff;
                            }

                            /* Buttons */
                            .btn-update-now {
                                background: #ffc107;
                                border: none;
                                color: #000;
                                font-weight: 700;
                                padding: 12px 30px;
                                border-radius: 10px;
                                box-shadow: 0 4px 10px rgba(255, 193, 7, 0.2);
                                transition: 0.3s;
                            }

                            .btn-update-now:hover {
                                background: #ffca2c;
                                transform: translateY(-2px);
                            }
                            
                            .text-warning {
                                color: #ffc107 !important;
                                font-weight: 700;
                            }
                        </style>

                        <script>
                            $(document).ready(() => {
                                const avatarFile = $("#avatarFile");
                                const orgImage = "${newProduct.image}";
                                if (orgImage) {
                                    const urlImage = "/images/product/" + orgImage;
                                    $("#avatarPreview").attr("src", urlImage).show();
                                }

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
                                            <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                                            <li class="breadcrumb-item active">Update ${newProduct.id}</li>
                                        </ol>

                                        <div class="row justify-content-center">
                                            <div class="col-xl-11">
                                                <div class="update-form-container">
                                                    <div class="d-flex align-items-center mb-4 border-bottom pb-3"
                                                        style="border-color: var(--border-glass) !important;">
                                                        <div class="icon-box me-3"
                                                            style="background: rgba(255, 202, 40, 0.1); padding: 12px; border-radius: 12px;">
                                                            <i class="fas fa-edit text-warning fa-xl"></i>
                                                        </div>
                                                        <h3 class="m-0" style="font-weight: 800;">Edit Product Information</h3>
                                                    </div>

                                                    <form:form method="post" action="/admin/product/update"
                                                        modelAttribute="newProduct" class="row g-4"
                                                        enctype="multipart/form-data">
                                                        <form:input type="hidden" path="id" />
                                                        <form:input type="hidden" path="image" />

                                                        <div class="col-lg-7">
                                                            <div class="row g-3">
                                                                <div class="col-md-8">
                                                                    <label class="form-label">Product Name</label>
                                                                    <spring:bind path="name">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="name" />
                                                                        <form:errors path="name"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Product Price</label>
                                                                    <div class="input-group has-validation">
                                                                        <spring:bind path="price">
                                                                            <form:input type="text" id="priceInput"
                                                                                class="form-control price-field ${status.error ? 'is-invalid' : ''}"
                                                                                path="price" placeholder="0" />
                                                                            <span
                                                                                class="input-group-text currency-addon">VNĐ</span>
                                                                            <form:errors path="price"
                                                                                cssClass="invalid-feedback" />
                                                                        </spring:bind>
                                                                    </div>
                                                                </div>

                                                                <div class="col-12">
                                                                    <label class="form-label">Detailed Description</label>
                                                                    <spring:bind path="detailDesc">
                                                                        <form:textarea rows="5"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="detailDesc" />
                                                                        <form:errors path="detailDesc"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <div class="col-12">
                                                                    <label class="form-label">Short Description</label>
                                                                    <spring:bind path="shortDesc">
                                                                        <form:input type="text"
                                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                            path="shortDesc" />
                                                                        <form:errors path="shortDesc"
                                                                            cssClass="invalid-feedback" />
                                                                    </spring:bind>
                                                                </div>

                                                                <!-- Technical Specs Section -->
                                                                <div class="col-12 mt-4 mb-2">
                                                                    <h5 class="text-warning">Technical Specifications</h5>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <label class="form-label">CPU</label>
                                                                    <form:input type="text" class="form-control" path="cpu" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">RAM</label>
                                                                    <form:input type="text" class="form-control" path="ram" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Ổ cứng (Storage)</label>
                                                                    <form:input type="text" class="form-control" path="storage" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">GPU (Card đồ họa)</label>
                                                                    <form:input type="text" class="form-control" path="gpu" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Màn hình (Display)</label>
                                                                    <form:input type="text" class="form-control" path="screen" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Pin (Battery)</label>
                                                                    <form:input type="text" class="form-control" path="battery" />
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-label">Trọng lượng (Weight)</label>
                                                                    <form:input type="text" class="form-control" path="weight" />
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
                                                                    <label class="form-label">Brand</label>
                                                                    <form:select class="form-select" path="factory">
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="APPLE">Apple (MacBook)
                                                                        </form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="ASUS">Asus</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="LENOVO">Lenovo</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="DELL">Dell</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="LG">LG</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="ACER">Acer</form:option>
                                                                    </form:select>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label class="form-label">Segment</label>
                                                                    <form:select class="form-select" path="target">
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="GAMING">Gaming</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="SINHVIEN-VANPHONG">Student - Office</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="THIET-KE-DO-HOA">Graphic Design</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="MONG-NHE">Thin & Light</form:option>
                                                                        <form:option style="background-color:#2B2C39;"
                                                                            value="DOANH-NHAN">Business</form:option>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-5">
                                                            <div class="image-preview-wrapper">
                                                                <label class="form-label mb-3">Display Image</label>
                                                                <img id="avatarPreview" src="#" alt="product preview"
                                                                    style="display: none;" />
                                                                <div class="mt-2">
                                                                    <input class="form-control" type="file"
                                                                        id="avatarFile" accept=".png, .jpg, .jpeg"
                                                                        name="phucvietFile" />
                                                                    <p class="small text-muted mt-3">Select a new file if you want to change the current image.</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 mt-5 text-end border-top pt-4"
                                                            style="border-color: var(--border-glass) !important;">
                                                            <a href="/admin/product"
                                                                class="btn btn-outline-secondary me-3 px-4 py-2"
                                                                style="border-radius: 12px; color: #fff; border-color: var(--border-glass);">Cancel</a>
                                                            <button type="submit" class="btn btn-update-now">Save Changes</button>
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
                            $(document).ready(function () {
                                const priceInput = $('#priceInput');

                                // 1. Hàm chuyển đổi số (xử lý cả số khoa học E+)
                                function formatMoney(value) {
                                    if (!value) return "";
                                    // Chuyển từ E+ sang số thuần túy string
                                    let num = Number(value).toLocaleString('fullwide', { useGrouping: false });
                                    // Thêm dấu phẩy phân cách phần nghìn
                                    return num.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                }

                                // 2. Định dạng ngay khi vừa load trang (Xử lý lỗi 2.5E7)
                                let initialValue = priceInput.val();
                                if (initialValue) {
                                    priceInput.val(formatMoney(initialValue));
                                }

                                // 3. Sự kiện gõ phím: Tự thêm dấu phẩy khi người dùng nhập
                                priceInput.on('input', function () {
                                    let val = $(this).val().replace(/,/g, ''); // Xóa dấu phẩy cũ
                                    if (!isNaN(val) && val.length > 0) {
                                        $(this).val(formatMoney(val));
                                    }
                                });

                                // 4. QUAN TRỌNG: Trước khi lưu (submit), phải xóa dấu phẩy để Backend nhận kiểu Double/Long
                                $('form').on('submit', function () {
                                    let rawVal = priceInput.val().replace(/,/g, '');
                                    priceInput.val(rawVal);
                                });
                            });
                        </script>
                    </body>

                    </html>
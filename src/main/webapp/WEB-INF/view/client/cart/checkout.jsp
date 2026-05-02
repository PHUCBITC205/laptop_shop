<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> Checkout - Laptopshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />

</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner"
        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Cart Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="mb-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Checkout Information</li>
                    </ol>
                </nav>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Product</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${ empty cartDetails}">
                            <tr>
                                <td colspan="6">
                                    No products in cart
                                </td>
                            </tr>
                        </c:if>
                        <c:forEach var="cartDetail" items="${cartDetails}">

                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="/images/product/${cartDetail.product.image}"
                                            class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;"
                                            alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">
                                        <a href="/product/${cartDetail.product.id}" target="_blank">
                                            ${cartDetail.product.name}
                                        </a>
                                    </p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">
                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                    </p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <input type="text" class="form-control form-control-sm text-center border-0"
                                            value="${cartDetail.quantity}">
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                        <fmt:formatNumber type="number"
                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                    </p>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
            <c:if test="${not empty cartDetails}">
                <form:form action="/place-order" method="post" modelAttribute="cart" id="checkoutForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="mt-5 row g-4 justify-content-start">
                        <div class="col-12 col-md-6">
                            <div class="p-4 ">
                                <h5 class="mb-4" style="font-weight:700; color:#1e293b;">
                                    <i class="fas fa-map-marker-alt me-2" style="color:#22c55e;"></i>
                                    Shipping Information
                                </h5>
                                <div class="row g-3">
                                    <!-- Họ và tên -->
                                    <div class="col-12 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">Full Name <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" id="receiverName" name="receiverName"
                                            placeholder="Enter full name..." autocomplete="name" />
                                        <div class="invalid-feedback" id="nameError"></div>
                                        <div class="valid-feedback">Valid name ✓</div>
                                    </div>

                                    <!-- Tỉnh / Thành phố -->
                                    <div class="col-12 col-md-4 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">Province / City <span
                                                class="text-danger">*</span></label>
                                        <select class="form-select" id="provinceSelect">
                                            <option value="">-- Select Province --</option>
                                        </select>
                                    </div>

                                    <!-- Quận / Huyện -->
                                    <div class="col-12 col-md-4 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">District <span
                                                class="text-danger">*</span></label>
                                        <select class="form-select" id="districtSelect" disabled>
                                            <option value="">-- Select District --</option>
                                        </select>
                                    </div>

                                    <!-- Phường / Xã -->
                                    <div class="col-12 col-md-4 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">Ward / Commune <span
                                                class="text-danger">*</span></label>
                                        <select class="form-select" id="wardSelect" disabled>
                                            <option value="">-- Select Ward --</option>
                                        </select>
                                    </div>

                                    <!-- Số nhà / Đường -->
                                    <div class="col-12 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">Street Address <span
                                                class="text-danger">*</span></label>
                                        <input class="form-control" id="streetInput"
                                            placeholder="Ex: 123 Le Loi Street..." />
                                        <div class="invalid-feedback" id="addressError"></div>
                                    </div>

                                    <!-- Hidden field tổng hợp địa chỉ -->
                                    <input type="hidden" id="receiverAddress" name="receiverAddress" />

                                    <!-- Số điện thoại -->
                                    <div class="col-12 form-group">
                                        <label class="fw-semibold mb-1" style="color:#374151;">Phone Number <span
                                                class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <span class="input-group-text"
                                                style="background:#f8fafc; color:#374151; font-weight:600;">🇻🇳
                                                +84</span>
                                            <input class="form-control" id="receiverPhone" name="receiverPhone"
                                                type="tel" placeholder="Ex: 0901234567" maxlength="10"
                                                inputmode="numeric" />
                                        </div>
                                        <div id="phoneError" class="text-danger small mt-1" style="display:none;"></div>
                                        <div id="phoneOk" class="text-success small mt-1" style="display:none;"></div>
                                    </div>

                                    <div class="mt-2">
                                        <i class="fas fa-arrow-left"></i>
                                        <a href="/cart">Back to Cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="bg-light rounded">
                                <div class="p-4">
                                    <h1 class="display-6 mb-4">Payment <span class="fw-normal">Information</span>
                                    </h1>

                                    <div class="d-flex justify-content-between">
                                        <h5 class="mb-0 me-4">Shipping Fee</h5>
                                        <div class="">
                                            <p class="mb-0">0 đ</p>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h5 class="mb-3">Payment Method</h5>
                                        <div class="form-check mb-2">
                                            <input class="form-check-input" type="radio" name="paymentMethod"
                                                id="paymentCOD" value="COD" checked>
                                            <label class="form-check-label" for="paymentCOD">
                                                Cash on Delivery (COD)
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="paymentMethod"
                                                id="paymentQR" value="VIETQR">
                                            <label class="form-check-label" for="paymentQR">
                                                Bank Transfer via VietQR
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                    <h5 class="mb-0 ps-4 me-4">Total Amount</h5>
                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                    </p>
                                </div>

                                <button type="button" id="btnPlaceOrder"
                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                    Place Order
                                </button>

                            </div>
                        </div>
                    </div>
                </form:form>
            </c:if>

        </div>
    </div>
    <!-- Cart Page End -->


    <jsp:include page="../layout/header.jsp" />


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
            class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>

    <script>
        (function () {
            // ===== API ĐỊA CHỈ VIỆT NAM (ESGOO) =====
            const API_BASE = 'https://esgoo.net/api-tinhthanh';

            function toEnglishName(name) {
                if (!name) return name;
                let result = name;
                const mappings = [
                    { vn: 'Thành phố ', en: ' City' },
                    { vn: 'Tỉnh ', en: ' Province' },
                    { vn: 'Quận ', en: ' District' },
                    { vn: 'Huyện ', en: ' District' },
                    { vn: 'Thị xã ', en: ' Town' },
                    { vn: 'Thị trấn ', en: ' Town' },
                    { vn: 'Phường ', en: ' Ward' },
                    { vn: 'Xã ', en: ' Commune' }
                ];
                for (const m of mappings) {
                    if (result.startsWith(m.vn)) {
                        result = result.replace(m.vn, '') + m.en;
                        break;
                    }
                }
                return result;
            }

            function setLoading(el, loading) {
                el.disabled = loading;
                if (loading) el.innerHTML = '<option>Loading...</option>';
            }

            // Load tỉnh/thành
            fetch(API_BASE + '/1/0.htm')
                .then(r => r.json())
                .then(res => {
                    if (res.error === 0) {
                        const sel = document.getElementById('provinceSelect');
                        sel.innerHTML = '<option value="">-- Select Province --</option>';
                        res.data.forEach(p => sel.appendChild(new Option(toEnglishName(p.full_name), p.id)));
                    }
                }).catch(() => { });

            // Khi chọn tỉnh → load quận
            document.getElementById('provinceSelect').addEventListener('change', function () {
                const districtSel = document.getElementById('districtSelect');
                const wardSel = document.getElementById('wardSelect');
                wardSel.innerHTML = '<option value="">-- Select Ward --</option>';
                wardSel.disabled = true;
                if (!this.value) { districtSel.innerHTML = '<option value="">-- Select District --</option>'; districtSel.disabled = true; return; }
                
                setLoading(districtSel, true);
                fetch(API_BASE + '/2/' + this.value + '.htm')
                    .then(r => r.json())
                    .then(res => {
                        districtSel.innerHTML = '<option value="">-- Select District --</option>';
                        if (res.error === 0) {
                            res.data.forEach(d => districtSel.appendChild(new Option(toEnglishName(d.full_name), d.id)));
                            districtSel.disabled = false;
                        }
                    }).catch(() => { districtSel.disabled = false; });
            });

            // Khi chọn quận → load phường
            document.getElementById('districtSelect').addEventListener('change', function () {
                const wardSel = document.getElementById('wardSelect');
                if (!this.value) { wardSel.innerHTML = '<option value="">-- Select Ward --</option>'; wardSel.disabled = true; return; }
                
                setLoading(wardSel, true);
                fetch(API_BASE + '/3/' + this.value + '.htm')
                    .then(r => r.json())
                    .then(res => {
                        wardSel.innerHTML = '<option value="">-- Select Ward --</option>';
                        if (res.error === 0) {
                            res.data.forEach(w => wardSel.appendChild(new Option(toEnglishName(w.full_name), w.id)));
                            wardSel.disabled = false;
                        }
                    }).catch(() => { wardSel.disabled = false; });
            });

            // ===== VALIDATE SỐ ĐIỆN THOẠI (real-time) =====
            const phoneInput = document.getElementById('receiverPhone');
            const phoneError = document.getElementById('phoneError');
            const phoneOk = document.getElementById('phoneOk');
            const vnPhoneRegex = /^(0[35789])([0-9]{8})$/;

            phoneInput.addEventListener('input', function () {
                this.value = this.value.replace(/\D/g, '');
                const valid = vnPhoneRegex.test(this.value);
                if (this.value.length === 0) {
                    phoneError.style.display = 'none'; phoneOk.style.display = 'none';
                    this.classList.remove('is-valid', 'is-invalid');
                } else if (valid) {
                    phoneError.style.display = 'none';
                    phoneOk.textContent = '✓ Valid phone number';
                    phoneOk.style.display = 'block';
                    this.classList.add('is-valid'); this.classList.remove('is-invalid');
                } else {
                    phoneOk.style.display = 'none';
                    phoneError.textContent = '✗ Invalid. Must be 10 digits starting with 03/05/07/08/09';
                    phoneError.style.display = 'block';
                    this.classList.add('is-invalid'); this.classList.remove('is-valid');
                }
            });

            // ===== VALIDATE HỌ TÊN (real-time) =====
            const nameInput = document.getElementById('receiverName');
            nameInput.addEventListener('input', function () {
                const val = this.value.trim();
                if (val.length === 0) { this.classList.remove('is-valid', 'is-invalid'); return; }
                const hasNum = /\d/.test(val);
                const hasTwoWords = val.split(/\s+/).filter(Boolean).length >= 2;
                if (hasNum || !hasTwoWords) {
                    this.classList.add('is-invalid'); this.classList.remove('is-valid');
                    document.getElementById('nameError').textContent = hasNum
                        ? '✗ Name cannot contain numbers'
                        : '✗ Please enter at least 2 words (full name)';
                } else {
                    this.classList.add('is-valid'); this.classList.remove('is-invalid');
                }
            });

            // ===== NÚT PLACE ORDER: VALIDATE RỒI MỚI SUBMIT =====
            document.getElementById('btnPlaceOrder').addEventListener('click', function () {
                let isValid = true;

                // -- Kiểm tra tên --
                const nameVal = nameInput.value.trim();
                if (!nameVal || /\d/.test(nameVal) || nameVal.split(/\s+/).filter(Boolean).length < 2) {
                    nameInput.classList.add('is-invalid'); nameInput.classList.remove('is-valid');
                    document.getElementById('nameError').textContent = '✗ Please enter a valid full name (at least 2 words, no numbers)';
                    isValid = false;
                }

                // -- Kiểm tra số điện thoại --
                if (!vnPhoneRegex.test(phoneInput.value)) {
                    phoneInput.classList.add('is-invalid'); phoneInput.classList.remove('is-valid');
                    phoneError.textContent = '✗ Invalid phone number. Ex: 0901234567';
                    phoneError.style.display = 'block';
                    isValid = false;
                }

                // -- Kiểm tra địa chỉ --
                const province = document.getElementById('provinceSelect');
                const district = document.getElementById('districtSelect');
                const ward = document.getElementById('wardSelect');
                const street = document.getElementById('streetInput');
                const addrErr = document.getElementById('addressError');

                if (!province.value) {
                    province.classList.add('is-invalid');
                    isValid = false;
                }
                if (!district.value) {
                    district.classList.add('is-invalid');
                    isValid = false;
                }
                if (!ward.value) {
                    ward.classList.add('is-invalid');
                    isValid = false;
                }
                if (!street.value.trim()) {
                    street.classList.add('is-invalid');
                    addrErr.textContent = '✗ Please enter street address';
                    isValid = false;
                }

                if (!isValid) {
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                    return; // Dừng lại, KHÔNG submit
                }

                // -- Tất cả hợp lệ: ghép địa chỉ và submit --
                const fullAddress = street.value.trim() + ', '
                    + ward.options[ward.selectedIndex].text + ', '
                    + district.options[district.selectedIndex].text + ', '
                    + province.options[province.selectedIndex].text;
                document.getElementById('receiverAddress').value = fullAddress;

                // Submit form thủ công
                document.getElementById('checkoutForm').submit();
            });

            // Xóa is-invalid khi thay đổi dropdown
            ['provinceSelect', 'districtSelect', 'wardSelect'].forEach(function (id) {
                document.getElementById(id).addEventListener('change', function () {
                    this.classList.remove('is-invalid');
                });
            });
            document.getElementById('streetInput').addEventListener('input', function () {
                if (this.value.trim()) this.classList.remove('is-invalid');
            });

        })();
    </script>
</body>

</html>

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
            <jsp:include page="/WEB-INF/view/client/layout/favicon.jsp" />            <link href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css" rel="stylesheet" />
            <style>
                :root {
                    --bg-light: #f8fafc;
                    --card-bg: #ffffff;
                    --text-main: #1e293b;
                    --text-muted: #64748b;
                    --accent-blue: #0d6efd;
                    --border-color: #e2e8f0;
                }

                body {
                    font-family: 'Inter', sans-serif !important;
                    background-color: var(--bg-light) !important;
                }

                /* Tổng thể layout content */
                #layoutSidenav_content {
                    background-color: #f4f7f6;
                }

                .container-fluid {
                    padding-top: 2rem !important;
                }

                h1.mt-4 {
                    color: var(--text-main);
                    font-weight: 800;
                    letter-spacing: -0.5px;
                    margin-bottom: 0.5rem;
                }

                .breadcrumb {
                    background: var(--card-bg);
                    padding: 10px 20px;
                    border-radius: 10px;
                    border: 1px solid var(--border-color);
                }

                .breadcrumb-item.active {
                    color: var(--accent-blue) !important;
                    font-weight: 500;
                }

                /* Container for tables and filters */
                .table-container {
                    background: var(--card-bg);
                    border-radius: 16px;
                    padding: 24px;
                    border: 1px solid var(--border-color);
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
                }

                /* Thẻ Card Thống Kê Modern Light */
                .stat-card {
                    border: 1px solid var(--border-color) !important;
                    border-radius: 16px !important;
                    overflow: hidden;
                    transition: all 0.3s ease;
                    min-height: 160px;
                    display: flex;
                    flex-direction: column;
                    background: var(--card-bg) !important;
                    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
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
                    color: var(--text-main);
                    margin-top: 10px;
                }

                .stat-label {
                    font-size: 0.85rem;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    font-weight: 700;
                    color: var(--text-muted);
                }

                .stat-card .card-footer {
                    background: #f8fafc !important;
                    border-top: 1px solid var(--border-color) !important;
                    padding: 0.8rem 1.5rem !important;
                }

                .stat-card .card-footer a {
                    font-weight: 600;
                    color: var(--accent-blue) !important;
                    text-decoration: none;
                }

                .xsmall { font-size: 0.75rem; color: var(--text-muted); }

                @keyframes slideUpFade {
                    from { opacity: 0; transform: translateY(20px); }
                    to { opacity: 1; transform: translateY(0); }
                }

                .animate-in { animation: slideUpFade 0.5s ease forwards; }
                .delay-1 { animation-delay: 0.1s; }
                .delay-2 { animation-delay: 0.2s; }
                .delay-3 { animation-delay: 0.3s; }

                /* Custom Choices.js Styling to match Bootstrap 5 */
                .choices {
                    margin-bottom: 0;
                    width: 100%;
                }
                .choices__inner {
                    min-height: 42px !important;
                    max-height: 42px !important;
                    overflow-y: auto !important;
                    overflow-x: hidden !important;
                    border: 1px solid #dee2e6 !important;
                    background-color: #fff !important;
                    border-radius: 0.375rem !important;
                    padding: 0.25rem 2.25rem 0.25rem 0.5rem !important;
                    font-size: 1rem;
                    font-weight: 400;
                    line-height: 1.5;
                    color: #212529;
                    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                    display: flex;
                    flex-wrap: wrap;
                    align-content: flex-start;
                    gap: 2px;
                }
                .choices.is-focused .choices__inner {
                    border-color: #86b7fe !important;
                    outline: 0;
                    box-shadow: 0 0 0 0.25rem rgba(13,110,253,.25) !important;
                }
                .choices__list--multiple .choices__item {
                    background-color: var(--accent-blue) !important;
                    border: none !important;
                    border-radius: 4px !important;
                    font-size: 0.8rem !important;
                    font-weight: 600 !important;
                    margin-bottom: 0 !important;
                }
                .choices__list--dropdown {
                    z-index: 1050 !important;
                    border-radius: 0.375rem !important;
                    box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15) !important;
                    border: 1px solid #dee2e6 !important;
                }
                .choices__placeholder {
                    opacity: 1 !important;
                    color: #6c757d !important;
                }
                .choices__input {
                    font-size: 0.9rem !important;
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
                            <h1 class="mt-4 animate-in">Dashboard Overview</h1>
                            <ol class="breadcrumb mb-4 animate-in">
                                <li class="breadcrumb-item"><a href="/admin" class="text-decoration-none"
                                        style="color: var(--text-muted);">Admin</a></li>
                                <li class="breadcrumb-item active">System Statistics</li>
                            </ol>

                            <!-- Filter Section - New 2-panel layout -->
                            <div class="table-container mb-4 animate-in" style="position: relative; z-index: 100;">
                                <div class="row g-4">
                                    <!-- LEFT: Filter Controls -->
                                    <div class="col-md-8">
                                        <div class="d-flex align-items-center mb-3 gap-2">
                                            <i class="fas fa-sliders-h text-primary"></i>
                                            <span class="fw-bold text-uppercase small text-muted">Statistics Filters</span>
                                        </div>
                                        <div class="row g-3">
                                            <div class="col-md-4">
                                                <label class="form-label fw-bold small text-muted text-uppercase mb-1">Time Range</label>
                                                <select class="form-select shadow-none" id="statsTimeRange">
                                                    <option value="today">Today</option>
                                                    <option value="7days" selected>Last 7 days</option>
                                                    <option value="1month">Last 30 days</option>
                                                    <option value="1year">Last year</option>
                                                    <option value="all">All time</option>
                                                    <option value="custom">Custom (From-To)</option>
                                                </select>
                                            </div>
                                            <div id="customDateRange" class="col-md-5 d-none">
                                                <div class="row g-2">
                                                    <div class="col-6">
                                                        <label class="form-label fw-bold small text-muted text-uppercase mb-1">From Date</label>
                                                        <input type="date" class="form-control" id="statsFromDate">
                                                    </div>
                                                    <div class="col-6">
                                                        <label class="form-label fw-bold small text-muted text-uppercase mb-1">To Date</label>
                                                        <input type="date" class="form-control" id="statsToDate">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <label class="form-label fw-bold small text-muted text-uppercase mb-1">Manufacturer</label>
                                                <select class="form-select" id="statsBrandFilter" multiple>
                                                    <c:forEach var="brand" items="${brands}">
                                                        <option value="${brand}">${brand}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-12">
                                                <button class="btn btn-primary fw-bold px-4" id="btnApplyStats">
                                                    <i class="fas fa-filter me-2"></i>Filter Data
                                                </button>
                                                <span class="text-muted small ms-3">
                                                    <i class="fas fa-info-circle me-1"></i>Calculated on COMPLETE orders
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- RIGHT: Revenue Target Widget -->
                                    <div class="col-md-4">
                                        <div class="d-flex align-items-center mb-3 gap-2">
                                            <i class="fas fa-bullseye text-danger"></i>
                                            <span class="fw-bold text-uppercase small text-muted">Revenue Target</span>
                                        </div>
                                        <div class="row g-2 mb-3">
                                            <div class="col-7">
                                                <label class="form-label fw-bold small text-muted text-uppercase mb-1">Set Target (VNĐ)</label>
                                                <input type="number" class="form-control" id="targetAmount" placeholder="ex: 10000000" min="0" step="1000000" value="10000000">
                                            </div>
                                            <div class="col-5">
                                                <label class="form-label fw-bold small text-muted text-uppercase mb-1">Tracking Period</label>
                                                <select class="form-select" id="targetPeriod">
                                                    <option value="week">Week</option>
                                                    <option value="month" selected>Month</option>
                                                    <option value="year">Year</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div style="position: relative; height: 180px; display: flex; align-items: center; justify-content: center;">
                                            <canvas id="targetDonutChart"></canvas>
                                            <div id="targetCenterText" style="position:absolute; text-align:center; pointer-events:none;">
                                                <div id="targetPct" style="font-size:1.8rem; font-weight:800; color:#0f172a; line-height:1;">0%</div>
                                                <div id="targetLabel" style="font-size:0.7rem; color:#64748b; margin-top:2px;">target achieved</div>
                                            </div>
                                        </div>
                                        <div class="text-center mt-2">
                                            <span id="targetSummaryText" class="small text-muted"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-2 text-muted xsmall"><i class="fas fa-info-circle me-1"></i>Data calculated based on COMPLETE orders.</div>
                            </div>

                            <div class="row mt-4">
                                <!-- LEFT: Chart Section -->
                                <div class="col-lg-8">
                                    <div class="table-container mb-4 animate-in" style="height: calc(100% - 1.5rem);">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div class="d-flex align-items-center gap-2">
                                                <h3 class="m-0" style="font-weight: 700; color: var(--text-main);">Revenue Trends</h3>
                                                <span id="demoBadge" style="display:none; font-size: 0.7rem; background: #f1f5f9; color: #64748b; border: 1px dashed #94a3b8; padding: 2px 10px; border-radius: 20px; font-weight: 600;">Simulation Data</span>
                                            </div>
                                        </div>
                                        <div style="height: 400px; position: relative;">
                                            <canvas id="revenueLineChart"></canvas>
                                        </div>
                                    </div>
                                </div>

                                <!-- RIGHT: Stat Cards -->
                                <div class="col-lg-4">
                                    <div class="row g-4">
                                        <!-- Revenue Card -->
                                        <div class="col-12">
                                            <div class="card stat-card card-order animate-in delay-1" style="border-top: 4px solid #f59e0b !important; margin-bottom: 0;">
                                                <div class="card-body">
                                                    <div style="position: relative; z-index: 2;">
                                                        <div class="stat-label">Total Revenue</div>
                                                        <div class="stat-value" id="displayTotalRevenue">0 VNĐ</div>
                                                    </div>
                                                    <i class="fas fa-hand-holding-usd bg-icon" style="color: #f59e0b; opacity: 0.4;"></i>
                                                </div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <span class="small text-muted">Successful orders</span>
                                                    <div class="small text-muted"><i class="fas fa-chart-line"></i></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="card stat-card card-user animate-in delay-2" style="margin-bottom: 0;">
                                                <div class="card-body">
                                                    <div style="position: relative; z-index: 2;">
                                                        <div class="stat-label">Total Users</div>
                                                        <div class="stat-value">${countUser}</div>
                                                    </div>
                                                    <i class="fas fa-users bg-icon"></i>
                                                </div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small stretched-link text-decoration-none" href="/admin/user">View details</a>
                                                    <div class="small text-muted"><i class="fas fa-chevron-right"></i></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="card stat-card card-product animate-in delay-3" style="margin-bottom: 0;">
                                                <div class="card-body">
                                                    <div style="position: relative; z-index: 2;">
                                                        <div class="stat-label">Available Products</div>
                                                        <div class="stat-value">${countProduct}</div>
                                                    </div>
                                                    <i class="fas fa-box-open bg-icon"></i>
                                                </div>
                                                <div class="card-footer d-flex align-items-center justify-content-between">
                                                    <a class="small stretched-link text-decoration-none" href="/admin/product">Manage inventory</a>
                                                    <div class="small text-muted"><i class="fas fa-chevron-right"></i></div>
                                                </div>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="<c:url value='/js/scripts.js'/>"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    let revenueChart = null;

                    const brandSelect = document.getElementById('statsBrandFilter');
                    const choices = new Choices(brandSelect, {
                        removeItemButton: true,
                        placeholder: true,
                        placeholderValue: 'Select brand...',
                        noResultsText: 'No results found',
                        itemSelectText: ''
                    });

                    const timeRangeSelect = document.getElementById('statsTimeRange');
                    const customDateRangeDiv = document.getElementById('customDateRange');
                    const btnApply = document.getElementById('btnApplyStats');
                    const revenueDisplay = document.getElementById('displayTotalRevenue');

                    timeRangeSelect.addEventListener('change', function() {
                        if (this.value === 'custom') {
                            customDateRangeDiv.classList.remove('d-none');
                        } else {
                            customDateRangeDiv.classList.add('d-none');
                        }
                    });

                    function formatCurrency(value) {
                        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(value);
                    }

                    function updateDashboard() {
                        const timeRange = timeRangeSelect.value;
                        const fromDate = document.getElementById('statsFromDate').value;
                        const toDate = document.getElementById('statsToDate').value;
                        const brands = choices.getValue(true);

                        let url = '<c:url value="/admin/api/dashboard/statistics"/>?timeRange=' + timeRange;
                        if (brands && brands.length > 0) {
                            brands.forEach(function(b) {
                                url += '&brands=' + encodeURIComponent(b);
                            });
                        }
                        if (timeRange === 'custom' && fromDate && toDate) {
                            url += '&fromDate=' + fromDate + '&toDate=' + toDate;
                        }

                        console.log(">>> Request URL:", url);
                        revenueDisplay.innerHTML = '<span class="spinner-border spinner-border-sm" role="status"></span>';

                        fetch(url)
                            .then(response => {
                                console.log(">>> Response Status:", response.status);
                                if (!response.ok) throw new Error('API Error: ' + response.status);
                                return response.json();
                            })
                            .then(data => {
                                console.group(">>> Dashboard Data Analysis");
                                console.log("Total Revenue:", data.totalRevenue);
                                console.log("Complete Orders Found:", data.diag_count_complete);
                                console.log("Status Breakdown:", data.diag_status_breakdown);
                                console.log("Full Object:", data);
                                console.groupEnd();

                                revenueDisplay.innerText = formatCurrency(data.totalRevenue);
                                lastActualRevenue = data.totalRevenue || 0;
                                updateTargetChart(lastActualRevenue);

                                const labels = data.chartData.map(function(item) {
                                        return item[0]; 
                                    });
                                const values = data.chartData.map(function(item) { return item[1]; });

                                // Tự động tạo dữ liệu mô phỏng nếu chưa đủ điểm để vẽ đường line
                                let chartLabels = labels;
                                let chartValues = values;
                                let isDemoMode = false;

                                if (labels.length < 2) {
                                    isDemoMode = true;
                                    const totalRev = data.totalRevenue || 77000000;
                                    const today = new Date();
                                    const demoLabels = [];
                                    const demoValues = [];

                                    const days = 15;
                                    const weights = [0.4, 0.7, 0.5, 0.9, 0.6, 1.2, 0.8, 1.0, 0.75, 1.1, 0.65, 0.85, 1.3, 0.9, 1.5];
                                    
                                    // Phân phối doanh thu hợp lý
                                    let remainingRevenue = totalRev;
                                    let distributedDays = days;
                                    
                                    // Nếu có dữ liệu thực của hôm nay, trừ ra trước khi phân phối cho các ngày cũ
                                    if (labels.length === 1) {
                                        remainingRevenue -= values[0];
                                        distributedDays = days - 1;
                                    }

                                    const subWeights = weights.slice(0, distributedDays);
                                    const totalWeight = subWeights.reduce((a, b) => a + b, 0);

                                    for (let i = 0; i < distributedDays; i++) {
                                        const d = new Date(today);
                                        d.setDate(d.getDate() - (days - 1 - i));
                                        demoLabels.push(d.toISOString().split('T')[0]);
                                        const dayRevenue = Math.round((remainingRevenue / totalWeight) * subWeights[i]);
                                        demoValues.push(dayRevenue);
                                    }

                                    // Thêm ngày hôm nay (dữ liệu thực)
                                    if (labels.length === 1) {
                                        demoLabels.push(new Date().toISOString().split('T')[0]);
                                        demoValues.push(values[0]);
                                    } else {
                                        // Nếu không có dữ liệu thực nào, thêm ngày hôm nay mô phỏng nốt
                                        const d = new Date(today);
                                        demoLabels.push(d.toISOString().split('T')[0]);
                                        const dayRevenue = Math.round((totalRev / (totalWeight + weights[days-1])) * weights[days-1]);
                                        demoValues.push(dayRevenue);
                                    }

                                    chartLabels = demoLabels;
                                    chartValues = demoValues;
                                }

                                // Chuyển đổi sang dữ liệu tích lũy (Cumulative) để điểm cuối cùng khớp với Tổng doanh thu
                                let cumulativeValues = [];
                                let sum = 0;
                                for (let val of chartValues) {
                                    sum += val;
                                    cumulativeValues.push(sum);
                                }
                                chartValues = cumulativeValues;

                                if (revenueChart) {
                                    revenueChart.destroy();
                                }

                                // Hiển thị badge nếu đang ở chế độ demo
                                const demoNotice = document.getElementById('demoBadge');
                                if (demoNotice) demoNotice.style.display = isDemoMode ? 'inline-block' : 'none';

                                const ctx = document.getElementById('revenueLineChart').getContext('2d');
                                revenueChart = new Chart(ctx, {
                                    type: 'line',
                                    data: {
                                        labels: chartLabels,
                                        datasets: [{
                                            label: 'Cumulative Revenue (VNĐ)',
                                            data: chartValues,
                                            borderColor: '#6366f1',
                                            backgroundColor: (context) => {
                                                const chart = context.chart;
                                                const {ctx, chartArea} = chart;
                                                if (!chartArea) return null;
                                                const gradient = ctx.createLinearGradient(0, chartArea.top, 0, chartArea.bottom);
                                                gradient.addColorStop(0, 'rgba(99, 102, 241, 0.2)');
                                                gradient.addColorStop(1, 'rgba(99, 102, 241, 0)');
                                                return gradient;
                                            },
                                            borderWidth: 3,
                                            tension: 0.4,
                                            fill: true,
                                            pointBackgroundColor: '#fff',
                                            pointBorderColor: '#6366f1',
                                            pointBorderWidth: 2,
                                            pointRadius: 4,
                                            pointHoverRadius: 6
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: {
                                            legend: { display: false },
                                            tooltip: {
                                                backgroundColor: '#fff',
                                                titleColor: '#333',
                                                bodyColor: '#4e73df',
                                                borderColor: '#dddfeb',
                                                borderWidth: 1,
                                                xPadding: 15,
                                                yPadding: 15,
                                                displayColors: false,
                                                caretPadding: 10,
                                                callbacks: {
                                                    label: function(context) {
                                                        return 'Total to date: ' + formatCurrency(context.raw);
                                                    }
                                                }
                                            }
                                        },
                                        scales: {
                                            x: {
                                                grid: {
                                                    display: false,
                                                    drawBorder: false
                                                },
                                                ticks: {
                                                    maxTicksLimit: 12
                                                }
                                            },
                                            y: {
                                                ticks: {
                                                    maxTicksLimit: 5,
                                                    padding: 10,
                                                    callback: function(value) {
                                                        if (value >= 1000000) return (value / 1000000) + 'M';
                                                        return formatCurrency(value);
                                                    }
                                                },
                                                grid: {
                                                    color: "rgb(234, 236, 244)",
                                                    zeroLineColor: "rgb(234, 236, 244)",
                                                    drawBorder: false,
                                                    borderDash: [2],
                                                    zeroLineBorderDash: [2]
                                                }
                                            }
                                        }
                                    }
                                });
                            })
                            .catch(error => {
                                console.error('>>> Fetch Error:', error);
                                revenueDisplay.innerText = 'Lỗi';
                                alert('Lỗi: ' + error.message);
                            });
                    }

                    btnApply.addEventListener('click', updateDashboard);

                    // ---- Biểu đồ tròn Mục tiêu doanh thu ----
                    let targetDonutChart = null;

                    function updateTargetChart(actualRevenue) {
                        const target = parseFloat(document.getElementById('targetAmount').value) || 10000000;
                        const period = document.getElementById('targetPeriod').value;
                        const periodLabels = { week: 'week', month: 'month', year: 'year' };

                        const rawPct = target > 0 ? (actualRevenue / target) * 100 : 0;
                        const pct = Math.min(rawPct, 100); // Giới hạn 100% cho phần hiển thị
                        const achieved = Math.min(Math.round(rawPct), 100); // Hiển thị tối đa 100%

                        // Màu theo mức đạt được
                        let color = '#3b82f6'; // xanh dương < 50%
                        if (rawPct >= 100) color = '#22c55e';      // xanh lá = đạt
                        else if (rawPct >= 50) color = '#f59e0b';  // cam = gần đạt

                        const chartData = {
                            datasets: [{
                                data: [pct, 100 - pct],
                                backgroundColor: [color, '#f1f5f9'],
                                borderWidth: 0,
                                hoverOffset: 0
                            }]
                        };

                        if (targetDonutChart) {
                            targetDonutChart.data = chartData;
                            targetDonutChart.update('none');
                        } else {
                            const ctx2 = document.getElementById('targetDonutChart').getContext('2d');
                            targetDonutChart = new Chart(ctx2, {
                                type: 'doughnut',
                                data: chartData,
                                options: {
                                    cutout: '75%',
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    animation: { animateRotate: true, duration: 800 },
                                    plugins: { legend: { display: false }, tooltip: { enabled: false } }
                                }
                            });
                        }

                        // Cập nhật chữ ở giữa
                        document.getElementById('targetPct').textContent = achieved + '%';
                        document.getElementById('targetPct').style.color = color;

                        // Cập nhật dòng tóm tắt bên dưới
                        const summaryEl = document.getElementById('targetSummaryText');
                        summaryEl.textContent = formatCurrency(actualRevenue) + ' / ' + formatCurrency(target) + ' (' + periodLabels[period] + ')';
                        summaryEl.style.color = color;
                    }

                    // Khi thay đổi target hoặc kỳ, vẽ lại ngay với doanh thu hiện tại
                    let lastActualRevenue = 0;
                    document.getElementById('targetAmount').addEventListener('input', function() {
                        updateTargetChart(lastActualRevenue);
                    });
                    document.getElementById('targetPeriod').addEventListener('change', function() {
                        updateTargetChart(lastActualRevenue);
                    });

                    updateDashboard();
                });
            </script>
        </body>

        </html>
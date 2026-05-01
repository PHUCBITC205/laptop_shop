<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <style>
            /* Biến số để đồng nhất với Sidebar */
            :root {
                --nav-bg: #ffffff;
                --accent-color: #0d6efd;
                --border-color: #e2e8f0;
                --text-dark: #334155;
                --transition-fast: all 0.3s ease;
            }

            .sb-topnav {
                background: var(--nav-bg) !important;
                border-bottom: 1px solid var(--border-color);
                padding-right: 1rem;
                height: 65px;
            }

            /* Hiệu ứng Brand Logo */
            .navbar-brand {
                font-weight: 800 !important;
                letter-spacing: 0.5px;
                font-size: 1.4rem !important;
                transition: var(--transition-fast);
                color: var(--accent-color) !important;
            }

            .navbar-brand:hover {
                filter: brightness(0.8);
            }

            /* Nút Toggle Sidebar xoay tròn khi hover */
            #sidebarToggle {
                transition: var(--transition-fast);
                border-radius: 8px;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--text-dark) !important;
            }

            #sidebarToggle:hover {
                background: #f1f5f9;
                color: var(--accent-color) !important;
            }

            /* User Name styling */
            .user-name-display {
                font-weight: 600;
                color: var(--text-dark);
                margin-right: 10px;
                font-size: 0.9rem;
            }

            /* Dropdown Animation */
            .dropdown-menu {
                border: 1px solid var(--border-color) !important;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1) !important;
                background: #ffffff !important;
                border-radius: 12px !important;
                padding: 10px !important;
            }

            .dropdown-item {
                color: var(--text-dark) !important;
                padding: 10px 15px !important;
                border-radius: 8px !important;
                transition: var(--transition-fast);
            }

            .dropdown-item:hover {
                background: #f1f5f9 !important;
                color: var(--accent-color) !important;
            }

            .dropdown-divider {
                border-top: 1px solid var(--border-color);
            }
        </style>

        <nav class="sb-topnav navbar navbar-expand navbar-light">
            <a class="navbar-brand ps-3" href="/admin">
                <i class="fas fa-laptop me-2"></i>Laptopshop
            </a>

            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
                <i class="fas fa-bars"></i>
            </button>

            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="user-info d-flex align-items-center">
                    <span class="user-name-display">
                        Xin chào,
                        <c:out value="${pageContext.request.userPrincipal.name}" />
                    </span>
                </div>
            </form>

            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle profile-icon" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"
                        style="background: var(--glass-border); border-radius: 50%; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-user-circle fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/"><i class="fas fa-home me-2"></i>Trang chủ</a></li>
                         <li><a class="dropdown-item" href="/admin/profile"><i class="fas fa-id-card me-2"></i>Hồ sơ cá
                                nhân</a></li>
                        <li><a class="dropdown-item" href="/admin/settings"><i class="fas fa-cog me-2"></i>Cài đặt</a>
                        </li>
                       
                        
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li>
                            <form method="post" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="dropdown-item text-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                                </button>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
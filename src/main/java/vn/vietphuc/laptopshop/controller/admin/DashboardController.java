package vn.vietphuc.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.repository.OrderRepository;
import vn.vietphuc.laptopshop.service.OrderService;
import vn.vietphuc.laptopshop.service.ProductService;
import vn.vietphuc.laptopshop.service.UserSevice;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DashboardController {
    private final UserSevice userSevice;
    private final ProductService productService;
    private final OrderService orderService;
    private final OrderRepository orderRepository;

    public DashboardController(UserSevice userSevice, ProductService productService, OrderService orderService, OrderRepository orderRepository) {
        this.userSevice = userSevice;
        this.productService = productService;
        this.orderService = orderService;
        this.orderRepository = orderRepository;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        model.addAttribute("countUser", this.userSevice.countUser());
        model.addAttribute("countProduct", this.userSevice.countProduct());
        model.addAttribute("countOrder", this.userSevice.countOrder());
        model.addAttribute("brands", this.productService.getFactories());
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/api/dashboard/statistics")
    @ResponseBody
    public Map<String, Object> getDashboardStatistics(
            @RequestParam(defaultValue = "7days") String timeRange,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fromDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate toDate,
            @RequestParam(required = false) List<String> brands) {

        LocalDateTime start = LocalDateTime.of(1970, 1, 1, 0, 0);
        LocalDateTime end = LocalDateTime.now();

        boolean isAllTime = "all".equals(timeRange);
        if ("today".equals(timeRange)) {
            start = LocalDate.now().atStartOfDay();
        } else if ("7days".equals(timeRange)) {
            start = LocalDate.now().minusDays(7).atStartOfDay();
        } else if ("1month".equals(timeRange)) {
            start = LocalDate.now().minusMonths(1).atStartOfDay();
        } else if ("1year".equals(timeRange)) {
            start = LocalDate.now().minusYears(1).atStartOfDay();
        } else if ("custom".equals(timeRange) && fromDate != null && toDate != null) {
            start = fromDate.atStartOfDay();
            end = toDate.atTime(LocalTime.MAX);
        }

        String format = "%Y-%m-%d";
        if ("1year".equals(timeRange) || "all".equals(timeRange)) {
            format = "%Y-%m";
        }

        Double totalRevenue = 0.0;
        if (brands == null || brands.isEmpty()) {
            totalRevenue = this.orderRepository.sumTotalRevenue(start, end, isAllTime);
        } else {
            totalRevenue = this.orderService.calculateRevenue(brands, start, end, isAllTime);
        }
        List<Object[]> chartDataRaw = this.orderService.getRevenueData(brands, start, end, isAllTime, format);

        List<Object[]> chartData = chartDataRaw.stream()
                .map(item -> new Object[] {
                        item[0] != null ? item[0].toString() : "Không xác định",
                        item[1]
                })
                .collect(java.util.stream.Collectors.toList());

        Map<String, Object> response = new HashMap<>();
        response.put("totalRevenue", totalRevenue != null ? totalRevenue : 0);
        response.put("chartData", chartData);
        response.put("debug_start", start.toString());
        response.put("debug_end", end.toString());
        
        // Chẩn đoán dữ liệu chi tiết
        response.put("diag_total_orders", this.userSevice.countOrder());
        response.put("diag_count_complete", this.orderRepository.countCompleteOrders());
        response.put("diag_status_breakdown", this.orderRepository.countByStatus());

        return response;
    }

}

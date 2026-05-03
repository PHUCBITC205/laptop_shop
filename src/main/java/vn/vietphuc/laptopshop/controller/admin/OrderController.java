package vn.vietphuc.laptopshop.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.vietphuc.laptopshop.domain.Cart;
import vn.vietphuc.laptopshop.domain.CartDetail;
import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.Product;
import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.repository.OrderDetailRepository;
import vn.vietphuc.laptopshop.repository.OrderRepository;
import vn.vietphuc.laptopshop.service.OrderService;
import vn.vietphuc.laptopshop.service.ProductService;

@Controller
public class OrderController {
    private final OrderService orderService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductService productService;

    public OrderController(OrderService orderService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository, ProductService productService) {
        this.orderService = orderService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productService = productService;
    }

    // show trang order dashboard

    @GetMapping("/admin/order")
    public String getDashBoard(Model model,
            @RequestParam("page") Optional<String> pageOptional,
            @RequestParam("status") Optional<String> statusOptional,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // page = 1;
        }

        String status = statusOptional.orElse("");
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Order> prs = this.orderService.fetchOrdersWithSpec(pageable, status);
        List<Order> listOrders = prs.getContent();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("orders", listOrders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        model.addAttribute("currentStatus", status);
        return "admin/order/show";
    }


    @GetMapping("/admin/order/{id}")

    public String getPageOrder(Model model, @PathVariable long id) {
        Order od = this.orderService.fetchOrderById(id).get();
        model.addAttribute("orders", od);
        model.addAttribute("id", id);
        model.addAttribute("orderDetail", od.getOrderDetails());

        return "admin/order/detail";

    }

    // update
    @GetMapping("/admin/order/update/{id}")
    public String getPageUpdateOrder(Model model, @PathVariable long id) {
        Order od = this.orderService.fetchOrderById(id).get();
        Optional<Order> order = this.orderService.fetchOrderById(id);
        model.addAttribute("newOrder", order.get());
        model.addAttribute("orders", od);
        model.addAttribute("id", id);
        model.addAttribute("orderDetail", od.getOrderDetails());
        return "admin/order/update";

    }

    @PostMapping("/admin/order/update")
    public String handleUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.updatePaymentStatus(order.getId(), order.getPaymentStatus());
        this.orderService.updateOrderStatus(order.getId(), order.getStatus());
        this.orderService.updateOrderInfo(order.getId(), order.getReceiverName(), order.getReceiverAddress(),
                order.getReceiverPhone());
        return "redirect:/admin/order";
    }

    // delete order
    @GetMapping("/admin/order/delete/{id}")
    public String getPageDeleteOrder(Model model, @PathVariable long id) {
        Order order = new Order();
        model.addAttribute("deleteHandle", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String handleDeleteOrder(@ModelAttribute("deleteHandle") Order phucxo) {
        this.orderService.deleteOrderById(phucxo.getId());
        return "redirect:/admin/order";
    }

}

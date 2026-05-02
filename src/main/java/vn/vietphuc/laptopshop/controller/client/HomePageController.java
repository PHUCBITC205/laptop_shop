package vn.vietphuc.laptopshop.controller.client;

import java.net.http.HttpRequest;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.Product;
import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.domain.dto.RegisterDTO;
import vn.vietphuc.laptopshop.service.OrderService;
import vn.vietphuc.laptopshop.service.ProductService;
import vn.vietphuc.laptopshop.service.UserSevice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserSevice userSevice;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;

    public HomePageController(ProductService productService, UserSevice userSevice, PasswordEncoder passwordEncoder,
            OrderService orderService) {
        this.productService = productService;
        this.userSevice = userSevice;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        // List<Product> product = this.productService.fetchProducts();
        Pageable pageable = PageRequest.of(0, 20);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> product = prs.getContent();
        model.addAttribute("products", product);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {

        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userSevice.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.userSevice.getRoleByName("USER"));
        this.userSevice.handlSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        User cureenUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        cureenUser.setId(id);

        Pageable pageable = PageRequest.of(page - 1, 5, Sort.by("id").descending());
        Page<Order> orderPage = this.orderService.fetchOrderByUser(cureenUser, pageable);
        List<Order> order = orderPage.getContent();

        model.addAttribute("orders", order);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orderPage.getTotalPages());
        return "client/cart/order-history";
    }

    @PostMapping("/cancel-order/{id}")
    public String handleCancelOrder(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");

        Optional<Order> orderOptional = this.orderService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            // Verify ownership and status
            if (order.getUser().getId() == userId &&
                    (order.getStatus().equals("UNPAID") || order.getStatus().equals("PENDING"))) {
                this.orderService.updateOrderStatus(id, "CANCEL");
            }
        }
        return "redirect:/order-history";
    }

    @PostMapping("/update-order-info")
    public String handleUpdateOrderInfo(
            @RequestParam("id") long id,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");

        Optional<Order> orderOptional = this.orderService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            // Verify ownership and status (only allow update if not shipped/cancelled/success)
            if (order.getUser().getId() == userId &&
                    (order.getStatus().equals("UNPAID") || order.getStatus().equals("PENDING"))) {
                this.orderService.updateOrderInfo(id, receiverName, receiverAddress, receiverPhone);
            }
        }
        return "redirect:/order-history";
    }

    @PostMapping("/change-payment-to-cod")
    public String handlePayWithCOD(@RequestParam("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long userId = (long) session.getAttribute("id");

        Optional<Order> orderOptional = this.orderService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            // Verify ownership and status
            if (order.getUser().getId() == userId && order.getStatus().equals("UNPAID")) {
                this.orderService.changePaymentMethodToCOD(id);
            }
        }
        return "redirect:/order-history";
    }

}

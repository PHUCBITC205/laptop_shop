package vn.vietphuc.laptopshop.controller.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value; // Thêm dòng này
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.service.EmailService;
import vn.vietphuc.laptopshop.service.UserSevice;

import java.util.UUID;

@Controller
public class ForgotPasswordController {

    private final UserSevice userService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    // Tự động lấy giá trị từ application.properties hoặc biến môi trường
    @Value("${app.base.url}")
    private String baseUrl;

    @Autowired
    public ForgotPasswordController(UserSevice userService, PasswordEncoder passwordEncoder,
            EmailService emailService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "client/auth/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {
        User user = userService.getUserByEmail(email);
        if (user != null) {
            String token = UUID.randomUUID().toString();
            user.setResetPasswordToken(token);
            userService.handlSaveUser(user);

            // SỬA TẠI ĐÂY: Dùng biến baseUrl thay vì localhost cứng
            String resetLink = baseUrl + "/reset-password?token=" + token;

            String emailContent = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #e0e0e0; border-radius: 10px; overflow: hidden;'>"
                    + "<div style='background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 30px; text-align: center; color: white;'>"
                    + "<h1 style='margin: 0; font-size: 24px;'>LaptopShop</h1>"
                    + "</div>"
                    + "<div style='padding: 30px; color: #333; line-height: 1.6;'>"
                    + "<h2>Yêu cầu đặt lại mật khẩu</h2>"
                    + "<p>Chào bạn,</p>"
                    + "<p>Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu cho tài khoản của bạn tại <b>LaptopShop</b>. Vui lòng bấm vào nút bên dưới để tiến hành đặt lại mật khẩu:</p>"
                    + "<div style='text-align: center; margin: 30px 0;'>"
                    + "<a href='" + resetLink
                    + "' style='background-color: #764ba2; color: white; padding: 15px 25px; text-decoration: none; border-radius: 5px; font-weight: bold; display: inline-block;'>Đặt lại mật khẩu</a>"
                    + "</div>"
                    + "<p>Nếu bạn không gửi yêu cầu này, vui lòng bỏ qua email này. Link sẽ hết hạn sau một thời gian ngắn.</p>"
                    + "<hr style='border: none; border-top: 1px solid #eee; margin: 20px 0;'>"
                    + "<p style='font-size: 12px; color: #777;'>Đây là email tự động, vui lòng không trả lời email này.</p>"
                    + "</div>"
                    + "<div style='background-color: #f9f9f9; padding: 15px; text-align: center; font-size: 12px; color: #999;'>"
                    + "&copy; 2024 LaptopShop. All rights reserved."
                    + "</div>"
                    + "</div>";

            try {
                this.emailService.sendHtmlEmail(user.getEmail(), "Đặt lại mật khẩu - LaptopShop", emailContent);
                model.addAttribute("message", "Link đặt lại mật khẩu đã được gửi vào email của bạn.");
            } catch (Exception e) {
                model.addAttribute("error", "Lỗi khi gửi email: " + e.getMessage());
            }
        } else {
            model.addAttribute("error", "Không tìm thấy tài khoản với email này.");
        }
        return "client/auth/forgot-password";
    }

    // ... (Các phương thức reset-password giữ nguyên như cũ của bạn) ...
    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        User user = userService.getUserByResetPasswordToken(token);
        if (user == null) {
            model.addAttribute("error", "Token không hợp lệ hoặc đã hết hạn.");
            return "client/auth/forgot-password";
        }
        model.addAttribute("token", token);
        return "client/auth/reset-password";
    }

    @PostMapping("/reset-password")
    public String processResetPassword(@RequestParam("token") String token,
            @RequestParam("password") String password, Model model) {
        User user = userService.getUserByResetPasswordToken(token);
        if (user == null) {
            return "redirect:/forgot-password?error";
        }
        user.setPassword(passwordEncoder.encode(password));
        user.setResetPasswordToken(null); 
        userService.handlSaveUser(user);
        return "redirect:/login?resetSuccess";
    }
}
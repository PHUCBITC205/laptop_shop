package vn.vietphuc.laptopshop.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.vietphuc.laptopshop.domain.Cart;
import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.Order_;
import vn.vietphuc.laptopshop.domain.OrderDetail;
import vn.vietphuc.laptopshop.domain.User;
import vn.vietphuc.laptopshop.repository.CartRepository;
import vn.vietphuc.laptopshop.repository.OrderDetailRepository;
import vn.vietphuc.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartRepository cartRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository,
            CartRepository cartRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.cartRepository = cartRepository;
    }

    public Page<Order> fetchOrder(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Page<Order> fetchOrdersWithSpec(Pageable pageable, String status) {
        if (status == null || status.isBlank()) {
            return this.orderRepository.findAll(pageable);
        }
        Specification<Order> spec = (root, query, cb) -> cb.equal(root.get("status"), status);
        return this.orderRepository.findAll(spec, pageable);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrderStatus(long id, String status) {
        Optional<Order> optionalOrder = this.orderRepository.findById(id);
        if (optionalOrder.isPresent()) {
            Order order = optionalOrder.get();
            order.setStatus(status);

            if (status.equals("PENDING")) {
                order.setPendingDate(LocalDateTime.now());
            } else if (status.equals("SHIPPING")) {
                order.setShippingDate(LocalDateTime.now());
            } else if (status.equals("SUCCESS")) {
                order.setCompleteDate(LocalDateTime.now());
            } else if (status.equals("CANCEL")) {
                order.setCancelDate(LocalDateTime.now());
            }

            this.orderRepository.save(order);
        }
    }

    public void updateOrderInfo(long id, String receiverName, String receiverAddress, String receiverPhone) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            order.setReceiverName(receiverName);
            order.setReceiverAddress(receiverAddress);
            order.setReceiverPhone(receiverPhone);
            this.orderRepository.save(order);
        }
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }
}

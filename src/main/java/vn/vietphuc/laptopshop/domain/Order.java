package vn.vietphuc.laptopshop.domain;

import java.time.ZoneId;
import java.util.Date;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private double totalPrice;

    private String receiverName;

    private String receiverAddress;

    private String receiverPhone;

    private String status;
    private String paymentMethod;
    private String paymentStatus;

    private LocalDateTime orderDate;
    private LocalDateTime pendingDate;
    private LocalDateTime shippingDate;
    private LocalDateTime completeDate;
    private LocalDateTime cancelDate;

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    // user id

    // Order
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "order")
    private List<OrderDetail> orderDetail;

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetail;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetail = orderDetails;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public LocalDateTime getPendingDate() {
        return pendingDate;
    }

    public void setPendingDate(LocalDateTime pendingDate) {
        this.pendingDate = pendingDate;
    }

    public LocalDateTime getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(LocalDateTime shippingDate) {
        this.shippingDate = shippingDate;
    }

    public LocalDateTime getCompleteDate() {
        return completeDate;
    }

    public void setCompleteDate(LocalDateTime completeDate) {
        this.completeDate = completeDate;
    }

    public LocalDateTime getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(LocalDateTime cancelDate) {
        this.cancelDate = cancelDate;
    }

    // Helper methods for JSP formatting
    public Date getOrderDateAsDate() {
        return orderDate != null ? Date.from(orderDate.atZone(ZoneId.systemDefault()).toInstant()) : null;
    }

    public Date getPendingDateAsDate() {
        return pendingDate != null ? Date.from(pendingDate.atZone(ZoneId.systemDefault()).toInstant()) : null;
    }

    public Date getShippingDateAsDate() {
        return shippingDate != null ? Date.from(shippingDate.atZone(ZoneId.systemDefault()).toInstant()) : null;
    }

    public Date getCompleteDateAsDate() {
        return completeDate != null ? Date.from(completeDate.atZone(ZoneId.systemDefault()).toInstant()) : null;
    }

    public Date getCancelDateAsDate() {
        return cancelDate != null ? Date.from(cancelDate.atZone(ZoneId.systemDefault()).toInstant()) : null;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", totalPrice=" + totalPrice + "]";
    }
}

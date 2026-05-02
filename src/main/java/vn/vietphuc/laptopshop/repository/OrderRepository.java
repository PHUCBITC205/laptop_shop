package vn.vietphuc.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import vn.vietphuc.laptopshop.domain.Order;
import vn.vietphuc.laptopshop.domain.User;

public interface OrderRepository extends JpaRepository<Order, Long>, JpaSpecificationExecutor<Order> {
    List<Order> findByUser(User user);
    Page<Order> findByUser(User user, Pageable pageable);

    Page<Order> findAll(Pageable page);

    @org.springframework.data.jpa.repository.Query("SELECT SUM(o.totalPrice) FROM Order o " +
           "WHERE (UPPER(o.status) LIKE '%COMPLETE%' OR UPPER(o.status) LIKE '%SUCCESS%') " +
           "AND (:isAllTime = true OR (COALESCE(o.completeDate, o.orderDate, o.pendingDate) >= :startDate " +
           "AND COALESCE(o.completeDate, o.orderDate, o.pendingDate) <= :endDate))")
    Double sumTotalRevenue(@org.springframework.data.repository.query.Param("startDate") java.time.LocalDateTime startDate, 
                           @org.springframework.data.repository.query.Param("endDate") java.time.LocalDateTime endDate,
                           @org.springframework.data.repository.query.Param("isAllTime") boolean isAllTime);

    @org.springframework.data.jpa.repository.Query("SELECT COUNT(o) FROM Order o WHERE (UPPER(o.status) LIKE '%COMPLETE%' OR UPPER(o.status) LIKE '%SUCCESS%')")
    long countCompleteOrders();

    @org.springframework.data.jpa.repository.Query("SELECT o.status, COUNT(o) FROM Order o GROUP BY o.status")
    List<Object[]> countByStatus();
}

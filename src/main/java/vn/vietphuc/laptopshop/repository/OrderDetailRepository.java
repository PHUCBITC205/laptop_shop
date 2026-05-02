package vn.vietphuc.laptopshop.repository;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.vietphuc.laptopshop.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    @Query("SELECT SUM(od.price * od.quantity) FROM OrderDetail od " +
           "WHERE (UPPER(od.order.status) LIKE '%COMPLETE%' OR UPPER(od.order.status) LIKE '%SUCCESS%') " +
           "AND (:brands IS NULL OR od.product.factory IN :brands) " +
           "AND (:isAllTime = true OR (COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate) >= :startDate " +
           "AND COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate) <= :endDate))")
    Double sumRevenue(@Param("brands") List<String> brands, 
                      @Param("startDate") LocalDateTime startDate, 
                      @Param("endDate") LocalDateTime endDate,
                      @Param("isAllTime") boolean isAllTime);

    @Query("SELECT FUNCTION('DATE_FORMAT', COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate), :format), SUM(od.price * od.quantity) FROM OrderDetail od " +
           "WHERE (UPPER(od.order.status) LIKE '%COMPLETE%' OR UPPER(od.order.status) LIKE '%SUCCESS%') " +
           "AND (:brands IS NULL OR od.product.factory IN :brands) " +
           "AND (:isAllTime = true OR (COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate) >= :startDate " +
           "AND COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate) <= :endDate)) " +
           "GROUP BY FUNCTION('DATE_FORMAT', COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate), :format) " +
           "ORDER BY FUNCTION('DATE_FORMAT', COALESCE(od.order.completeDate, od.order.orderDate, od.order.pendingDate), :format)")
    List<Object[]> getRevenueData(@Param("brands") List<String> brands, 
                                     @Param("startDate") LocalDateTime startDate, 
                                     @Param("endDate") LocalDateTime endDate,
                                     @Param("isAllTime") boolean isAllTime,
                                     @Param("format") String format);
}

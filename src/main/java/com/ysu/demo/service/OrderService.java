package com.ysu.demo.service;

import com.ysu.demo.bean.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderService {
    void insertOrder(Order order);
    void deleteOrder(Integer orderId);
    List<Order> queryAllOrder();
    void saveOCRelation(Integer orderId, Integer carId);
    Order queryOrderById(Integer orderId);
    List<Order> queryOrderByShopName(String shopName);
    List<Order> queryOrderByOpenId(String openId);
    List<Order> queryOrderByShopId2(@Param("shopId") Integer shopId, @Param("orderState") Integer orderState);
    List<Order> queryOrderByShopId3(@Param("shopId") Integer shopId);
    List<Order> queryOrderByShopId4(@Param("shopId") Integer shopId);
    void cancelOrder(Integer orderId);
    void updateOrderState(@Param("orderId") Integer orderId, @Param("orderState") Integer orderState);
    List<Order> queryShopOrder(@Param("shopId")Integer shopId,@Param("orderNumber")Integer orderNumber);
}

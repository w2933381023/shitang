package com.ysu.demo.mapper;

import com.ysu.demo.bean.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface OrderMapper {
  void insertOrder(Order order);
  void deleteOrder(Integer orderId);
  List<Order> queryAllOrder();
  void saveOCRelation(@Param("orderId") Integer orderId, @Param("carId") Integer carId);
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

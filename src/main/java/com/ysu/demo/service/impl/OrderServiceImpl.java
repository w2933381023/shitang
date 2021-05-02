package com.ysu.demo.service.impl;


import com.ysu.demo.bean.Car;
import com.ysu.demo.bean.Order;
import com.ysu.demo.mapper.OrderMapper;
import com.ysu.demo.service.OrderService;
import com.ysu.demo.websocket.WebSocket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private WebSocket webSocket;


    @Override
    public void insertOrder(Order order) {
        orderMapper.insertOrder(order);
        for (Car car:order.getCars()
             ) {
            orderMapper.saveOCRelation(order.getOrderId(),car.getCarId());
        }
        webSocket.sendMessage("新订单");
    }

    @Override
    public void deleteOrder(Integer orderId) {
        orderMapper.deleteOrder(orderId);
    }

    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }

    @Override
    public void saveOCRelation(Integer orderId, Integer carId) {
        orderMapper.saveOCRelation(orderId,carId);
    }

    @Override
    public Order queryOrderById(Integer orderId) {
        return orderMapper.queryOrderById(orderId);
    }

    @Override
    public List<Order> queryOrderByShopName(String shopName) {
        return orderMapper.queryOrderByShopName(shopName);
    }

    @Override
    public List<Order> queryOrderByOpenId(String openId) {
        return orderMapper.queryOrderByOpenId(openId);
    }

    @Override
    public List<Order> queryOrderByShopId2(Integer shopId, Integer orderState) {
        return orderMapper.queryOrderByShopId2(shopId,orderState);
    }

    @Override
    public List<Order> queryOrderByShopId3(Integer shopId) {
        return orderMapper.queryOrderByShopId3(shopId);
    }

    @Override
    public List<Order> queryOrderByShopId4(Integer shopId) {
        return orderMapper.queryOrderByShopId4(shopId);
    }

    @Override
    public void cancelOrder(Integer orderId) {
        orderMapper.cancelOrder(orderId);
        webSocket.sendMessage("取消订单");
    }

    @Override
    public void updateOrderState(Integer orderId, Integer orderState) {
        orderMapper.updateOrderState(orderId,orderState);
    }

    @Override
    public List<Order> queryShopOrder(Integer shopId, Integer orderNumber) {
        return orderMapper.queryShopOrder(shopId,orderNumber);
    }
}

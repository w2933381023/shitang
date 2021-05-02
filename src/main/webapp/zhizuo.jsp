<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title> sss </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="/layui/layui.all.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script>
        layui.use('element', function(){
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
            //监听导航点击
            element.on('nav(demo)', function(elem){
                layer.msg(elem.text());
            });
        });
    </script>
</head>
<body>
<span class="layui-breadcrumb" lay-separator="—">
  <a href="">首页</a>
  <a href="">订单模块</a>
  <a><cite>取餐</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>
</div>
</div>
<table class="layui-table layui-form">
    <thead>
    <tr>
        <th>订单号</th>
        <th>订单菜品详情</th>
        <th>下单时间</th>
        <th>取餐人手机号</th>
        <th>取餐人姓名</th>
        <th>订单状态</th>
        <th>订单总价</th>
        <th>订单备注</th>
        <th>取餐时间</th>
        <th>购买总数量</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <input hidden id="shopid" value="${pageinfo.list[0].shopId}">
    <c:forEach items="${pageinfo.list}" var="str">
        <tr>
            <td>${str.orderNumber }</td>
            <td> <c:forEach items="${str.cars}" var="str1">
                ${str1.dishesName}×${str1.dishesNumber}</br>
            </c:forEach></td>
            <td>${str.orderTime }</td>
            <td>${str.phoneNumber }</td>
            <td>${str.userTrueName }</td>
            <td>
                <c:if test="${str.orderState==0}"><label style="color: red">待支付</label></c:if>
                <c:if test="${str.orderState==1}"><label style="color: red">待接单</label></c:if>
                <c:if test="${str.orderState==2}"><label style="color: red">制作中</label></c:if>
                <c:if test="${str.orderState==3}"><label style="color: red">待取餐</label></c:if>
                <c:if test="${str.orderState==4}"><label style="color: red">已完成</label></c:if>
                <c:if test="${str.orderState==5}"><label style="color: red">已取消</label></c:if>
            </td>
            <td>￥${str.orderPrice}</td>
            <td>
                <c:if test="${str.orderExtra=='undefined'}"><label >空</label></c:if>
                <c:if test="${str.orderExtra!='undefined'}"><label >${str.orderExtra}</label></c:if>
            </td>
            <td>${str.qcTime}</td>
            <td>${str.dishesCount}</td>
            <td> <button type="button"  class="layui-btn layui-btn-normal" onclick="qucan(${str.orderId})">取餐</button>
                <button type="button" class="layui-btn layui-btn-danger" onclick="tuidan(${str.orderId})">拒单</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div class="layui-card-body">
    <a href="<c:url value='/queryOrderByPage2?pn=1'></c:url>">首页</a>
    <c:if test="${pageinfo.hasPreviousPage }">
        <a href="<c:url value='/queryOrderByPage2?pn=${pageinfo.pageNum-1 }'></c:url>">上一页</a>
    </c:if>
    <form action="${pageContext.request.contextPath}/queryDishesByPage2" method="get">
        <input type="text" name="pn" value="${pageinfo.pageNum }"><input
            type="submit" value="跳转">
    </form>
    <c:if test="${pageinfo.hasNextPage }">
        <a
                href="<c:url value='/queryOrderByPage2?pn=${pageinfo.pageNum+1 }'></c:url>">下一页</a>
    </c:if>
    <a
            href="<c:url value='/queryOrderByPage2?pn=${pageinfo.pages }'></c:url>">尾页</a>
    <p>第${pageinfo.pageNum }页 共${pageinfo.pages }页
        总共${pageinfo.total }条记录数
        <%--   弹窗--%>
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">
                        提醒
                    </h4>
                </div>
                <div class="modal-body">
                    你有新的订单
                </div>
                <div class="modal-footer">
                    <button onclick="javascript:document.getElementById('notice').pause()" type="button"
                            class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/queryOrderByShopId2?shopId=1&orderState=0'" type="button" class="btn btn-primary">查看新的订单</button>
                </div>
            </div>
        </div>
    </div>
    <%--   弹窗--%>
    <div class="modal fade" id="myModal1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel1">
                        提醒
                    </h4>
                </div>
                <div class="modal-body">
                    有用户取消订单了
                </div>
                <div class="modal-footer">
                    <button onclick="javascript:document.getElementById('notice1').pause()" type="button"
                            class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button onclick="javascrtpt:window.location.href='${pageContext.request.contextPath}/queryOrderByShopId4'" type="button" class="btn btn-primary">查看取消的订单</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function qucan(id) {
        var shopid=$('#shopid').val();
        $.ajax({
            url:'/qucan',
            data:{
                orderId:id,
            },
            success:function () {
                window.location.href="/queryOrderByShopId3?shopId="+shopid;
            }
        })
    }

    function  tuidan(id) {
        var shopid=$('#shopid').val();
        $.ajax({
            url:'/tuidan',
            data:{
                orderId:id,
            },
            success:function () {
                window.location.href="/queryOrderByShopId3?shopId="+shopid;
            }
        })
    }
</script>
<%--音乐播放--%>
<audio id="notice" loop="loop">
    <source src="/audio/neworders.mp3" type="audio/mpeg"/>
</audio>
<audio id="notice1" loop="loop">
    <source src="/audio/cancel.mp3" type="audio/mpeg"/>
</audio>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/layui/layui.js"></script>
<script src="/js/admin.js"></script>
<script>
    var websocket = null;
    if ('WebSocket' in window) {
        websocket = new WebSocket('ws://localhost:8080/webSocket');
    } else {
        alert('该浏览器不支持websocket!');
    }

    websocket.onopen = function (event) {
        console.log('建立连接');
    }

    websocket.onclose = function (event) {
        console.log('连接关闭');
    }

    websocket.onmessage = function (event) {
        console.log('收到消息:' + event.data)
        if(event.data=='新订单'){
            //弹窗提醒, 播放音乐
            $('#myModal').modal('show');
            document.getElementById('notice').play();
        }
        if(event.data=='取消订单'){
            //弹窗提醒, 播放音乐
            $('#myModal1').modal('show');
            document.getElementById('notice1').play();
        }
    }


    websocket.onerror = function () {
        alert('websocket通信发生错误！');
    }

    window.onbeforeunload = function () {
        websocket.close();
    }

</script>
</body>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
</body>
</html>
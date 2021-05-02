<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="../jquery/jquery-2.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../layui/layui.all.js"></script>
    <script src="../layui/layui.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="../ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
          type="text/css">
    <script src="/jquery/jquery-2.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/layui/layui.all.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
    <script src="/ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="/ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css"
          type="text/css">
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;
        });
    </script>
    <script>
        $(document).ready(function(){
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
        });
    </script>
    <script>
        function onClick(){
            window.location.href="/login.jsp";
            window.parent.location.href="/login.jsp";
        }
    </script>
    <script>

        //IFrame自适应高度
        function reinitIframe(){
            var iframe = document.getElementById("iframeMain");
            try{
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                var height = Math.max(bHeight, dHeight);
                iframe.height =  Math.min(height,1000);
                console.log(height);

            }catch (ex){}
        }
        window.setInterval("reinitIframe()",10);
    </script>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Restaurant</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">食堂后台管理系统</div>

        <!-- 头部区域（可配合layui已有的水平导航） -->
        <div align="right">
            <ul class="layui-nav">
                <li class="layui-nav-item"><a href="indexreflash"><i class="layui-icon" style="font-size: 20px;">&#xe669;</i></a>
                </li>
                <li class="layui-nav-item"><a href=""><img
                        src="//t.cn/RCzsdCq" class="layui-nav-img">${user.userTrueName }
                </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/jsp/user_safe.jsp" target="main_self_frame"><i class="layui-icon">&#xe716;</i>安全管理</a>
                        </dd>
                        <dd>
                            <a onclick="onClick()" ><i class="layui-icon">&#xe682;</i>退出</a>
                        </dd>
                    </dl></li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">店铺模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryShopById1?shopId=${sessionScope.shop.shopId}" >店铺管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryOrderByShopId2?shopId=${sessionScope.shop.shopId}">接单模块</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryOrderByShopId3?shopId=${sessionScope.shop.shopId}">取餐模块</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryOrderByShopId4?shopId=${sessionScope.shop.shopId}">已完成订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">菜品模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryGoodsByShopId2?shopId=${sessionScope.shop.shopId}">新加菜品</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryGoodsByPage3?shopId=${sessionScope.shop.shopId}">分类管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryDishesByPage3?shopId=${sessionScope.shop.shopId}">我的菜品</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryDiscussByPage">菜品评价信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryDishesByPage">店家销售统计</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/verifyDishes.jsp">菜品销售统计</a></dd>
                    </dl>
                </li>
                <%--       <li class="layui-nav-item"><a href="">云市场</a></li>
                       <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="LAY_app_body">
        <div class="layui-tabsbody-item layui-show">
            <iframe id="iframeMain" src="" style="width: 100%"; height="100%";></iframe>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 食堂后台管理系统
    </div>
</div>

</body>
</html>
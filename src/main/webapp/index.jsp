<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="/jquery/jquery-2.1.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/layui/layui.all.js"></script>
    <script src="/layui/layui.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css" type="text/css">
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
            window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
            window.parent.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
            /*window.location.href="queryCategoryByPage.action";*/
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
                //iframe.height = height;
                //iframe.height =  Math.max(height,400);
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
                <li class="layui-nav-item">
                    <a href="">新消息<span class="layui-badge">9</span></a>
                </li>
                <li class="layui-nav-item">
                <li class="layui-nav-item"><a href=""><img
                        src="//t.cn/RCzsdCq" class="layui-nav-img">${user.userTrueName }
                </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath}/user_safe.jsp" target="main_self_frame"><i class="layui-icon">&#xe716;</i>安全管理</a>
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
                    <a class="" href="javascript:;">用户模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryUserByPage" >用户管理</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">菜品模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/queryDishesByPage">菜品管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryDishesByState?dishesState=0">菜品审核</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/queryDiscussByPage">菜品评论管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">店铺模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/queryShopByPage">店家信息管理</a></dd>
                        <dd><a href="addshop.jsp">店铺添加</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/queryOrderByPage">订单信息管理</a></dd>
                        <%--                        <dd><a href="${pageContext.request.contextPath}/jsp/verifyDishes.jsp">菜品销售统计</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">统计模块</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/shopSales">店家销售统计</a></dd>
                        <dd><a href="verifyDishes.jsp">菜品销售</a></dd>
                    </dl>
                </li>

         <%--       <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="LAY_app_body">
        <div class="layui-tabsbody-item layui-show">
            <iframe id="iframeMain" src="" style="width: 100%"; height="3000px";></iframe>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 食堂后台管理系统
    </div>
</div>

</body>
</html>s
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>菜品添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport">
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
</head>
<script type="text/javascript">
    function onClick(){
        window.location.href="shop";
        window.location.href="../queryShopByPage.action";
    }
</script>

<body>
<span class="layui-breadcrumb" lay-separator="—">
  <a href="">首页</a>
  <a href="">菜品模块</a>
  <a><cite>新增分类</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/insertGoods?shopId=${sessionScope.shop.shopId}" method="post"  id="frm-reg">
            <div class="layui-form-item">
                <label class="layui-form-label">分类名称</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="goodsName" id="goodsName" required="true"
                           placeholder="请输入分类名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 50px; width: 200px;float: left;" >
                <button class="layui-btn" type="submit" id="submit" > 确认</button></div>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
    <div style="float: left;width: 200px">
    </div>
    </form>
</div>
</div>
</body>
</html>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.js"></script>
<script src="js/admin.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
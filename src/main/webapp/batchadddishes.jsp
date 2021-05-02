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
  <a><cite>菜品批量添加</cite></a>
</span>
<div>
    <label>&nbsp;</label>
    <div class="layui-fluid">
        <div class="layui-col-md12">
            <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/insertShop" method="post" enctype="multipart/form-data" id="frm-reg">
                <div class="layui-form-item">
                    <div class="layui-input-inline layer-inputs" style="margin-left: 10px;margin-top: 5px">
                        <input name="multipartFile" type="file"/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-left: 50px; width: 200px;float: left;" >
                    <button class="layui-btn" type="submit" id="submit"> 提交</button>
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
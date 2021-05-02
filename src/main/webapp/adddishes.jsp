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
  <a><cite>菜品添加</cite></a>
</span>
<div>
    <label>&nbsp;</label>
    <div class="layui-btn-container" style="float: left;margin-left: 20px;margin-bottom: 20px;margin-top: 20px">
        <a href="${pageContext.request.contextPath}/batchadddishes.jsp"><button type="button"  class="layui-btn" ><i class="layui-icon">批量添加</i></button></a>
    </div>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/insertDishes?shopName=${sessionScope.shop.shopName}&shopId=${sessionScope.shop.shopId}" method="post" enctype="multipart/form-data" id="frm-reg">
            <div class="layui-form-item">
                <label class="layui-form-label">菜品名称</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="dishesName" id="dishesName" required="true"
                           placeholder="请输入菜品名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品价格</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="dishesPrice" id="dishesPrice" required="true"
                           placeholder="请填写菜品价格" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品图片</label>
                <div class="layui-input-inline layer-inputs" style="margin-left: 10px;margin-top: 5px">
                    <input  name="multipartFile" type="file" accept=".png,.jpg"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品分类</label>
                <div class="layui-input-block" style="width: 200px">
                    <select name="goodsId" lay-filter="aihao">
                    <c:forEach  items="${sessionScope.goods}" var="goods">
                        <option value="${goods.goodsId}">${goods.goodsName}</option>
                    </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品简介</label>
                <div class="layui-input-block" style="width:500px">
                    <textarea placeholder="请输入菜品的简介" name="dishesIntroduction" id="dishesIntroduction" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 50px; width: 200px;float: left;" >
                <button class="layui-btn" type="submit" id="submit" > 确认</button></div>
    <div style="float: left;width: 200px">
        <%--                <button type="button" class="layui-btn" id="execute" onclick="onClick()" >返回</button>--%>
    </div>
    </form>
</div>
</div>
<script>
    function sub() {
        if ($('#password').val()!=$('#repassword').val())
        {
            alert("密码输入不一致");
            return;
        }
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.confirm("你确认信息无误了吗",{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url:'${pageContext.request.contextPath}/insertShop'
                    ,type:'post'
                    ,data:$('#form1').serialize()
                    ,dataType:'json'
                    ,success:function (data) {
                        if (data.success==1)
                            layer.alert("添加成功");
                    }
                })
            })
        });

    }
</script>
<script>layui.use(['form', 'layer','jquery'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            pwd1: [/(.+){3,12}$/, '密码必须3到12位'],
            pwd2: function(value) {
                if ($('#password').val() != $('#repassword').val()) {
                    return '两次密码不一致';
                }
            }
        });
        //监听提交
        /*form.on('submit(change)',
            function(data) {
                console.log(data);
                layer.alert('message', {icon: 6});
            });*/
    });
</script>
</body>
</html>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="layui/layui.js"></script>
<script src="js/admin.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8">
    <title>店铺添加</title>
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
    <%
        String categName = request.getParameter("categName");
        String categContent = request.getParameter("categContent");
        String categ_ID = request.getParameter("categ_ID");
    %>
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
  <a href="">店铺模块</a>
  <a><cite>店铺添加</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>
<div class="layui-fluid">
    <div class="layui-col-md12">
        <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/insertShop" method="post" enctype="multipart/form-data" id="frm-reg">
            <div class="layui-form-item">
                <label class="layui-form-label">店铺账号</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="userName" id="userName" required="true"
                           placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="password" class="layui-form-label">
                    <span class="x-red">*</span>密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password" lay-verify="pwd1" placeholder="请输入密码" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux"></div>
            </div>
            <div class="layui-form-item">
                <label for="repassword" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="repassword" name="repassword" lay-verify="pwd2" placeholder="请再输入一次密码" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店铺名称</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="shopName" id="shopName" required="true"
                           placeholder="请输入店铺名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">负责人姓名</label>
                <div class="layui-input-inline layer-inputs">
                    <input type="text" name="masterName" id="masterName" required="true"
                           placeholder="请填写负责人姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline layer-inputs">
                <input type="text" name="contactNumber" id="contactNumber" required="true"
                       placeholder="请填写联系人电话" class="layui-input">
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店铺图片</label>
                <div class="layui-input-inline layer-inputs" style="margin-left: 10px;margin-top: 5px">
                    <input  name="multipartFile" type="file" accept=".png,.jpg"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">店铺简介</label>
                <div class="layui-input-block">
                    <textarea placeholder="请描述一下店铺哦~" class="layui-textarea" name="shopIntroduction" id="shopIntroduction"></textarea>
                </div>
            </div>




            <div class="layui-form-item" style="margin-left: 50px; width: 200px;float: left;" >
                <button class="layui-btn" type="submit" id="submit" > 确认</button></div>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
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
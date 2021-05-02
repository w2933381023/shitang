<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户安全</title>
    <script src="../jquery/jquery-2.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../layui/layui.all.js"></script>
    <script src="../layui/layui.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="../ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
          type="text/css">
</head>

<body>

<%
    String mess=(String)session.getAttribute("sucess_mess");
    if("".equals(mess) || mess==null){
}
 else{%>
    <script type="text/javascript">
        alert("<%=mess%>");
</script>
<%
    session.setAttribute("sucess_mess", "");}
%>
<script>
function onClick(){
   window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
   window.parent.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
/*window.location.href="queryCategoryByPage.action";*/
}
</script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<span class="layui-breadcrumb" lay-separator="—">
  <a href="">首页</a>
  <a href="">用户安全</a>
  <a><cite>用户信息变更</cite></a>
</span>
<div>
    <label>&nbsp;</label>
</div>
<form class="layui-form" action="${pageContext.request.contextPath}/userSafe" target="_top">
 <div class="layui-form-item">
    <label class="layui-form-label">真实名:</label>
    <div class="layui-input-inline" >
      <input type="text" name="userTrueName"  style="width:190px" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号:</label>
        <div class="layui-input-inline" >
            <input type="tel" name="phoneNumber"  style="width:190px" placeholder="请输入手机号" autocomplete="off" class="layui-input">
        </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">原密码:</label>
    <div class="layui-input-inline">
      <input type="password" name="oldpassword"   placeholder="请输入原密码" autocomplete="off" class="layui-input" required>
    </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">新密码:</label>
    <div class="layui-input-inline">
      <input type="password" name="password"   placeholder="请输入新密码" autocomplete="off" class="layui-input" required>
    </div>
    </div>
    <div class="layui-form-item">
    <div class="layui-input-block">
        <input type="submit" class="layui-btn" id="execute" onclick="javascript:return confirm('确定信息无误了吗？');">
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
    </form>
</body>
</html>
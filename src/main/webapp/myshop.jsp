<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <title> sss </title>
    <%--<script type="text/javascript">
        // 函数名为 runoob
        window.onload=function runoob(){
            window.location.href="queryUserById";
        }
    </script>--%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="../jquery/jquery-2.1.1.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../layui/layui.all.js"></script>
    <script src="../layui/layui.js"></script>
    <link rel="stylesheet" href="../layui/css/layui.css" type="text/css">
    <script src="../ztree/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" href="../ztree/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css"
          type="text/css">
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
</head>
<body>
<span class="layui-breadcrumb" lay-separator="—">
  <a href="">首页</a>
  <a href="">店铺模块</a>
  <a><cite>店铺管理</cite></a>
</span>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6" style="width: 100%">
            <div class="layui-card" style="margin-left: 400px;width: 1000px">
                <div class="layui-card-header" style="color: red;font-size: 20px">店铺信息一览</div>
                <form class="layui-card-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">店铺编号</label>
                        <div class="layui-input-inline">
                            <input type="text"  name="shopId" readonly lay-verify="required" value="${shop.shopId}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">店铺名称</label>
                        <div class="layui-input-inline">
                            <input type="text"  name="shopName" lay-verify="required" value="${shop.shopName}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">负责人姓名</label>
                        <div class="layui-input-inline">
                            <input type="text"  name="username" lay-verify="required" value="${shop.masterName}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">店铺联系电话</label>
                        <div class="layui-input-inline">
                            <input type="text"  name="contactNumber" lay-verify="required" value="${shop.contactNumber}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">店铺简介</label>
                        <div class="layui-input-inline">
                            <input type="text" style="width: 700px" name="shopIntroduction" lay-verify="required" value="${shop.shopIntroduction}" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: auto">店铺图片</label>
                        <div class="layui-input-inline">
                            <img  style="width: 100px;height: 100px" src="/images/${shop.shopImage}" alt="没找到">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">修改信息</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
                </form>
                </div>
            </div>
        </div>
    </div>
</div>


        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="layui/layui.js"></script>
        <script src="js/admin.js"></script>


<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
      type="text/css">
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
</body>
</html>

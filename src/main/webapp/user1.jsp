<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户维护</title>
<script src="jquery/jquery-2.1.1.min.js" charset="utf-8"></script>
<script src="bootstrap/js/bootstrap.min.js" charset="utf-8"></script>
<script src="layui/layui.all.js" charset="utf-8"></script>
<script src="layui/layui.js" charset="utf-8"></script>
<script src="js/laydate.js" charset="utf-8"></script>
<link rel="stylesheet" href="layui/css/layui.css" type="text/css">
<script src="ztree/jquery.ztree.all-3.5.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="ztree/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="css/laydate.css"
	type="text/css">
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
});
layui.use(['laypage', 'layer','element','table','form','util','laydate'], function(){
    var laypage = layui.laypage;
    var layer = layui.layer;
    var element = layui.element;
    var table = layui.table;
    var util=layui.util;
    var form = layui.form;
    var laydate = layui.laydate;});
</script>
</head>
<body>
	<div class="layui-col-md12">
		<div class="layui-navs">
			<span class="layui-breadcrumb" lay-separator="—"> 
				<a href="javascript:;">Restaurant</a>
				<a href="javascript:;">权限设置</a> 
				<a><cite>用户维护</cite></a>
			</span>
		</div>
	</div>
	<div class="layui-col-md12">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form layui-form-pane" method="post" action="insertUser2" id="frm-reg" >
				<div class="layui-form-item">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="userName" id="userName"  required="required" placeholder="请输入用户名" class="layui-input">
						</div>
					</div>
				<div class="layui-form-item">
						<label class="layui-form-label">真实姓名：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="text" name="userTrueName" id="userTrueName" required="required" placeholder="请输入真实姓名" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码：</label>
						<div class="layui-input-inline layer-inputs">
							<input type="password" name="password" id="password"  required="required" placeholder="请输入密码" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-form-1" style="margin-left: 50px;width: 200px;float: left;">
						<button type="submit" class="layui-btn" id="execute"><i class="layui-icon layui-icon-form"></i>保存</button>
						</div>
						<div class="layui-form-2" style="margin-left: 50px;width: 200px;float: left;" >
						<button type="reset" class="layui-btn" id="execute"><i class="layui-icon layui-icon-form"></i>重置</button>
						</div>
					</div>

					
				</form>
			</div>
		</div>
	</div>
	<div class="demoTable">
		搜索用户名：
		<div class="layui-inline">
			<input class="layui-input" name="userId" id="demoReload"
				autocomplete="off">
		</div>
		<button class="layui-btn" data-type="reload">搜索</button>
	</div>

	<div class="layui-col-md12">
		<div><table id="demo" lay-filter="table" ></table></div>

	</div>
<div id="barDemo" style="display:none;">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="authmang">权限管理</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="rolemang">角色管理</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
  </div>
  <div id="test1" class="demo-transfer"></div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
</fieldset>
<script>
layui.use(['transfer','laypage', 'layer','element','table','form','util','laydate'], function(){
	var $ = layui.$;
	var transfer = layui.transfer;
	var laypage = layui.laypage;
    var layer = layui.layer;
    var element = layui.element;
    var table = layui.table;
    var util=layui.util;
    var form = layui.form;
    var laydate = layui.laydate;
  table.render({
	    elem: '#demo'
	    ,height: 600
	    ,url: 'queryUserByPage' //数据接口
	    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
		      layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
	      ,curr: 1//设定初始在第 5 页
	      ,groups: 5 //只显示 1 个连续页码
	      ,first: false //不显示首页
	      ,last: false //不显示尾页 
	    }
	    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
	    ,totalRow: true //开启合计行
	    ,cols: [[ //表头
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'userId', title: '用户ID', width:100, sort: true, fixed: 'left'}
	      ,{field: 'userName', title: '用户名', width:80, sort: true}
	      ,{field: 'password', title: '密码', width:100}
	      ,{field: 'userTrueName', title: '真实姓名', width:120, sort: true}
	      ,{fixed: 'right', width: 300, align:'center', toolbar: '#barDemo'}
	    ]]
	    ,id: 'testReload'
	  });	
table.on('tool(table)',function(obj){
	var data = obj.data
	var layEvent=obj.event;
	if(layEvent==='del')
		{
		if(confirm('是否确定要删除？'))
			{
			obj.del();
			EidtUv(data,obj);
			}
		}
	if(layEvent==='edit')
		{
		layer.open({
            type: 2,
            title: '编辑',
            maxmin: true,
            area: ['500px', '450px'],
            shadeClose: false, //点击遮罩关闭
            content: 'queryUserById?userId='+data.userId,
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
                table.reload('testReload', {page: {
                	    curr: 1 //重新从第 1 页开始
                	  }
                	});
            }
        });
		}
	if(layEvent==='authmang'){
		layer.open({
            type: 2,
            title: '权限管理',
            maxmin: true,
            area: ['700px', '500px'],
            shadeClose: false, //点击遮罩关闭
            content: 'userauth?userId='+data.userId,
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
                table.reload('testReload', {page: {
                	    curr: 1 //重新从第 1 页开始
                	  }
                	});
            }
        });
	}
	if(layEvent==='rolemang'){
		layer.open({
            type: 2,
            title: '角色管理',
            maxmin: true,
            area: ['700px', '500px'],
            shadeClose: false, //点击遮罩关闭
            content: 'userrole?userId='+data.userId,
            btn: ['退出'],
            yes: function(index){
                //事件
                layer.close(index);
                table.reload('testReload', {page: {
                	    curr: 1 //重新从第 1 页开始
                	  }
                	});
            }
        });
	}
});
function  EidtUv(data,obj) {
	$.ajax({
		url: "deleteUser",
		type: "POST",
		data:{"userId":data.userId},    //这个是传给后台的值
		dataType: "json",
		success: function(data){
		}
	});
}
var $ = layui.$, active = {
	    reload: function(){
	      var demoReload = $('#demoReload');
	      
	      //执行重载
	      table.reload('testReload', {
	        page: {
	          curr: 1 //重新从第 1 页开始
	        }
	        ,where: {
	        	userName: demoReload.val()
	        }
	      }, 'data');
	    }
	  };
$('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
</body>
</html>
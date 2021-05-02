<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>在线答题考试系统</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="css/test.css" rel="stylesheet" type="text/css" />
<script src="jquery/jquery-2.1.1.min.js"></script>
<style>
.hasBeenAnswer {
	background: #5d9cec;
	color: #fff;
}
</style>

</head>
<body>
	<div class="main">
		<!--nr start-->
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<form action="judge.action" id="frm">
						<div class="test_title">
							<p class="test_time">
								<b class="alt-1">${time}</b>
							</p>
							<font><input type="submit" name="test_jiaojuan" value="交卷"></font>
						</div>

						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">${test.quesNum}</i><span>题，</span><span>合计</span><i
										class="content_fs">${test.grade*test.quesNum}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
						
							<ul>
								<c:forEach items="${questions}" var="ques" varStatus="i">
								<li id="qu_0_${i.index+1}">
									<div class="test_content_nr_tt">
										<i>${i.index+1}</i><span></span><font>${ques.quesContent}</font>
									</div>

									<div class="test_content_nr_main">
										<ul>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer${i.index+1}" id="0_answer_${i.index+1}_option_1"
												value="A" /> <label for="0_answer_${i.index+1}_option_1"> A.
													<p class="ue" style="display: inline;">${ques.selectionA}</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer${i.index+1}" id="0_answer_${i.index+1}_option_2" 
												value="B"/>
												<label for="0_answer_${i.index+1}_option_2"> B.
													<p class="ue" style="display: inline;">${ques.selectionB}</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer${i.index+1}" id="0_answer_${i.index+1}_option_3" 
												value="C"/>
												<label for="0_answer_${i.index+1}_option_3"> C.
													<p class="ue" style="display: inline;">${ques.selectionC}</p>
											</label></li>

											<li class="option"><input type="radio"
												class="radioOrCheck" name="answer${i.index+1}" id="0_answer_${i.index+1}_option_4" 
												value="D"/>
												<label for="0_answer_${i.index+1}_option_4"> D.
													<p class="ue" style="display: inline;">${ques.selectionD}</p>
											</label></li>

										</ul>
									</div>
								</li>
								</c:forEach>
							</ul>
							
							<div style="text-align: center; margin: 50px 0; font: normal 24px/24px 'MicroSoft YaHei';">
								<p>已经是最后一题啦</p>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="nr_right">
				<div class="nr_rt_main">
					<div class="rt_nr1">
						<div class="rt_nr1_title" >
							<h1>答题卡</h1>
							<p class="test_time">
								<b class="alt-1">${time}</b>
							</p>
						</div>

						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">3</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${questions}" var="$ques" varStatus="i">
										<li><a href="#qu_0_${i.index+1}">${i.index+1}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--nr end-->
		<div class="foot"></div>
	</div>
	<script src="js/jquery.easy-pie-chart.js"></script>
	<!--时间js-->
	<script src="js/jquery.countdown.js"></script>
	
	<script>
	

	
	window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		
	});
	
	$(function() {
		$('li.option label').click(function() {
		debugger;
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			
		});
	});
</script>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
  <body onload="showTime()"><!--body加载时调用方法shwoTime() -->
<div id="left" style="width:160px; height:230px;">
	<img src="images/left_top.jpg" width="155px" height="230px" /> <br/><br/>
	<!--显示当前时间 -->
	<span id="nowTime" style="font-size:14px;"></span><br/>
	<!--显示当前时间的方法， -->
	<script language="javascript">
		function showTime()
		{
			var time=new Date();
			var year=time.getYear();
			var month=time.getMonth();
			var date=time.getDate();
			var day=time.getDay();
			var week=null;
			switch(day)
			{
				case 1:
					week="一";
					break;
				case 2:
					week="二";
					break;
				case 3:
					week="三";
					break;
				case 4:
					week="四";
					break;
				case 5:
					week="五";
					break;
				case 6:
					week="六";
					break;
				case 0:
					week="日";
					break;
			}
			document.getElementById("nowTime").innerHTML=(month+1)+"月"+date+"日"+"  "+"星期"+week;
		}
	</script>
	<br/>
	<div style="width:155px; height:4px; background-image:url(images/003.gif); background-repeat:repeat-x;">
	</div>
	<br/>
	<div style="width:155px; height:4px; background-image:url(images/003.gif); background-repeat:repeat-x;">
	</div>
</div>
</body>


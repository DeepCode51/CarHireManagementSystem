$(function() {
	//两种方式
/*	 $.getJSON('line.do', function (data) { 
		 var myChart = echarts.init(document.getElementById('psLine'));
			myChart.setOption(data, true);
	 });*/
	$.ajax({
		type : "POST",
		url : ctx+"/repairMaterials_toReport.do",
		dataType : "json",
		success : function(data) {
			var myChart = echarts.init(document.getElementById('repairMaterials'));
			myChart.setOption(data, true);
		}
	});
//	$.ajax({
//		type : "POST",
//		url : ctx+"/manage_reportSay.do",
//		dataType : "json",
//		success : function(data) {
//			var myChart = echarts.init(document.getElementById('say'));
//			myChart.setOption(data, true);
//		}
//	});
	
});
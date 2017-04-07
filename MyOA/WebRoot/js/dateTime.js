function disptime() {
	var time = new Date(); //获得当前时间  
	// var year = time.getYear( );//获得年、月,日
	var year = time.getFullYear();

	var month = time.getMonth() + 1;
	//获得星期 
	var xingqi = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六")[time
			.getDay()];

	var day = time.getDate();

	var hour = time.getHours(); //获得小时、分钟、秒   
	var minute = time.getMinutes();
	var second = time.getSeconds();
	var apm = "AM"; //默认显示上午: AM        
	if (hour > 12) //按12小时制显示   
	{
		hour = hour - 12;
		apm = "PM";
	} //如果分钟只有1位，补0显示      
	if (minute < 10) {
		minute = "0" + minute;
	}
	if (second < 10) //如果秒数只有1位，补0显示    
		second = "0" + second;
	document.getElementById("myclock").innerHTML = year + "年" + month + "月"
			+ day + "日  " + hour + ":" + minute + ":" + second + " " + apm
			+ "  " + xingqi; 
	var mytime = setTimeout(disptime,1000);
}
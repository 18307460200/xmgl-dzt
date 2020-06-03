/**
 * 交易日历的相关操作
 */
define(function(require, exports, module) {
	/**
	 * 构造函数
	 */
	function Calendar(calendarId, calendarConfig) {
		mini.parse();
		this.calendarConfig = calendarConfig || {};
		this.yesColor = this.calendarConfig["yesColor"] || "green";
		this.noColor = this.calendarConfig["noColor"] || "red";
		this.isTrade = this.calendarConfig["isTrade"] != "false";
		this.calendarDiv = $("#"+calendarId);
		this.year = this.calendarConfig["year"] || $.date.getCurrentYear();
		this.name = this.calendarConfig["name"] || calendarId;
		this.valueMap = {};
		this.isFirstFlag = false;
	};

	/**
	 * 初始化界面
	 */
	Calendar.prototype.loadViewConfig = function() {
		// 绑定事件
		this.onRegister();
		// 创建日历
		//this.createCalendar();
	};

	/**
	 * 创建日历
	 */
	Calendar.prototype.createCalendar = function(){
		var value = this.getValue();
		this.isFirstFlag = $.string.isEmpty(value);
		for(var i = 1; i <= 12; i ++){
			var miniCalendar = mini.get(this.name + i);
			var month = i + "";
			if(i < 10){
				month = "0" + i;
			}
			miniCalendar.setViewDate(this.year + "-" + month);
			miniCalendar.setValue("");
			$("#"+miniCalendar.id).find(".mini-calendar-title").attr("class","mini-calendar-title1");
			$("#"+miniCalendar.id).find(".mini-calendar-today").removeClass("mini-calendar-today");
			$("#"+miniCalendar.id).find(".mini-calendar-footer").hide();
			$("#"+miniCalendar.id).show();
		}
	};
	
	/**
	 * 绑定事件
	 */
	Calendar.prototype.onRegister = function(){
		var onDrawDateFunc = $.bindFunc(this.onDrawDateFunc, this);
		var onDateClickFunc = $.bindFunc(this.onDateClickFunc, this);
		for(var i = 1; i <= 12; i ++){
			var miniCalendar = mini.get(this.name + i);
			miniCalendar.on("drawdate",onDrawDateFunc);
			miniCalendar.on("dateclick",onDateClickFunc);
		}
	};
	
	/** ***********************************日历组件相关公开API，一般需要给外面对象调用*********************************** */
	
	/**
	 * 重新加载页面
	 */
	Calendar.prototype.refresh = function() {
		this.createCalendar();
	};
	
	/**
	 * 设置内容
	 */
	Calendar.prototype.setValue = function(value) {
		value += "";
		if($.string.isEmpty(value)){
			value = "";
		}
		var dates = value.split(",");
		if(!dates){
			dates = [];
		}
		if(dates && dates.length > 0){
			var date = dates[0] + "";
			var temp = date.split("-");
			var year = temp[0];
			if($.string.isNotEmpty(year)){
				this.year = year;
			}
		}
		if(value.indexOf("-") < 0){
			this.valueMap[this.year] = [];
		}else{
			this.valueMap[this.year] = dates;
		}
		this.createCalendar();
	};

	/**
	 * 获取内容
	 */
	Calendar.prototype.getValue = function() {
		var dates = this.valueMap[this.year];
		if(!dates){
			return "";
		}
		dates.sort();
		return dates.join(",");
	};

	/**
	 * 获取选择的日期数组
	 * @returns
	 */
	Calendar.prototype.getSelectedDates = function() {
		var dates = this.valueMap[this.year];
		if(!dates){
			dates = [];
		}
		return dates;
	};
	
	/**
	 * 设置年
	 */
	Calendar.prototype.setYear = function(year) {
		this.year = year;
		this.createCalendar();
	};
	

	/*************************************日历对象事件私有处理，一般不需要给外面对象调用*********************************** */

	/**
	 * 日历绘制事件
	 */
	Calendar.prototype.onDrawDateFunc = function(e) {
		e.dateStyle = "";
		var calendar = e.sender;
		var viewDate =  $.date.formatDate1(calendar.getViewDate(),"YYYY-MM");
		var id = calendar.id;
		var date = $.date.formatDate1(e.date,"YYYY-MM-DD");
		if(date.indexOf(viewDate) < 0){
			e.allowSelect = false;
		}else{
			var noStyle = "background:" + this.noColor+";color:#fff";
			var yesStyle = "background:" + this.yesColor+";color:#000";
			var week = e.date.getDay();
			if(this.isTrade){
				if(week == 0 || week == 6){
					e.allowSelect = false;
					e.dateStyle += "text-decoration:blink;";
				}
			}
			var dates = this.getSelectedDates();
			if(this.isFirstFlag){
				if(week == 0 || week == 6){
					e.dateStyle += noStyle +";";
				}else{
					e.dateStyle += yesStyle + ";";
				}
				if(e.dateStyle.indexOf(noStyle) > -1){
					$.array.removeByValue(dates,date);
				}else{
					if($.array.indexOf(dates,date) < 0){
						dates.push(date);
					}
				}
				this.valueMap[this.year] = dates;
			}else{
				if($.array.indexOf(dates,date) < 0){
					 e.dateStyle += noStyle + ";";
				}else{
					 e.dateStyle += yesStyle + ";";
				}
			}
			calendar[date]= e.dateStyle;
		}
	};
	
	/**
	 * 日历点击事件
	 */
	Calendar.prototype.onDateClickFunc = function(e) {
		var calendar = e.sender;
		var id = calendar.id;
		var date = $.date.formatDate1(e.date,"YYYY-MM-DD");
		var value = this.getValue();
		var dateStyle = calendar[date];
		var noStyle = "background:" + this.noColor;
		var yesStyle = "background:" + this.yesColor;
		var dates = this.getSelectedDates();
		if(dateStyle.indexOf(noStyle) > -1){
			if($.array.indexOf(dates,date) < 0){
				dates.push(date);
			}
		}else{
			$.array.removeByValue(dates,date);
		}
		this.valueMap[this.year] = dates;
		this.isFirstFlag = (dates.length == 0);
		calendar.setViewDate(calendar.getViewDate());
		$("#"+id).find(".mini-calendar-today").removeClass("mini-calendar-today");
		$("#"+id).find(".mini-calendar-title").attr("class","mini-calendar-title1");
		$("#"+id).find(".mini-calendar-footer").hide();
	};
	
	/**
	 * 释放内存工作
	 */
	Calendar.prototype.destroy = function() {
	};

	window.Calendar = Calendar;
	// 暴露对外的接口
	module.exports = Calendar;
	
});
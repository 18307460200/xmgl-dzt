/**
 * Chart图表的相关操作
 */
define(function(require, exports, module) {
	require("plugins/chart/echarts-all.js");
	var FrameService = require("plugins/frame/scripts/service/frameService");

	/**
	 * 构建树 参数： treeId：树组件的id treeConfig：相关配置
	 */
	function Chart(chartId, chartConfig) {
		mini.parse();
		// 网络通信层
		this.frameService = FrameService.getInstance();
		// jQuery对象Chart
		this.chart = $("#" + chartId);
		//echart对象
		this.myChart = echarts.init(this.chart.get(0)); 
		//图形的配置
		this.chartConfig = chartConfig;
		// 浏览器上面的入参
		this.urlParam = mini.getParams() || {};
		// 上次加载的参数
		this.localParam = {};
	}

	/**
	 * 初始化树的数据
	 */
	Chart.prototype.loadViewConfig = function() {
		if (this.chartConfig["initFunc"]) {
			eval(this.chartConfig["initFunc"] + "()");
		}
		if (this.chartConfig["isLoad"] != "false") {
			this.loadData();
		}
	};

	/** ***********************************画图加载数据的相关公开API，一般需要给外面对象调用*********************************** */

	/**
	 * 重新加载页面
	 */
	Chart.prototype.refresh = function() {
		this.loadData();
	};
	
	/**
	 * 加载数据
	 * 
	 * @param param
	 */
	Chart.prototype.loadData = function(param,chart_type) {
		this.myChart.clear(); 
		var This = this;
		if($.string.isNotEmpty(chart_type)){
			This.chartConfig["chart_type"] = chart_type;
		}
		var reqParam = {};
		if (this.localParam) {
			$.copyObjToObj(this.localParam, reqParam);
		}
		var inputs = this.chartConfig["inputs"];
		if ($.string.isNotEmpty(inputs)) {
			inputs = eval("({" + inputs + "})");
			for ( var key in inputs) {
				var value = inputs[key]+"";
				if ($.string.isEmpty(value)) {
					value = This.urlParam[key];
				}else{
					value = value.replace(/\$(.*?)\$/g,
							function(p0, p1, p2) {
								return This.urlParam[p1];;
							});
				}
				if ($.string.isEmpty(value)) {
					value = "";
				}
				reqParam[key] = value;
			}
		}
		if (this.chartConfig["paramFunc"]) {
			var funcParam = eval(this.chartConfig["paramFunc"] + "()");
			if (funcParam) {
				$.copyObjToObj(funcParam, reqParam);
			}
		}
		if (param) {
			$.copyObjToObj(param, reqParam);
		}
		var queryDataComplete = function(resultVo) {
			This.myChart.hideLoading();
			This.localParam = resultVo.getReqParamVo().getReqParam();
			if (resultVo.getErrorNo() == 0) {
				var chart_type = This.chartConfig["chart_type"];
				if(chart_type == "line" || chart_type == "bar"){
					//画折线,柱子
					This.drawLineBarChart(resultVo);
				}else if(chart_type == "pie"){
					//画饼图
					This.drawPieChart(resultVo);
				}else if(chart_type == "funnel"){
					//画漏洞图
					This.drawFunnelChart(resultVo);
				}
				if (This.chartConfig["loadDataCallBackFunc"]) {
					eval(This.chartConfig["loadDataCallBackFunc"] + "("+$.jsonToStr(resultVo.obj)+")");
				}
			}
		};
		var eventNo = this.chartConfig["eventNo"];
		var isAsync = this.chartConfig["isAsync"] != "false";
		var rightId = this.chartConfig["rightId"];
		var url = this.chartConfig["url"];
		if($.string.isNotEmpty(eventNo) || $.string.isNotEmpty(url)){
			This.myChart.showLoading({
			    text: '读取数据中...'   //loading话术
			});
			This.frameService.processQueryList(queryDataComplete, eventNo,reqParam, rightId, isAsync,url);
		}
	};

	/** ***********************************画图的相关私有API，一般不需要给外面对象调用*********************************** */
	
	/**
	 * 画折线,柱子
	 */
	Chart.prototype.drawLineBarChart = function(resultVo) {
		var This = this;
		var chart_type = This.chartConfig["chart_type"] || "line";
		var option = {};
		if (this.chartConfig["optionFunc"]) {
			option = eval(this.chartConfig["optionFunc"] + "("+$.jsonToStr(resultVo.obj)+")");
		}else{
			option["title"] = {
				     text: This.chartConfig["chart_title"] || ""
			    };
				option["tooltip"] = {
				     trigger: chart_type == 'line' ? 'axis' : 'item'
			    };
				var legend_key = This.chartConfig["legend_key"] || "legend_data";
				var legend_result = resultVo.getResults(legend_key) || [];
				var legend_data = [];
				if(legend_result && legend_result.length > 0){
					for(var i = 0; i < legend_result.length; i ++){
						legend_data.push(legend_result[i].value);
					}
				}
				option["legend"] = {
			        data: legend_data
			    };
				option["toolbox"] = {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    };
//				option["calculable"] = true;
				var xAxis_key = This.chartConfig["xAxis_key"] || "xAxis_data";
				var xAxis_result = resultVo.getResults(xAxis_key) || [];
				var xAxis_data = [];
				if(xAxis_result && xAxis_result.length > 0){
					for(var i = 0; i < xAxis_result.length; i ++){
						xAxis_data.push(xAxis_result[i].value);
					}
				}
				var xAxis_name = This.chartConfig["xAxis_name"] || "";
				option["xAxis"] = [{
		            type : 'category',
		            data : xAxis_data,
		            name : xAxis_name
		        }];
				var yAxis_name = This.chartConfig["yAxis_name"] || "";
				var yAxis_splitNumber = This.chartConfig["yAxis_splitNumber"] ? parseInt(This.chartConfig["yAxis_splitNumber"]) : 5;
				option["yAxis"] = [{
		            type : 'value',
		            name : yAxis_name,
		            splitNumber : yAxis_splitNumber
		        }];
				var data_key = This.chartConfig["data_key"] || "dataResultKey";
				var value_filed = This.chartConfig["value_filed"] || "value";
				option["series"] = function(){
			    	var serie = [];
			    	var dataResult = resultVo.getResults(data_key) || [];
			    	var dataResultKey = [];
			    	if(dataResult && dataResult.length > 0){
			    		for(var i = 0; i < dataResult.length; i ++){
			    			dataResultKey.push(dataResult[i].value);
			    		}
			    	}
		       	    if(dataResultKey.length > 0){
		       			for (var j = 0; j < dataResultKey.length; j ++) {
		       				var dataResult = dataResultKey[j];
		       				var dataList = resultVo.getResults(dataResult) || [];
		       				var item = {
				    			name : legend_data[j],
				    			type : chart_type,
				    			data : function(){
							       	var yList = [];
						       		for(var i = 0;i < dataList.length; i ++){
						       			var data = dataList[i];
						       			yList.push(data[value_filed]);
						       		}
							        return yList;
						       }()
				    		};
				    		serie.push(item);
		       			}
		  			}
			    	return serie;
			    }();
		}
        if(option["xAxis"] && option["xAxis"].length > 0 && option["xAxis"][0]["data"] && option["xAxis"][0]["data"].length > 0){
	        this.myChart.setOption(option); 
        }else{
    	   this.chart.html("<p  style='font-size:12px;color:red;padding-top:10px;'>未查询到数据</p>");
        }
	};
	
	/**
	 * 画饼图
	 */
	Chart.prototype.drawPieChart = function(resultVo) {
		var This = this;
		var option = {};
		if (this.chartConfig["optionFunc"]) {
			option = eval(this.chartConfig["optionFunc"] + "("+$.jsonToStr(resultVo.obj)+")");
		}else{
			option["title"] = {
					 x : 'center',
				     text: This.chartConfig["chart_title"] || "",
				     subtext:''
			    };
				option["tooltip"] = {
				     trigger: 'item'
			    };
				var dataList = resultVo.getResults() || [];
				var legend_data = [];
				var series_data = [];
				var text_filed = This.chartConfig["text_filed"] || "text";
				var value_filed = This.chartConfig["value_filed"] || "value";
				if(dataList && dataList.length > 0){
					for(var i = 0; i < dataList.length; i ++){
						var data = dataList[i];
						var name = data[text_filed];
						var value = data[value_filed];
						legend_data.push(name);
						series_data.push({'name':name,'value':value});
					}
				}
				option["legend"] = {
					orient: 'vertical',
					x : 'left',
			        data: legend_data
			    };
				option["toolbox"] = {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: []},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    };
				var startAngle = This.chartConfig["startAngle"] ? parseInt(This.chartConfig["startAngle"]) : 0;
				option["series"] = function(){
			    	var item = {
		    			type : 'pie',
		    			data : series_data,
		    			selectedMode: true,
		    			startAngle: startAngle
		    		};
			    	return [item];
			    }();
		}
        if(resultVo.getResults() && resultVo.getResults().length > 0){
	        this.myChart.setOption(option); 
        }else{
    	   this.chart.html("<p  style='font-size:12px;color:red;padding-top:10px;'>未查询到数据</p>");
        }
	};
	
	/**
	 * 画漏洞图
	 */
	Chart.prototype.drawFunnelChart = function(resultVo) {
		var This = this;
		var option = {};
		if (this.chartConfig["optionFunc"]) {
			option = eval(this.chartConfig["optionFunc"] + "("+$.jsonToStr(resultVo.obj)+")");
		}else{
			option["title"] = {
					 x : 'center',
				     text: This.chartConfig["chart_title"] || "",
				     subtext:''
			    };
				option["tooltip"] = {
				     trigger: 'item',
				     formatter: function(data){
		             	return data.data["name"] + ":" + data.data["value"] + "(" + data.data["percent"] + ")";
		             }
			    };
				option["toolbox"] = {
			        show : false,
			        feature : {
			        	mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: []},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    };
				var dataList = resultVo.getResults() || [];
				var legend_data = [];
				var series_data = [];
				var text_filed = This.chartConfig["text_filed"] || "text";
				var value_filed = This.chartConfig["value_filed"] || "value";
				var percent_filed = This.chartConfig["percent_filed"] || "percent";
				if(dataList && dataList.length > 0){
					for(var i = 0; i < dataList.length; i ++){
						var data = dataList[i];
						var name = data[text_filed];
						var value = data[value_filed];
						var percent = data[percent_filed];
						legend_data.push(name);
						series_data.push({'name':name,'value':value,"percent":percent});
					}
				}
				option["legend"] = {
					orient: 'vertical',
					x : 'left',
			        data: legend_data
			    };
				option["series"] = function(){
			    	var item = {
		    			type:'funnel',
			            x: '10%',
			            width: '80%',
			            maxSize: '80%',
			            itemStyle: {
			                normal: {
			                    borderColor: '#fff',
			                    borderWidth: 2,
			                    label: {
			                        position: 'inside',
			                        formatter: function(data){
			                        	return data.data["percent"];
			                        },
			                        textStyle: {
			                            color: '#fff'
			                        }
			                    }
			                },
			                emphasis: {
			                    label: {
			                        position:'inside',
			                        formatter: function(data){
			                        	return data.data["name"];
			                        }
			                    }
			                }
			            },
		    			data : series_data
		    		};
			    	return [item];
			    }();
		}
        if(resultVo.getResults() && resultVo.getResults().length > 0){
	        this.myChart.setOption(option); 
        }else{
    	   this.chart.html("<p  style='font-size:12px;color:red;padding-top:10px;'>未查询到数据</p>");
        }
	};
	
	/**
	 * 释放内存工作
	 */
	Chart.prototype.destroy = function() {
		this.frameService.destroy();
		// 图表清空
		this.myChart.clear();
		// 图表释放
		this.myChart.dispose();
	};

	window.Chart = Chart;
	
	// 暴露对外的接口
	module.exports = Chart;
});
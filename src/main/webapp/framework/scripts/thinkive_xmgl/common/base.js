
//下拉选择框
jQuery.fn.ThinkSelectBox = jQuery.fn.sBox = function(options){
	options = jQuery.extend({
		mainCSS:{},
		selectClass:"input_sele",
		textClass:"value",
		optionClass:"list",
		zIndex:10,
		resetzIndex:true
	}, options || {});
	var _self = this;
	var _parent = _self.parent();
	var wrapHtml = '<span class="' + options.selectClass + '"></span>';
	var $wrapHtml = $(wrapHtml).appendTo(_parent);
	if(options.mainCSS) {
		$wrapHtml.css(options.mainCSS);
	}
	
	var selectedOptionValue = _self.find("option:selected").attr("value");
	var selectedOptionTxt = _self.find("option:selected").text();
	var name = _self.attr("name");
	var id = _self.attr("id");
	var inputHtml = '<input type="hidden" value="'+selectedOptionValue+'" name="'+name+'" id="'+id+'"/>';
	$(inputHtml).appendTo($wrapHtml);
	var inputTxtHtml = '<input type="hidden" value="'+selectedOptionTxt+'" name="'+name+'_text" id="'+id+'_text"/>';
	$(inputTxtHtml).appendTo($wrapHtml);
	var aHtml = '<div class="' + options.textClass + '"><span>'+selectedOptionTxt+'</span></div>';
	$(aHtml).appendTo($wrapHtml);
	var sele_optionHtml = '<ul class="' + options.optionClass + '" style="display:none;"></ul>';
	var $sele_optionHtml = $(sele_optionHtml).appendTo($wrapHtml);
	
	var liHtml = "";
	_self.find("option").each(function(){
		if($(this).attr("selected")){
			liHtml += '<li><a href="javascript:;" class="current" rel="'+$(this).attr("value")+'">'+$(this).text()+'</a></li>';
		}else{
			liHtml += '<li><a href="javascript:;" rel="'+$(this).attr("value")+'">'+$(this).text()+'</a></li>';
		}
	});
	$(liHtml).appendTo($sele_optionHtml);
	
	if(options.resetzIndex){
		$wrapHtml.css("zIndex",options.zIndex);
		$sele_optionHtml.css("zIndex",options.zIndex);
	}
	
	$("." + options.textClass ,$wrapHtml).click(function(){
		$(this).blur();	
		if($("." + options.optionClass,$wrapHtml).is(":visible")){
			$("." + options.optionClass,$wrapHtml).hide();
		} else {
			$("." + options.optionClass,$wrapHtml).show();
		}
		return false;
	});
	$("." + options.optionClass + " a",$wrapHtml).click(function(){
		$(this).blur();
		var value = $(this).attr("rel");
		var txt ="<span>"+ $(this).text()+"</span>";
		$("#"+id).val(value);
		$("#"+id+"_text").val(txt);
		$("." + options.textClass,$wrapHtml).html(txt);
		$("." + options.optionClass + " a",$wrapHtml).removeClass("current");
		$(this).addClass("current");
		$("." + options.optionClass,$wrapHtml).hide();
		return false;
	});
	$(document).click(function(event){
		if( $(event.target).attr("class") != options.mainClass ){
			$("." + options.optionClass ,$wrapHtml).hide();
		}
	});
	if($sele_optionHtml.find("li").length > 6){
		$sele_optionHtml.css("height",180);
	}
	_self.remove();
	return _self;
}


//弹层垂直居中
$(function(){
	var ly_top=-($(".layer_box").height()/2);
	$(".layer_box").css({"margin-top":ly_top+"px"});
});

//视频li最后一个间距
$(function(){
	var cok = $(".vedio_cont");
	cok.each(function(){
		$(this).find("li").eq(2).css({"margin-right":"0"});
		$(this).find("li").eq(5).css({"margin-right":"0"});
		$(this).find("li").eq(8).css({"margin-right":"0"});
		$(this).find("li").eq(11).css({"margin-right":"0"});
	})
	// cok.eq(2).css({"margin-right":"0"});
	// cok.eq(5).css({"margin-right":"0"});
	// cok.eq(8).css({"margin-right":"0"});
	// cok.eq(11).css({"margin-right":"0"});
})


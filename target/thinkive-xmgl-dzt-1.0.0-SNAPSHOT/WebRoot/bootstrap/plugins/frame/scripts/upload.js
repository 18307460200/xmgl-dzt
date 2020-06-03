/**
 * 上传组件的相关操作
 */
define(function(require, exports, module) {

	var FrameService = require("plugins/frame/scripts/service/frameService");
	
	/**
	 * 构造函数
	 */
	function Upload(uploadId, uploadConfig) { 
		// 服务通信层
		this.frameService = FrameService.getInstance();
		this.uploadConfig = uploadConfig || {}; 
		// 浏览器上面的入参
		this.urlParam = $.net.getUrlParameter() || {};
		this.uploadId = uploadId;
	};

	/**
	 * 初始化界面
	 */
	Upload.prototype.loadViewConfig = function() {
		var control = $('#' + this.uploadId);
		var reqParam = {};
		var business_code = this.uploadConfig["bcode"] ;
		reqParam["business_code"] = business_code;
		reqParam["isExport"] = "1";
		var uploadUrl = "FileUpload";
		This = this;
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
           // allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
            uploadExtraData:reqParam,
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove : true, //显示移除按钮
            showPreview : false, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            //maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

        }).on('filepreupload', function(event, data, previewId, index) {     //上传中
            var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
            //console.log('文件正在上传');
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
           // console.log('文件上传成功！'+data.id);
			if(data.response.error_no == "0"){
				//if(data.response.results[0].is_safe == "1"){ 
					$('#' + This.uploadId).attr("file_value",data.response.results[0].upload_id);
				//}else{
					//$('#' + This.uploadId).attr("file_value",data.response.results[0].file_path);
				//} 
				
			}else{
				window.top.Ewin.alert(data.response.error_info);
			}

        }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
            //console.log('文件上传失败！'+data.id);
			window.top.Ewin.alert(data.response.error_info);
        })
	};
 
	/**
	 * 释放内存工作
	 */
	Upload.prototype.destroy = function() {
		
	};

	window.Upload = Upload;
	// 暴露对外的接口
	module.exports = Upload;
});
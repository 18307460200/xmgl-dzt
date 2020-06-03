(function($) {

	window.Ewin = function() {
		var html = '<div id="[Id]" class="modal fade" role="dialog" aria-labelledby="modalLabel">'
				+ '<div class="modal-dialog modal-sm">'
				+ '<div class="modal-content">'
				+ '<div class="modal-header">'
				+ '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>'
				+ '<h4 class="modal-title" id="modalLabel">[Title]</h4>'
				+ '</div>'
				+ '<div class="modal-body">'
				+ '<p>[Message]</p>'
				+ '</div>'
				+ '<div class="modal-footer">'
				+ '<button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>'
				+ '<button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button>'
				+ '</div>' + '</div>' + '</div>' + '</div>';

		var dialogdHtml = '<div id="[Id]" class="modal fade" role="dialog" aria-labelledby="modalLabel" >'
			+ '<div class="modal-dialog" style="width:[popWidth]">'
			+ '<div class="modal-content"  >'
			+ '<div class="modal-header">'
			+ '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>'
			+ '<h4 class="modal-title" id="modalLabel">[Title]</h4>'
			+ '</div>'
			+ '<div class="modal-body">'
			//+ '<div id="loadingWindow" style="text-align: center;">正在加载中。。。</div>'
			+ '<iframe id="iframe" width="[width]" height="[height]" frameborder="0"></iframe>  '
			+ '</div>'
			//+ '<div class="modal-footer">'
			//+ '<button type="button" class="btn btn-primary ok" data-dismiss="modal">关闭</button>'
			//+ '</div>'
			+ '</div>' + '</div>' + '</div>';
//		var dialogdHtml = '<div id="[Id]" class="modal fade" role="dialog" aria-labelledby="modalLabel">'
//				+ '<div class="modal-dialog">'
//				+ '<div class="modal-content">'
//				+ '<div class="modal-header">'
//				+ '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>'
//				+ '<h4 class="modal-title" id="modalLabel">[Title]</h4>'
//				+ '</div>'
//				+ '<div class="modal-body">'
//				+ '</div>'
//				+ '</div>'
//				+ '</div>' + '</div>';

		var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
		var generateId = function() {
			var date = new Date();
			return 'mdl' + date.valueOf();
		}
		var init = function(options) {
			options = $.extend({}, {
				title : "操作提示",
				message : "提示内容",
				btnok : "确定",
				btncl : "取消",
				width : 200,
				auto : false
			}, options || {});
			var modalId = generateId();
			var content = html.replace(reg, function(node, key) {
				return {
					Id : modalId,
					Title : options.title,
					Message : options.message,
					BtnOk : options.btnok,
					BtnCancel : options.btncl
				}[key];
			});
			$('body').append(content);
			$('#' + modalId).modal({
				width : options.width,
				backdrop : 'static'
			});
			$('#' + modalId).on('hide.bs.modal', function(e) {
				$('body').find('#' + modalId).remove();
			});
			return modalId;
		}

		return {
			alert : function(options) {
				if (typeof options == 'string') {
					options = {
						message : options
					};
				}
				var id = init(options);
				var modal = $('#' + id);
				modal.find('.ok').removeClass('btn-success').addClass(
						'btn-primary');
				modal.find('.cancel').hide();

				return {
					id : id,
					on : function(callback) {
						if (callback && callback instanceof Function) {
							modal.find('.ok').click(function() {
								callback(true);
							});
						}
					},
					hide : function(callback) {
						if (callback && callback instanceof Function) {
							modal.on('hide.bs.modal', function(e) {
								callback(e);
							});
						}
					}
				};
			},
			confirm : function(options) {
				var id = init(options);
				var modal = $('#' + id);
				modal.find('.ok').removeClass('btn-primary').addClass(
						'btn-success');
				modal.find('.cancel').show();
				return {
					id : id,
					on : function(callback) {
						if (callback ) {
							modal.find('.ok').click(function() {
								callback(true);
							});
							modal.find('.cancel').click(function() {
								callback(false);
							});
						}
					},
					hide : function(callback) {
						if (callback ) {
							modal.on('hide.bs.modal', function(e) {
								callback(e);
							});
						}
					}
				};
			},
			dialog : function(options) {
				options = $.extend({}, {
					title : '',
					//url : '',
					onReady : function() {
					},
					onShown : function(e) {
					},
					onHide : function(e) {
						
					}
				}, options || {});
				var modalId = generateId();

				var content = dialogdHtml.replace(reg, function(node, key) {
					return {
						Id : modalId,
						Title : options.title,
						width : options.width,
						height : options.height,
						popWidth:options.popWidth
					}[key];
				}); 
				$('body').append(content);
				var target = $('#' + modalId);
				//target.find('.modal-body').load(options.url);
				if (options.onReady())
					options.onReady.call(target);
				//target.modal({remote:options.url});
				
				$("#iframe").attr("src", options.url);  
				target.modal({ show: true, backdrop: 'static' }); 
				
				target.on('shown.bs.modal', function(e) {  
					if(options.onShown != null){
						if (options.onShown(e)){
							options.onShown.call(target, e);
						}
					}
					//setTimeout(function(){
					//	$("#loadingWindow").hide()
					//},2000);
				});
				target.on('hide.bs.modal', function(e) {
					$('body').find(target).remove();
					if(options.onHide != null){
						if (options.onHide(e)){
							options.onHide.call(target, e); 
						}
					}
				});
				target.on('show.bs.modal', function(e) {
					
				});
			}
		}
	}();
})(jQuery);
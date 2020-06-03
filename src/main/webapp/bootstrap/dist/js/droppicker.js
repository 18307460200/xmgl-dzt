(function($, window, document,undefined) {
    //定义selectList的构造函数
    var dorpDown = function(ele, opt) {
        this.$element = ele,
        this.name = this.$element.attr("id");
        this.defaults = {
            type: 'sigle', //multi:多选; sigle：单选 ; tree 树形分类选
	        myData: {
	        	name1: {
	                val: '默认选中',
	                selected: true,
	            },
	            name2: {
	                val: '下拉1',
	            },
	            name3: {
	                val: '下拉2'
	            }
	        }
        },
        def = $.extend({}, this.defaults, opt);
    }
    //定义selectList的方法
    dorpDown.prototype = {
        init: function() {
            this.dorpList();
       	},			
        //下拉框展示
    	dorpList: function () {
            var self = this;
            var name = this.name;
            var id = '#' + this.name;
            var lists, drop;
            lists = '';
            
            for (var key in def.myData) {
        		if(def.type == 'sigle'){
        			lists += '<a href="javascript:void(0)">' + def.myData[key].val + '</a>';
        			var drop = '<div class="dropdown-menu droppicker" id="' + name + 'con">' + lists + '</div>';
        		}else if(def.type == 'multi'){
        			lists += '<a href="javascript:void(0)" data-name="' + key + '" sel=""><i></i>' + def.myData[key].val + '</a>';
            		var drop = '<div class="dropdown-menu droppicker multi" id="' + name + 'con">' + lists + '</div>';
        		}else if(def.type == 'tree'){
        			if (def.myData[key].children.length > 0){
        				var subList = '';
        				var myData2 = def.myData[key];
        				for(var i in myData2.children){
        					if (myData2.children[i].children.length > 0){
        						subList +='<span class="level_btn"><i class="folder_icon "></i>' + myData2.children[i].val + '</span>';
        						var thirdList='';
        						var myData3 = myData2.children[i];
        						for( var j in myData3.children){
        							thirdList +='<a href="javascript:void(0)" >' + myData3.children[j].val + '</a>';
        						}
        						levelList2 ='<div class="level_list">' + thirdList + '</div>';
        						//subList.after(levelList2);
        					}else
        					{
        						subList +='<a href="javascript:void(0)" >' + myData2.children[i].val + '</a>';
        					}
        					
        				}
        				
        				levelList = '<div class="level_list">' + subList + '</div>';
        				lists += '<li><span class="level_btn" ><i class="folder_icon "></i> ' + myData2.val + '</span> '+ levelList +' </li>';
        			}else{
        				lists += '<li><a href="javascript:void(0)" value="' + key + '" sel="">' + myData2.val + '</a></li>';
        			}
        			var divUl = '<ul class="li_con">' + lists + '</ul>'
        			var drop = '<div class="dropdown-menu droppicker tree" id="' + name + 'con">' + divUl + '</div>';
        			
        		}
           	};
            $(id).after(drop);
            $(id).click(function(e) {
                e.stopPropagation();
                var _this = $(this);
                if(_this.siblings('.dropdown-menu.droppicker').is(':hidden')){
                	_this.siblings('.dropdown-menu.droppicker').slideDown(300);
					_this.children('.input_icon').addClass("up_icon");
					_this.children(".form-control").focus();
				}else{
					_this.siblings('.dropdown-menu.droppicker').slideUp(300);
					_this.children('.input_icon').removeClass("up_icon");
					_this.children(".form-control").blur();
				}
            });
            
            
            if (def.type == 'sigle') {
                self.sinClick();
            } else if (def.type == 'multi') {
                self.mltClick();
            } else if (def.type == 'tree') {
            	self.treeClick();
            }
        },
    	//单选
        sinClick: function() {
            var name = this.name;
            var id = '#' + name;
            var dropMenu = '#' + name + 'con';
            $(dropMenu).on('click', 'a', function(e) {
                e.stopPropagation();
                $(this).parents().siblings().children(".form-control").text($(this).text());
                $(this).parents('.dropdown-menu.droppicker').slideUp(300);
                $(id).children('.input_icon').removeClass("up_icon");
            });
            $(document).click(function(e) {
                var target = $(e.target);
				if(target.closest(id).length == 0 && target.closest(".dropdown-menu.droppicker").length == 0){
					$('.dropdown-menu.droppicker').slideUp(300);
					$(id +' .input_icon').removeClass("up_icon");
				}
            });
        },
        //多选
        mltClick: function(){
        	var name = this.name;
            var id = '#' + name;
            var dropMenu = '#' + name + 'con';
            $(dropMenu).off('click', 'a').on('click', 'a', function(e){
            	e.stopPropagation();
            	var _this = $(this);
            	var sel = _this.attr('sel');
            	var checkedList = _this.parents().siblings().children(".form-control");
            	
            	if(sel == "true"){
					_this.removeClass("checked");
					_this.attr('sel', false);
					var num = _this.attr('data-name');
					checkedList.find('span').each(function(){
						if ($(this).attr('data-vel') == num) {
			                $(this).remove();
			            };
					});
				}else{
					_this.addClass("checked");
					_this.attr('sel', true);
					var txt = "<span class='check_tag' data-vel=" + _this.attr('data-name') + ">"+ _this.text() + "</span>";
					checkedList.append(txt);
				}
				
				return false;
            });
            $(document).click(function(e) {
                var target = $(e.target);
				if(target.closest(id).length == 0 && target.closest(dropMenu).length == 0){
					$('.dropdown-menu.droppicker').slideUp(300);
					$(id +' .input_icon').removeClass("up_icon");
				}
            });
        },
        //树形分类选项
        treeClick: function(){
        	var name = this.name;
            var id = '#' + name;
            $(".droppicker.tree").off('click', 'a').on('click', 'a', function(e) {
                e.stopPropagation();
                var parText = $(this).parent().siblings(".level_btn").text();
				//var chilText = $(this).text();
				$(this).parents('.droppicker.tree').siblings().children(".form-control").text($(this).text());
        		$(this).parents('.droppicker.tree').slideUp(300);
        		$(id +' .input_icon').removeClass("up_icon");
            });
            $(".droppicker.tree").off('click', '.level_btn').on('click', '.level_btn', function(e) {
                e.stopPropagation();
                if($(this).children().hasClass("folder_icon_open")){
					$(this).children(".folder_icon").removeClass("folder_icon_open");
					$(this).siblings(".level_list").slideUp(350);
				}else{
					$(this).children(".folder_icon").addClass("folder_icon_open");
					$(this).siblings(".level_list").slideDown(350);
				}
            });
            $(document).click(function(e) {
                var target = $(e.target);
				if(target.closest(id).length == 0 && target.closest(".dropdown-menu.droppicker").length == 0){
					$('.dropdown-menu.droppicker').slideUp(300);
					$(id +' .input_icon').removeClass("up_icon");
				}
            });
        }
    }
    //在插件中使用selectList对象
    $.fn.droppicker = function(options) {
        var selectlist = new dorpDown(this, options);
        //调用其方法
        return selectlist.init();
    }
})(jQuery, window, document);



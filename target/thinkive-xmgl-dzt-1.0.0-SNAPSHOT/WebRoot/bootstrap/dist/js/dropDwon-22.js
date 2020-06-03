$(function() {
	dropDwon({
        id: 'drop',
        type: 'sigle', //multi:多选；sigle：单选
        myData: {
        	name1: {
                val: '默认选中',
                selected: false,
            },
            name2: {
                val: '333',
            },
            name3: {
                val: '444'
            },
            name4: {
                val: '555'
            }
        },
    });
});

function dropDwon(option){
	

    var drop = function(def) {
        this.name = def.id;
        this.init();
    }
    drop.prototype = {
    	init: function() {
            this.dorpList();
            //this.callBack();
            
       	},
        //下拉框点击事件
    	dorpList: function () {
            var self = this;
            var name = this.name;
            var id = '#' + this.name;
            var lists, drop;
            lists = '';
            for (var key in def.myData) {
        		if(def.type == 'sigle'){
        			lists += '<a href="javascript:void(0)">' + def.myData[key].val + '</a>';
        			var drop = '<div class="drop_list" id="' + name + 'con">' + lists + '</div>';
        		}else if(def.type == 'multi'){
        			lists += '<a href="javascript:void(0)" class="check_text" value="' + key + '" sel=""><i></i>' + def.myData[key].val + '</a>';
            		var drop = '<div class="drop_list checkbox_drop_list" id="' + name + 'con">' + lists + '</div>';
        		}
            	
           	};
            $(id).after(drop);
            $(id).click(function(e) {
                e.stopPropagation();
                var _this = $(this);
                if(_this.siblings('.drop_list').is(':hidden')){
                	_this.siblings('.drop_list').slideDown(300);
					_this.children('.input_icon').addClass("up_icon");
					_this.children(".form-control").focus();
				}else{
					_this.siblings('.drop_list').slideUp(300);
					_this.children('.input_icon').removeClass("up_icon");
					_this.children(".form-control").blur();
				}
                if (def.type == 'sigle') {
                    self.sinClick();
                } else if (def.type == 'multi') {
                    self.mltClick();
                }
            });
        },
    	//单选
        sinClick: function() {
            var name = this.name;
            var id = '#' + name;
            $(".drop_list").on('click', 'a', function(e) {
                e.stopPropagation();
                $(id).children(".form-control").val($(this).text());
                $(this).parents('.drop_list').slideUp(300);
                $(id).children('.input_icon').removeClass("up_icon");
            });
            $(document).click(function(e) {
                var target = $(e.target);
				if(target.closest(id).length == 0 && target.closest(".drop_list").length == 0){
					$('.drop_list').slideUp(300);
					$(id +' .input_icon').removeClass("up_icon");
				}
            });
        },
        //双选
        mltClick: function(){
        	var name = this.name;
            var id = '#' + name;
            $(".drop_list").on('click', 'a', function(e){
            	e.stopPropagation();
            	var _this = $(this);
            	var sel = $(this).attr('sel');
            	var checkedList = $(id).children(".form-control");
            	
            	if(sel == "true"){
					_this.removeClass("checked");
					_this.attr('sel', false);
					var num = _this.attr('value');
					checkedList.find('span').each(function(){
						if ($(this).attr('vel') == num) {
			                $(this).remove();
			            };
					});
				}else{
					_this.addClass("checked");
					_this.attr('sel', true);
					var txt = "<span class='check_tag' vel=" + _this.attr('value') + ">"+ _this.text() + "</span>";
					checkedList.append(txt);
				}
            });
            $(document).click(function(e) {
                var target = $(e.target);
				if(target.closest(id).length == 0 && target.closest(".drop_list").length == 0){
					$('.drop_list').slideUp(300);
					$(id +' .input_icon').removeClass("up_icon");
				}
            });
        }
    };
    var def = {
        type: 'sigle', //multi:多选；sigle：单选
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
        },
    };
    def = $.extend(def, option);
    new drop(def);
}
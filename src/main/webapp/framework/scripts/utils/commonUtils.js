/**
 * 通用工具
 */
define(function(require, exports, module) {
	require("jquery");
	$.fn
			.extend({
				enableInput : function(is_must) {// is_must 是否不能为空
					if (is_must) {
						if ($(this).prev().find("span").length <= 0) {
							$(this).attr("disabled", false).css("background",
									"").prev().html(
									"<span class='rad'>*</span>"
											+ $(this).prev().html());
							$(this).attr("nullable", "0");
						}
					} else
						$(this).attr("disabled", false).css("background-color",
								"");

				},
				disableInput : function(is_must) {// is_must 是否不能为空
					if (is_must) {
						$(this).attr("disabled", true)
								.css("background", "#ddd").prev().find("span")
								.remove();
						$(this).closeTips();
						$(this).attr("nullable", "1");
					} else {
						$(this).attr("disabled", true).css("background-color",
								"#ddd");
						$(this).closeTips();
					}
				},
				addNotEmpty : function() {
					if ($(this).prev().find("span").length <= 0) {
						$(this).prev().html(
								"<span class='rad'>*</span>"
										+ $(this).prev().html());
						$(this).attr("verifyType", "NotEmpty").attr("nullable",
								"0");
					}
				},
				clearNotEmpty : function() {
					$(this).prev().find("span").remove();
					$(this).removeAttr("nullAble").removeAttr("verifyType");
				},
				showTips : function(msg) {
					if ($.string.isNotEmpty(msg)) {
						msg = "<span class='err_tip lg_errtip'><span class='bg_tips'></span><span class='tt_tips'>"
								+ msg + "</span></span>";
						$(this).parent().find(".err_tip").closeTips();
						$(this).after(msg);
					}
				},
				closeTips : function() {
					$(this).parent().find(".err_tip").remove();
					$(this).css("border", "");
				},
				showErr : function(msg, eventStr, isNotBorder) { // msg：提示信息,eventStr：事件,isNotBorder：border-color是否改变
					if (isNotBorder) {
						$(this).showTips(msg);
					} else {
						$(this).css("border", "1px solid #FF0000")
								.showTips(msg);
					}
					if ($.string.isEmpty(eventStr)) {
						eventStr = "keyup";
					}
					$(this).bind(eventStr, function() {
						if (isNotBorder) {
							$(this).closeTips();
						} else {
							$(this).css("border", "").closeTips();
						}
					});
					if ($(this).is('select')) {// 是下拉框时 绑定选项改变事件 值不为空时取消错误提示
						$(this).change(
								function() {
									if ($.string.isNotEmpty($(this).val())) {
										$(this).css("border", "").closeTips();
									} else {
										$(this).css("border",
												"1px solid #FF0000").showTips(
												msg);
									}
								});
					}
				},
				checkInputIsEmpty : function(title, stringObj, type) {// 检查输入框的值是否为空，不为空将值传给stringObj（引用类型）
					var errorMsg = "";
					if ($.string.isEmpty($(this).val())) {
						errorMsg += "<br/>[" + title + "]:该输入项不能为空";
						$(this).showErr("");
						flag = false;
					}
					if (type == "mobile") {// 手机号
						if ($(this).val().length != 11) {
							if ($.string.isEmpty(errorMsg)) {
								$(this).showErr();
								errorMsg += "<br/>[" + title + "]:手机号必须为11位";
							} else {
								errorMsg += ",手机号必须为11位";
							}
						}
					}
					if (type == "money") {// 金额100倍数
						if (parseFloat($(this).val()) % 100 != 0) {
							if ($.string.isEmpty(errorMsg)) {
								$(this).showErr();
								errorMsg += "<br/>[" + title
										+ "]:购买金额必须为100的倍数";
							} else {
								errorMsg += "," + title + "必须为100的倍数";
							}
						}
					}
					if (type == "num") {// 大于0的数字
						if (isNaN(parseInt($(this).val()))
								|| parseInt($(this).val()) <= 0) {
							if ($.string.isEmpty(errorMsg)) {
								$(this).showErr();
								errorMsg += "<br/>[" + title + "]:输入份额不能为零";
							} else {
								errorMsg += "," + title + "不能为零";
							}
						}
					}
					if (type == "length3") {// 长度不能大于三
						if ($(this).val().length > 3) {
							if ($.string.isEmpty(errorMsg)) {
								$(this).showErr();
								errorMsg += "<br/>[" + title + "]:输入份额不能为零";
							} else {
								errorMsg += "," + title + "长度不能大于3";
							}
						}
					}
					stringObj.toString = $(this).val();
					return errorMsg;
				},

				limitLen : function(length, type) {// 限制输入框的字符数量
					$(this)
							.bind(
									"keyup",
									function() {
										if (type == "number" && length != 0) {
											// 限制输入框 只能输入数字和 有且只有一个.
											$(this).val(
													$(this).val().replace(
															/[^\d.]/g, ""));
											$(this).val(
													$(this).val().replace(
															/\.{2,}/g, ""));
											if ($(this).val().length > length
													&& $(this).val().indexOf(
															".") < 0) {
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				length));
											} else if ($(this).val().length == 1
													&& $(this).val().indexOf(
															".") >= 0) {
												$(this).val("");
											}
										}
										if (type == "number" && length == 0) {
											// 限制输入框 只能输入数字和 有且只有一个.
											$(this).val(
													$(this).val().replace(
															/[^\d.]/g, ""));
											$(this).val(
													$(this).val().replace(
															/\.{2,}/g, ""));
											if ($(this).val().length == 1
													&& $(this).val().indexOf(
															".") == 0) {
												$(this).val("");
											}
										}
										if (type == "num" && length != 0) {
											// 限制输入框 只能输入数字 且限制位数
											$(this).val(
													$(this).val().replace(
															/[^\d]/g, ""));
											if ($(this).val().length > length
													&& $(this).val().indexOf(
															".") < 0) {
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				length));
											} else if ($(this).val().length == 1
													&& $(this).val().indexOf(
															".") >= 0) {
												$(this).val("");
											}
										}
										if (type == "name" && length != 0) {
											// $(this).val($(this).val().replace(/^[a-z0-9_-]{3,16}$/,""));
											$(this).val(
													$(this).val().replace(
															/[\d]/g, ""));
											if ($(this).val().length > length) {
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				length));
											}
										}
										if ($.string.isEmpty(type)
												&& length != 0) {// 如果type为空的话
																	// 就只限制输入的数量无格式限制
											if ($(this).val().length > length)
												$(this)
														.val(
																$(this)
																		.val()
																		.substring(
																				0,
																				length));
										}
										if (type == "num" && length == 0) {// 限制输入框
																			// 只能输入数字
																			// 且不限制位数
											$(this).val(
													$(this).val().replace(
															/[^\d.]/g, ""));
											$(this).val(
													$(this).val().replace(
															/\.{2,}/g, ""));
										}
										if (type != 0 && length != 0) {
											var errmsg = "长度小于最小值！！";
											if ($(this).val().length < type) {
												errmsg = ""
												// $.jAlert("长度小于最小值！！");
												return errmsg;
											} else if ($(this).val().length > length) {
												errmsg = "长度大于最大值！！";
												return errmsg;
											}
										}
									});
				}
			});

	$.extend({ // 对比日期大小
		compareDate : function(startdate, enddate) {// 比较日期大小
			var arr = null;
			try {
				arr = startdate.split("-");
			} catch (e) {
				return false;
			}
			var starttime = new Date(arr[0], arr[1], arr[2]);
			var starttimes = starttime.getTime();

			var arrs = enddate.split("-");
			var lktime = new Date(arrs[0], arrs[1], arrs[2]);
			var lktimes = lktime.getTime();
			if (starttimes > lktimes)
				return false;
			else
				return true;
		},
		getDateString : function() {
			var d = new Date(), str = '';
			str += d.getFullYear() + '-'; // 获取当前年份
			str += d.getMonth() + 1 + '-'; // 获取当前月份（0——11）
			str += d.getDate();
			return str;
		},
		loadIdTypeSelect : function(cust_type, id_type, projectService) {
			var reqParam = {};
			var enum_no = "";
			if (cust_type == "0") {// 机构
				enum_no = '1019';
				$("input[name='bank_acct']").removeAttr("verifyType");
			} else {
				enum_no = '1018';
				$("input[name='bank_acct']").attr({
					"verifyType" : "BankCode"
				});
			}
			reqParam["enum_no"] = enum_no;
			function loadIdCardCall(resultVo) {
				var result = resultVo.obj.results.results;
				if (result.length > 0) {
					var obj = document.getElementById(id_type);
					obj.length = 0;
					obj.options.add(new Option('--请选择--', ''));
					for (var i = 0; i < result.length; i++) {
						var name = result[i].item_name;
						var code = result[i].item_value;
						obj.options.add(new Option(name, code));
					}
				}
			}
			projectService.processSubmit(loadIdCardCall, 601263, reqParam,
					null, null, false);
		},
		loadIdType : function() {
			setTimeout(f, 300);// 特殊原因需要延时
			function f() {
				if ($.string.isEmpty($('#cust_type').val())
						|| $.string.isEmpty($('#id_type').val()))
					return;
				var a = $('#id_type').val();
				$('#id_type').val('');
				$.loadIdTypeSelect($('#cust_type').val(), 'id_type',
						projectService);
				$('#id_type').val(a);
				a = null;
			}
		},
		compareNum : function(max, min, funcno) {// 不能传值，要jquery/string 对象
			// alert($(max).val()+"//"+$(min).val()+"//"+funcno);
			var flag = true;
			compare();
			function compare() {
				if (parseFloat($(max).val()) < parseFloat($(min).val())) {
					flag = false;
				} else {
					flag = true;
				}
				btndisabled();
			}
			function btndisabled() {
				if (!flag) {
					$.jAlert("最大值小于最小值！！");
					$("input[funcno='" + funcno + "']").attr('disabled',
							'disabled');
				} else {
					$("input[funcno='" + funcno + "']").removeAttr('disabled');
				}
			}
		},
		moneyStr : function(d, n) {
			if (d == null || d == "" || d == "null" || d == Infinity) {
				return "0.00";
			}
			var ds = (d + "").split(".");
			var a = ds[0];
			if (!a || isNaN(a)) {
				a = "0";
			}
			var b = ds[1];
			if (!b) {
				b = "00";
			} else {
				try {
					n = Number(n);
				} catch (e) {
					n = 2
				}
				;
				b = (Number("0." + b).toFixed(n) + "").substr(2, n);// 四舍五入留2位
			}
			var sign;
			if (a.substr(0, 1) == "-") {// 从0起，截取1位
				a = a.substr(1);
				sign = "-";
			} else {
				sign = "";
			}
			for (var i = a.length - 3; i > 0; i -= 3) {
				a = a.substr(0, i) + "," + a.substr(i);
			}
			return sign + a + "." + b;
		},
		gbMoney : function(num) {
			var o = "";
			var s = "万仟佰拾亿仟佰拾万仟佰拾元角分";
			num += "00";
			var p = num.indexOf(".");
			if (p >= 0)
				num = num.substring(0, p) + num.substr(p + 1, 2);
			s = s.substr(s.length - num.length, num.length);
			for (var i = 0; i < num.length; i++)
				o += "零壹贰叁肆伍陆柒捌玖".substr(num.substr(i, 1), 1) + s.substr(i, 1);
			return o.replace(/零角零分$/, "整").replace(/零[仟佰拾]/g, '零').replace(
					/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/,
					'元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");
		},
		vali_date : function(d) {
			if (d == '' || d == null || d == 'undefined')
				return '';
			var a = new Date(), d1, b = [];
			b[0] = a.getFullYear();
			b[1] = (b[1] = a.getMonth() + 1) > 9 ? b[1] : '0' + b[1];
			b[2] = (b[2] = a.getDate()) > 9 ? b[2] : '0' + b[2];
			d1 = b[0] + '' + b[1] + b[2];
			if (d < d1) {
				// $.jAlert("证件号码有效期不合法");
				return false;
			}
			return true;
		},
		isChinaIdCard : function(StrNo) {
			StrNo = StrNo.toString();
			if (StrNo.length == 15) {
				if (!$.isValidDate("19" + StrNo.substr(6, 2)
						+ StrNo.substr(8, 2) + StrNo.substr(10, 2))) {
					return '身份证号码错误：出生日期不正确';
				}
			} else if (StrNo.length == 18) {
				if (!$.isValidDate(StrNo.substr(6, 4) + StrNo.substr(10, 2)
						+ StrNo.substr(12, 2))) {
					return '身份证号码错误：出生日期不正确';
				}
			} else {
				return '身份证号码必须为15位或者18位';
			}
			if (StrNo.length == 18) {
				var a, b, c;
				if (!$.isNumeric(StrNo.substr(0, 17))) {
					return '身份证号码错误：前17位不能含有英文字母';
				}
				a = parseInt(StrNo.substr(0, 1)) * 7
						+ parseInt(StrNo.substr(1, 1)) * 9
						+ parseInt(StrNo.substr(2, 1)) * 10;
				a = a + parseInt(StrNo.substr(3, 1)) * 5
						+ parseInt(StrNo.substr(4, 1)) * 8
						+ parseInt(StrNo.substr(5, 1)) * 4;
				a = a + parseInt(StrNo.substr(6, 1)) * 2
						+ parseInt(StrNo.substr(7, 1)) * 1
						+ parseInt(StrNo.substr(8, 1)) * 6;
				a = a + parseInt(StrNo.substr(9, 1)) * 3
						+ parseInt(StrNo.substr(10, 1)) * 7
						+ parseInt(StrNo.substr(11, 1)) * 9;
				a = a + parseInt(StrNo.substr(12, 1)) * 10
						+ parseInt(StrNo.substr(13, 1)) * 5
						+ parseInt(StrNo.substr(14, 1)) * 8;
				a = a + parseInt(StrNo.substr(15, 1)) * 4
						+ parseInt(StrNo.substr(16, 1)) * 2;
				b = a % 11;
				if (b == 2) {
					c = StrNo.substr(17, 1).toUpperCase();
				} else {
					c = parseInt(StrNo.substr(17, 1));
				}
				switch (b) {
				case 0:
					if (c != 1) {
						return '身份证号码校验位错,最后一位应该为：1';
					}
					break;
				case 1:
					if (c != 0) {
						return '身份证号码校验位错,最后一位应该为：0';
					}
					break;
				case 2:
					if (c != "X") {
						return '身份证号码校验位错,最后一位应该为：X';
					}
					break;
				case 3:
					if (c != 9) {
						return '身份证号码校验位错,最后一位应该为：9';
					}
					break;
				case 4:
					if (c != 8) {
						return '身份证号码校验位错,最后一位应该为：8';
					}
					break;
				case 5:
					if (c != 7) {
						return '身份证号码校验位错,最后一位应该为：7';
					}
					break;
				case 6:
					if (c != 6) {
						return '身份证号码校验位错,最后一位应该为：6';
					}
					break;
				case 7:
					if (c != 5) {
						return '身份证号码校验位错,最后一位应该为：5';
					}
					break;
				case 8:
					if (c != 4) {
						return '身份证号码校验位错,最后一位应该为：4';
					}
					break;
				case 9:
					if (c != 3) {
						return '身份证号码校验位错,最后一位应该为：3';
					}
					break;
				case 10:
					if (c != 2) {
						return '身份证号码校验位错,最后一位应该为：2';
					}
				}
			} else {
				if (!$.isNumeric(StrNo)) {
					return '身份证号码错误：前15位不能含有英文字母';
				}
			}
			return true;
		},
		isValidDate : function(v) {
			if (v.length == 8) {
				v = v.substr(0, 4) + '-' + v.substr(4, 2) + '-'
						+ v.substr(6, 2);
			}
			var r = v.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
			if (r == null) {
				return false;
			}
			var d = new Date(r[1], r[3] - 1, r[4]);
			return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d
					.getDate() == r[4]);
		},
		toIdCard18 : function(idCard) {
			if (idCard == null)
				return '';
			idCard = idCard.toString().trim();
			if (idCard.length == 18)
				return idCard;
			var chkBit = [ '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3',
					'2' ];
			var sum = 0, idCard18 = idCard;
			if (idCard != null && idCard.length == 15) {
				idCard18 = idCard.substr(0, 6) + '19' + idCard.substr(6);
				for (var i = 0; i < idCard18.length; i++) {
					var c = idCard18.charAt(i);
					var Wi = Math.pow(2, idCard18.length - i) % 11;// 加权因子算法
					sum += parseInt(c) * Wi;
				}
				idCard18 += chkBit[sum % 11];
			}
			return idCard18;
		},
		toStringSplit : function(string) {
			if ($.string.isNotEmpty(string)) {
				var array = string.split(",");
				var toSplitString = "";
				for (var i = 0; i < array.length; i++) {
					if (i == (array.length - 1)) {
						toSplitString += "'" + array[i] + "'";
					} else {
						toSplitString += "'" + array[i] + "',";
					}
				}
				return toSplitString;
			} else {
				return "";
			}
		}
	});
});
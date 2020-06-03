define(function(require, exports, module) {
    // 加载依赖模块
    require("jquery");
    
    /**
	 * @功能  js读取pdf文件
	 * @author libing
	 * @time 2014.9.9
	 */
    
    var pdfobject=null;
    
    $.fn.extend({
    	loadPdf:function(url,height,width){
    		
    		if(isAcrobatPluginInstall()){
    			$(this).html("<iframe  src='"+url+"' width='"+width+"px' height='"+height+"px'></iframe>");
    		}else{
    			$.jAlert("您还未安装Adobe Reader,下载请点击<a href='http://get.adobe.com/cn/reader/' style='color:blue;text-decoration:underline' target'_blank'>这里</a>安装");
    		}
    	}
    });
    
    
    //判断电脑是否安装了pdf阅读器
    function isAcrobatPluginInstall(){
	                var displayString;
	                var acrobat = new Object();
	                acrobat.installed = false;
	                acrobat.version = "0.0";

	                if (navigator.plugins && navigator.plugins.length) {
	                    for (x = 0; x < navigator.plugins.length; x++) {
	                        if (navigator.plugins[x].description.indexOf("Adobe Acrobat") != -1) {
	                            acrobat.version = parseFloat(navigator.plugins[x].description.split("Version ")[1]);
	                            if (acrobat.version.toString().length == 1) acrobat.version += ".0";
	                            acrobat.installed = true;
	                            displayString = "Acrobat Version: " + acrobat.version;
	                            break;
	                        } else if (navigator.plugins[x].description.indexOf("Adobe PDF Plug-In") != -1) {
	                            acrobat.installed = true;
	                            acrobat.version = "8+";
	                            displayString = "Acrobat Version 8 or Above";
	                        }
	                    }
	                } else if (window.ActiveXObject) {
	                    for (x = 2; x < 10; x++) {
	                        try {
	                            oAcro = eval("new ActiveXObject('PDF.PdfCtrl." + x + "');");
	                            if (oAcro) {
	                                acrobat.installed = true;

	                                acrobat.version = x + ".0";
	                                displayString = "Acrobat Version: " + acrobat.version;
	                            }
	                        }
	                        catch (e) { }
	                    }
	                    try {
	                        oAcro4 = new ActiveXObject("PDF.PdfCtrl.1");
	                        if (oAcro4) {
	                            acrobat.installed = true;
	                            acrobat.version = '4.0';
	                            displayString = 'Acrobat Version: ' + acrobat.version;
	                        }
	                    }
	                    catch (e) { }

	                    try {
	                        oAcro7 = new ActiveXObject('AcroPDF.PDF.1');
	                        if (oAcro7) {
	                            acrobat.installed = true;
	                            acrobat.version = '7.0';
	                            displayString = 'Acrobat Version: ' + acrobat.version;
	                        }
	                    }
	                    catch (e) { }
	                }
	                return acrobat;
	      }
});
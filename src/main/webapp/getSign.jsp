<%@page import="java.net.URLEncoder"%>
<%@page import="com.thinkive.workplat.model.RequestModel"%>
<%@page import="com.thinkive.base.util.JsonHelper"%>
<%@page import="com.thinkive.base.config.Configuration"%>
<%@page import="com.thinkive.base.util.security.SecurityHelper"%>
<%@page import="com.thinkive.base.util.security.SignHelper"%>
<%@page import="com.thinkive.workplat.model.RequestSignModel"%>
<%@page import="com.thinkive.base.util.ScriptHelper"%>
<%@page import="com.thinkive.base.util.RequestHelper"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.thinkive.base.util.StringHelper"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    if ( RequestHelper.isPostBack(request) )
    {
        String versionId = RequestHelper.getString(request, "versionId");
        String eventNo = RequestHelper.getString(request, "eventNo");
        String params = RequestHelper.getString(request, "params");
        
        String signKey = Configuration.getString("system.request_sign_key", "4db7b064f5455b890e1deadc5ef90a6d");//请求签名key
        // 0, 获得商户信息
        RequestSignModel merchant = new RequestSignModel();
        merchant.setSignKey(signKey);
        
        // 1, 组装业务参数
        Map<String, String> bizParam = new HashMap<String, String>();
        System.out.println("==============2:" + params);
        if ( StringHelper.isNotEmpty(params) )
        {
            String[] arr = StringHelper.split(params, "\r\n");
            System.out.println("==============3:" + arr.length);
            for (int i = 0; i < arr.length; i++)
            {
                String temp = arr[i];
                System.out.println("==============4:" + temp + ":" + i);
                if ( temp.indexOf("=") > 0 )
                {
                    System.out.println("==============5:" + temp + ":");
                    String[] param = StringHelper.split(temp, "=");
                    if ( param != null && param.length == 2 )
                    {
                        bizParam.put(param[0].trim(), param[1].trim());
                    }
                }
            }
        }
        System.out.print("==============:" + bizParam);
        
        // 2, 对业务参数进行处理
        String json = "";
        String base64 = "";
        String aesCipherText = "";
        try
        {
            json = JsonHelper.getJSONString(bizParam);
            System.out.println("json:" + json);
            //json = URLEncoder.encode(json, "UTF-8");
            //base64 = SecurityHelper.base64(json);
            //System.out.println("base64:" + base64);
            //            aesCipherText = encryptService.encryptByAes(base64, merchant.getParamEncryptKey());
            aesCipherText = json;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        // 2, 组装服务级参数
        Map<String, String> serviceParam = new HashMap<String, String>();
        //serviceParam.put("_version_id", versionId);
        //serviceParam.put(RequestModelConstant.FORMAT, "json");
        //serviceParam.put(RequestModelConstant.VERSION, "1.0");
        //serviceParam.put(RequestModelConstant.CHARSET, "utf8");
        //  serviceParam.put(RequestModelConstant.ENCRIPT_MODE, "aes");
        //serviceParam.put(RequestModelConstant.SIGN_TYPE, "md5");
        //serviceParam.put(RequestModelConstant.TIMESTAMP, "1440062584207");
        // serviceParam.put(RequestModelConstant.REQUETS_ID, "00000001.99999999888888887777777766666666");
        //serviceParam.put("_event_no", eventNo);
        //serviceParam.put(RequestModelConstant.CUSTOMER_IP, "127.0.0.1");
        
        serviceParam.put(RequestModel.BUSINESS_DATA, aesCipherText);
        
        // 3. 加上请求签名和业务参数
        Map<String, String> signMap = new LinkedHashMap<String, String>();
        signMap.putAll(serviceParam);
        //        signMap.put(RequestModelConstant.BUSINESS_DATA, aesCipherText);
        try
        {
            String sign = SignHelper.signByMd5(signMap, merchant.getSignKey());
            //            System.out.println(aesCipherText);
            //            System.out.println(sign);
            
            StringBuilder builder = new StringBuilder();
            builder.append("http://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/servlet/ModuleEvent?");
            Iterator<Entry<String, String>> iter = signMap.entrySet().iterator();
            while (iter.hasNext())
            {
                Map.Entry<String, String> entry = iter.next();
                String key = entry.getKey();
                String value = entry.getValue();
                if ( StringHelper.isNotEmpty(value) )
                {
                    //                    value = java.net.URLEncoder.encode(value, "UTF-8");
                    value = java.net.URLEncoder.encode(value, "UTF-8");
                    builder.append(key + "=" + value);
                    builder.append("&");
                    
                }
            }
            builder.append(RequestModel.SIGN).append("=").append(sign);
            //System.out.println(builder.toString());
            out.print(builder.toString());
            
            //System.out.println(encryptService.decryptByAes(aesCipherText, merchant.getParamEncryptKey()));
            
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    else
    {
%>
<html>
<head>
</head>
<body>
	<form action="" method="post" target="black">
		请求参数：
		<textarea rows="10" cols="50" name="params">_version_id=a6fe52a7c4664274aac98862a5a80729
_event_no=login_event
		</textarea>
		key=vlaue，多个回车换行<br /> <input type="submit" />
	</form>
</body>
</html>
<%
    }
%>
package com.thinkive.fxc.xmgl.utils;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkive.base.jdbc.DataRow;
import com.thinkive.cache.enums.EnumHelper;

public class EnumUtils {
	/**
	 * @描述：返回数据字典值
	 * @author qiulianqiong
	 * @created 2017年10月12日 下午5:31:49
	 * @since 
	 * @param enum_no
	 * @param enum_name
	 * @return
	 */
	public static String getEnumValue(String enum_no,String enum_name){
		List<DataRow> enumList = EnumHelper.getList(enum_no);
        if(enumList==null || enumList.size()==0){
        	return "";
        }else{
        	for(int i=0;i<enumList.size();i++){
        		DataRow item = enumList.get(i);
        		String name = item.getString("item_name");
                String value = item.getString("item_value");
                if(name.equals(enum_name)){
                	return value;
                }
        	}
        }
        return "";
	}
	/**
	 * @描述：返回数据字典名称
	 * @author qiulianqiong
	 * @created 2017年10月12日 下午5:31:49
	 * @since 
	 * @param enum_no
	 * @param enum_name
	 * @return
	 */
	public static String getEnumName(String enum_no,String enum_value){
		List<DataRow> enumList = EnumHelper.getList(enum_no);
        if(enumList==null || enumList.size()==0){
        	return "";
        }else{
        	for(int i=0;i<enumList.size();i++){
        		DataRow item = enumList.get(i);
        		String name = item.getString("item_name");
                String value = item.getString("item_value");
                if(value.equals(enum_value)){
                	return name;
                }
        	}
        }
        return "";
	}
	
	/**
	 * 
	 * @描述：查询指定类型数据字典
	 * @作者： yanghl
	 * @创建日期: 2017年10月23日
	 * @创建时间: 下午5:23:41
	 * @param enum_no
	 * @return Map<String,List<DataRow>>
	 */
	public static Map<String,List<DataRow>> getEnumMap(String[] enum_no){
		Map<String, List<DataRow>> map = new HashMap<String,List<DataRow>>();
		for (int i = 0; i < enum_no.length; i++) {
			 List<DataRow> list = EnumHelper.getList(enum_no[i]);
			 if(list==null || list.size()==0){
				 
		       }else{
		    	   map.put(enum_no[i], list);
		       }
       
        }
        return map;
	}
}

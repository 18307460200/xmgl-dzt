package com.thinkive.fxc.xmgl.utils;

import java.io.File;
import java.net.URL;

public class PropHelper
{
    
    /**
    *guessPropFile:
    *@param cls:��ҪѰ�ҵ������ļ�������ͬ�İ��е��������
    *@param propFile:ҪѰ�ҵ������ļ���
    */
    public static File guessPropFile(Class cls, String propFile)
    {
        File f = null;
        try
        {
            //�õ������װ����
            ClassLoader loader = cls.getClassLoader();
            //�ȴӵ�ǰ������·���ĸ�Ŀ¼��Ѱ�������ļ�
            URL url = loader.getResource(propFile);
            if (url != null)
            {
                f = new File(url.getPath());
                if (f != null && f.exists() && f.isFile())
                {
                    return f;
                }
            }
            //û���ҵ����ʹӸ��������İ�Ŀ¼�в��������ļ�
            Package pack = cls.getPackage();
            if (pack != null)
            {
                String packName = pack.getName();
                String path = "";
                if (packName.indexOf(".") < 0)
                {
                    path = packName + "/";
                }
                else
                {
                    int start = 0, end = 0;
                    end = packName.indexOf(".");
                    while (end != -1)
                    {
                        path = path + packName.substring(start, end) + "/";
                        start = end + 1;
                        end = packName.indexOf(".", start);
                    }
                    path = path + packName.substring(start) + "/";
                }
                url = loader.getResource(path + propFile);
                if (url != null)
                {
                    f = new File(url.getPath());
                    if (f != null && f.exists() && f.isFile())
                    {
                        return f;
                    }
                }
            }
            //���û���ҵ����ٴӵ�ǰϵͳ���û�Ŀ¼�н��в���
            String curDir = System.getProperty("user.dir");
            f = new File(curDir, propFile);
            if (f != null && f.exists() && f.isFile())
            {
                return f;
            }
            //�������û���ҵ������ϵͳ���е���·���в���
            String classpath = System.getProperty("java.class.path");
            String[] cps = classpath.split(System.getProperty("path.separator"));
            for (int i = 0; i < cps.length; i++)
            {
                f = new java.io.File(cps[i], propFile);
                if (f != null && f.exists() && f.isFile())
                {
                    break;
                }
                f = null;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            f = null;
        }
        return f;
    }
    /**
     * @��������ȡclasses�ļ��о���·��
     * @author qiulianqiong
     * @created 2017��12��21�� ����2:26:54
     * @since 
     * @return
     */
    public static String getClassesFolderPath(){
    	URL classFileUrl = PropHelper.class.getProtectionDomain().getCodeSource().getLocation();
        String classFilePath = classFileUrl.getPath();
        classFilePath = classFilePath.replace("file:", "");
        String classPath = "";
        int index = classFilePath.indexOf("classes");
        if(index!=-1){
        	classPath = classFilePath.substring(0,index)+"classes"+File.separator;;
        }else{ //����jar��
        	index = classFilePath.indexOf("lib");
	        if(index!=-1){
	        	classPath = classFilePath.substring(0,index)+"classes"+File.separator;
	        }
        }
        return classPath;
    }
    public static void main(String[] args)
    {
    	File log4jFile = PropHelper.guessPropFile(PropHelper.class, "log4j.properties");
        //���û���ҵ����ٴӵ�ǰϵͳ���û�Ŀ¼�н��в���
        //String curDir = System.getProperty("user.dir");
        //�������û���ҵ������ϵͳ���е���·���в���
//        String classpath = System.getProperty("java.class.path");
        //System.out.println(curDir);
//        System.out.println(classpath);
        //      System.out.println(System.getProperty("path.separator"));
    }
}

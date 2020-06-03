package com.thinkive.fxc.xmgl.utils;


import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

  
/**
 * 
 * @����: ͼƬ�����࣬���ͼƬ�Ľ�ȡ ,��ת����byte[]
 * @��˾: ˼�ϿƼ�
 * @����: yanghl
 * @��������: 2017��11��9��
 * @����ʱ��: ����6:21:25
 */
public class ImageUtil {  
	
	private static Logger logger=Logger.getLogger(ImageUtil.class);
	  /**   
     * ʵ��ͼ��ĵȱ�����   
     * @param source   
     * @param targetW   
     * @param targetH   
     * @return   
     */    
    private static BufferedImage resize(BufferedImage source, int targetW,     
            int targetH) {     
        // targetW��targetH�ֱ��ʾĿ�곤�Ϳ�     
        int type = source.getType();     
        BufferedImage target = null;     
        double sx = (double) targetW / source.getWidth();     
        double sy = (double) targetH / source.getHeight();     
        // ������ʵ����targetW��targetH��Χ��ʵ�ֵȱ����š��������Ҫ�ȱ�����     
        // �������if else���ע�ͼ���     
        if (sx < sy) {     
            sx = sy;     
            targetW = (int) (sx * source.getWidth());     
        } else {     
            sy = sx;     
            targetH = (int) (sy * source.getHeight());     
        }     
        if (type == BufferedImage.TYPE_CUSTOM) { // handmade     
            ColorModel cm = source.getColorModel();     
            WritableRaster raster = cm.createCompatibleWritableRaster(targetW,     
                    targetH);     
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();     
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);     
        } else    
            target = new BufferedImage(targetW, targetH, type);     
        Graphics2D g = target.createGraphics();     
        // smoother than exlax:     
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,     
                RenderingHints.VALUE_INTERPOLATION_BICUBIC);     
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));     
        g.dispose();     
        return target;     
    }     
          
    /**
     * 
     * @������ʵ�����ź�Ľ�ͼ ,��ת����byte[]
     * @���ߣ� yanghl
     * @��������: 2017��11��10��
     * @����ʱ��: ����10:54:13
     * @param image ���ź��ͼ�� 
     * @param subImageBounds Ҫ��ȡ����ͼ�ķ�Χ 
     * @param image_suffix  Ҫ������ļ� ��׺��
     * @return
     * @throws IOException byte[]
     */
   public static byte[] saveSubImage(BufferedImage image, Rectangle subImageBounds, String image_suffix) throws IOException {
       if (subImageBounds.x < 0 || subImageBounds.y < 0    
               || subImageBounds.width - subImageBounds.x > image.getWidth()     
               || subImageBounds.height - subImageBounds.y > image.getHeight()) {     
    	   return null;
       }     
       BufferedImage subImage = image.getSubimage(subImageBounds.x,subImageBounds.y, subImageBounds.width, subImageBounds.height);     
       ByteArrayOutputStream os = new ByteArrayOutputStream();  
       byte[] buff_img=null;
       InputStream in=null;
       try{
         ImageIO.write(subImage, image_suffix, os);  
         buff_img= os.toByteArray();
     }catch(Exception e){
	   	  logger.info("��ȡ��ͼƬתbyte[]ʧ��!");
	   	  logger.error(e);
     }finally{
    	 try {
	   		  if(null != in){
	   			  in.close();
	   		  }
	   		  if(null != os){
	   			  os.close();
	   		  }
		} catch (IOException e) {
			  logger.info("���ر�ʧ��!");
			  logger.error(e);
		}
     }
       return buff_img;
   }   
      
   public static byte[] compress(InputStream in, String image_suffix, int proportion) {  
       if(null == in   ||null == image_suffix ||proportion < 1){// ��������Ч��  
           //LoggerUtil.error(ImageHelper.class, "--invalid parameter, do nothing!");  
           return null;  
       }  
       byte[] buff_img=null;
       BufferedImage srcImage = null;  
       try {  
           srcImage = ImageIO.read(in);  
       // ԭͼ�Ĵ�С  
       int width = srcImage.getWidth() / proportion;  
       int hight = srcImage.getHeight() / proportion;  
  
       srcImage = resize(srcImage, width, hight);  
  
       // ���ź��ͼ��Ŀ�͸�  
       int w = srcImage.getWidth();  
       int h = srcImage.getHeight();  
       // ������ź��ͼ���Ҫ���ͼ����һ�����Ͷ����ŵ�ͼ��ĸ߶Ƚ��н�ȡ  
       if (w == width) {  
           // ����X������  
           int x = 0;  
           int y = h / 2 - hight / 2;  
           buff_img=saveSubImage(srcImage, new Rectangle(x, y, width, hight), image_suffix);  
       }  
       // ������������ź��ͼ��ĸ߶Ⱥ�Ҫ���ͼ��߶�һ�����Ͷ����ź��ͼ��Ŀ�Ƚ��н�ȡ  
       else if (h == hight) {  
           // ����X������  
           int x = w / 2 - width / 2;  
           int y = 0;  
           buff_img=saveSubImage(srcImage, new Rectangle(x, y, width, hight), image_suffix);  
       } 
       } catch (IOException e) {  
    	   logger.info("ѹ��ͼƬʧ��!");
           logger.error(e);
        }finally{
        	try {
        		if(null != in){
        		   in.close();
        		}
			} catch (IOException e) {
				logger.error(e);
			}
        }  
  
       return buff_img;  
   }  
}  
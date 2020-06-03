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
 * @描述: 图片工具类，完成图片的截取 ,并转化成byte[]
 * @公司: 思迪科技
 * @作者: yanghl
 * @创建日期: 2017年11月9日
 * @创建时间: 下午6:21:25
 */
public class ImageUtil {  
	
	private static Logger logger=Logger.getLogger(ImageUtil.class);
	  /**   
     * 实现图像的等比缩放   
     * @param source   
     * @param targetW   
     * @param targetH   
     * @return   
     */    
    private static BufferedImage resize(BufferedImage source, int targetW,     
            int targetH) {     
        // targetW，targetH分别表示目标长和宽     
        int type = source.getType();     
        BufferedImage target = null;     
        double sx = (double) targetW / source.getWidth();     
        double sy = (double) targetH / source.getHeight();     
        // 这里想实现在targetW，targetH范围内实现等比缩放。如果不需要等比缩放     
        // 则将下面的if else语句注释即可     
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
     * @描述：实现缩放后的截图 ,并转换成byte[]
     * @作者： yanghl
     * @创建日期: 2017年11月10日
     * @创建时间: 上午10:54:13
     * @param image 缩放后的图像 
     * @param subImageBounds 要截取的子图的范围 
     * @param image_suffix  要保存的文件 后缀名
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
	   	  logger.info("截取的图片转byte[]失败!");
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
			  logger.info("流关闭失败!");
			  logger.error(e);
		}
     }
       return buff_img;
   }   
      
   public static byte[] compress(InputStream in, String image_suffix, int proportion) {  
       if(null == in   ||null == image_suffix ||proportion < 1){// 检查参数有效性  
           //LoggerUtil.error(ImageHelper.class, "--invalid parameter, do nothing!");  
           return null;  
       }  
       byte[] buff_img=null;
       BufferedImage srcImage = null;  
       try {  
           srcImage = ImageIO.read(in);  
       // 原图的大小  
       int width = srcImage.getWidth() / proportion;  
       int hight = srcImage.getHeight() / proportion;  
  
       srcImage = resize(srcImage, width, hight);  
  
       // 缩放后的图像的宽和高  
       int w = srcImage.getWidth();  
       int h = srcImage.getHeight();  
       // 如果缩放后的图像和要求的图像宽度一样，就对缩放的图像的高度进行截取  
       if (w == width) {  
           // 计算X轴坐标  
           int x = 0;  
           int y = h / 2 - hight / 2;  
           buff_img=saveSubImage(srcImage, new Rectangle(x, y, width, hight), image_suffix);  
       }  
       // 否则如果是缩放后的图像的高度和要求的图像高度一样，就对缩放后的图像的宽度进行截取  
       else if (h == hight) {  
           // 计算X轴坐标  
           int x = w / 2 - width / 2;  
           int y = 0;  
           buff_img=saveSubImage(srcImage, new Rectangle(x, y, width, hight), image_suffix);  
       } 
       } catch (IOException e) {  
    	   logger.info("压缩图片失败!");
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
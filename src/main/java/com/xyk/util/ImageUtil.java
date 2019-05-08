package com.xyk.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.codec.binary.Base64;

public class ImageUtil {
	// 图片转化成base64字符串
	public static String getImageStr(String imgFilePath) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
		InputStream in = null;
		byte[] data = null;//byte数组
		// 读取图片字节数组
		try {
			in = new FileInputStream(imgFilePath);//将图片放入输入流 FileInputStream字节流
			data = new byte[in.available()];//要一次读取多个字节时，经常用到InputStream.available()方法，这个方法可以在读写操作前先得知数据流里有多少个字节可以读取。
			in.read(data);//读到data  Byte数组中
			in.close();//关闭流
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 对字节数组Base64编码
		return Base64.encodeBase64String(data);// 返回Base64编码过的字节数组字符串
	}

	public static void main(String[] args) { generateImage("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","F:/cc.png");


    }
	// base64字符串转化成图片
	public static boolean generateImage(String imgStr, String imgFilePath) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgStr == null) // 图像数据为空
			return false;
		try {
			// Base64解码
			byte[] b = Base64.decodeBase64(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			File file = new File(imgFilePath);
			File fileParent = file.getParentFile();
			if (!fileParent.exists()) {
				fileParent.mkdirs();
			}
			if (!file.exists()) {
				file.createNewFile();
			}
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}

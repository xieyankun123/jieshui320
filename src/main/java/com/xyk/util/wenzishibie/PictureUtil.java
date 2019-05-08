package com.xyk.util.wenzishibie;

import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 */

public class PictureUtil {

    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        try {
            // 用java JDK自带的URL去请求
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            // 设置该请求的消息头
            // 设置HTTP方法：POST
            connection.setRequestMethod("POST");
            // 设置其Header的Content-Type参数为application/x-www-form-urlencoded
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            // 填入apikey到HTTP header
            connection.setRequestProperty("apikey", "im2FvlNY118fpB4HfOQoVi8u");
            // 将第二步获取到的token填入到HTTP header
            connection.setRequestProperty("access_token", baiduOcr.getAuth());
            connection.setDoOutput(true);
            connection.getOutputStream().write(httpArg.getBytes("UTF-8"));
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String zhuanhuan(File file) {
        // 获取本地的绝对路径图片
        // 进行BASE64位编码
        String imageBase = BASE64.encodeImgageToBase64(file);
        imageBase = imageBase.replaceAll("\r\n", "");
        imageBase = imageBase.replaceAll("\\+", "%2B");
        // 百度云的文字识别接口,后面参数为获取到的token
        String httpUrl = "https://aip.baidubce.com/rest/2.0/ocr/v1/accurate_basic?access_token=" + baiduOcr.getAuth();
        String httpArg = "detect_direction=true&id_card_side=front&image=" + imageBase;
        String jsonResult = request(httpUrl, httpArg);
//        System.out.println("返回的结果--------->" + jsonResult);
        JSONObject jsStr = JSONObject.parseObject(jsonResult);
        String words_result = jsStr.getString("words_result");
//        JSONObject s = JSONObject.parseObject(words_result); //将字符串{“id”：1}
//        System.out.println(s.getString("words"));
        return jsonResult;

    }
}
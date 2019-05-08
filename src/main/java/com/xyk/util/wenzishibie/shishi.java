package com.xyk.util.wenzishibie;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.xmlbeans.SchemaType;

import java.io.File;

public class shishi {
    public static String getzvalue(File file) {
       // File file = new File("F:\\biaohao.jpg");
        String result = PictureUtil.zhuanhuan(file);
        JSONObject obj = JSONObject.parseObject(result);
        JSONArray words_result = obj.getJSONArray("words_result");
        String words = words_result.getJSONObject(0).getString("words");
        return words;
    }

    public static void main(String[] args) {
        File file = new File("F:\\line_18.jpg");
        String result = PictureUtil.zhuanhuan(file);
        JSONObject obj = JSONObject.parseObject(result);
        JSONArray words_result = obj.getJSONArray("words_result");
        String words = words_result.getJSONObject(0).getString("words");
        System.out.println(words);
    }
}

package com.xyk.util;

import org.junit.platform.commons.util.StringUtils;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by geely
 */
public class ContainerSingleton {

    private ContainerSingleton(){

    }
    private static Map<String,String> singletonMap = new HashMap<String,String>();

    public static void putInstance(String key,String instance){
        if(StringUtils.isNotBlank(key) && instance != null){
           // if(!singletonMap.containsKey(key)){
                singletonMap.put(key,instance);
           // }
        }
    }

    public static String getInstance(String key){
        if(singletonMap.size()==0)
        {singletonMap.put("imagename",",");}
        return singletonMap.get(key);
    }
}

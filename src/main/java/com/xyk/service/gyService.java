package com.xyk.service;

import com.xyk.dao.gyDao;
import com.xyk.model.gyModel;
import com.xyk.util.TwoDimensionCode;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class gyService {
    @Resource
    private gyDao gd;
    public List<gyModel> selbyid(String apartment_id){return gd.selbyid(apartment_id);}
    public List<gyModel> list(){return  gd.list();}
    public void add(gyModel gyModel){
        gd.add(gyModel);}
    public void update(gyModel gyModel){gd.update(gyModel);}
    public boolean updateName(int id,String own)
    {
        boolean b = gd.updateName(id, own);
        return b;
    }
    public boolean updateTime(String apartment_id,String lasttime)
    {
        boolean b = gd.updateTime(apartment_id,lasttime);
        return b;
    }

    public boolean updateLL(int id, String longitude, String latitude) {
        boolean b = gd.updateLL(id,longitude,latitude);
        return b;
    }
}

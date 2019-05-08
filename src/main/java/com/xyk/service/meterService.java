package com.xyk.service;

import com.xyk.dao.meterDao;
import com.xyk.model.dianModel;
import com.xyk.model.gasModel;
import com.xyk.model.waterModel;
import com.xyk.model.waterrModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class meterService {
    @Resource
    private meterDao md;
    public List<waterrModel> list(){return md.list();}
    public boolean add(waterrModel a){return md.add(a);}
    public boolean update(String value,String jiaozhun,String jiaozhuntime,int id){return md.update(value,jiaozhun,jiaozhuntime,id);}
    public List<waterrModel> s(String WID_out){return md.s(WID_out);}
    public boolean updateZvalue(String zzvalue,int id){return md.updateZvalue(zzvalue,id);}
}

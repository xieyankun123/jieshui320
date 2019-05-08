package com.xyk.dao;

import com.xyk.model.dianModel;
import com.xyk.model.gasModel;
import com.xyk.model.waterModel;
import com.xyk.model.waterrModel;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface meterDao {
    List<waterrModel> list();
    boolean add(waterrModel a);
    boolean update(@Param("value")String value,@Param("jiaozhun")String jiaozhun,@Param("jiaozhuntime")String jiaozhuntime,@Param("id")int id);
    List<waterrModel> s(String WID_out);
    boolean updateZvalue(@Param("zzvalue")String zzvalue, @Param("id")int id);
}

package com.xyk.dao;

import com.xyk.model.gyModel;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface gyDao {
    List<gyModel> selbyid(String apartment_id);
    List<gyModel> list();
    void add(gyModel gyModel);
    void update(gyModel gyModel);
    boolean updateName(@Param("id")int id,@Param("owner") String owner);
    boolean updateTime(@Param("apartment_id")String apartment_id,@Param("lasttime") String lasttime);
    boolean updateLL(@Param("id")int id, @Param("longitude") String longitude, @Param("latitude")String latitude);
}

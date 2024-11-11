package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.Commond;
import com.recruit.dao.gen.model.CommondCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommondMapper {
    int countByExample(CommondCriteria example);

    int deleteByExample(CommondCriteria example);

    int deleteByPrimaryKey(Integer commondId);

    int insert(Commond record);

    int insertSelective(Commond record);

    List<Commond> selectByExample(CommondCriteria example);

    Commond selectByPrimaryKey(Integer commondId);

    int updateByExampleSelective(@Param("record") Commond record, @Param("example") CommondCriteria example);

    int updateByExample(@Param("record") Commond record, @Param("example") CommondCriteria example);

    int updateByPrimaryKeySelective(Commond record);

    int updateByPrimaryKey(Commond record);
}
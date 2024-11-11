package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.EmpLook;
import com.recruit.dao.gen.model.EmpLookCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpLookMapper {
    int countByExample(EmpLookCriteria example);

    int deleteByExample(EmpLookCriteria example);

    int deleteByPrimaryKey(Integer lookId);

    int insert(EmpLook record);

    int insertSelective(EmpLook record);

    List<EmpLook> selectByExample(EmpLookCriteria example);

    EmpLook selectByPrimaryKey(Integer lookId);

    int updateByExampleSelective(@Param("record") EmpLook record, @Param("example") EmpLookCriteria example);

    int updateByExample(@Param("record") EmpLook record, @Param("example") EmpLookCriteria example);

    int updateByPrimaryKeySelective(EmpLook record);

    int updateByPrimaryKey(EmpLook record);
}
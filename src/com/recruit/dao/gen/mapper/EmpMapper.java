package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.Emp;
import com.recruit.dao.gen.model.EmpCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmpMapper {
    int countByExample(EmpCriteria example);

    int deleteByExample(EmpCriteria example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Emp record);

    int insertSelective(Emp record);

    List<Emp> selectByExample(EmpCriteria example);

    Emp selectByPrimaryKey(Integer empId);

    int updateByExampleSelective(@Param("record") Emp record, @Param("example") EmpCriteria example);

    int updateByExample(@Param("record") Emp record, @Param("example") EmpCriteria example);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
}
package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.Company;
import com.recruit.dao.gen.model.CompanyCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CompanyMapper {
    int countByExample(CompanyCriteria example);

    int deleteByExample(CompanyCriteria example);

    int deleteByPrimaryKey(Integer comId);

    int insert(Company record);

    int insertSelective(Company record);

    List<Company> selectByExample(CompanyCriteria example);

    Company selectByPrimaryKey(Integer comId);

    int updateByExampleSelective(@Param("record") Company record, @Param("example") CompanyCriteria example);

    int updateByExample(@Param("record") Company record, @Param("example") CompanyCriteria example);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
}
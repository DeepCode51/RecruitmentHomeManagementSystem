package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.Info;
import com.recruit.dao.gen.model.InfoCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InfoMapper {
    int countByExample(InfoCriteria example);

    int deleteByExample(InfoCriteria example);

    int deleteByPrimaryKey(Integer infoId);

    int insert(Info record);

    int insertSelective(Info record);

    List<Info> selectByExample(InfoCriteria example);

    Info selectByPrimaryKey(Integer infoId);

    int updateByExampleSelective(@Param("record") Info record, @Param("example") InfoCriteria example);

    int updateByExample(@Param("record") Info record, @Param("example") InfoCriteria example);

    int updateByPrimaryKeySelective(Info record);

    int updateByPrimaryKey(Info record);
}
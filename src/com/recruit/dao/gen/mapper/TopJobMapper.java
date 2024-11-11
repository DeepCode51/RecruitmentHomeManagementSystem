package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.TopJob;
import com.recruit.dao.gen.model.TopJobCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopJobMapper {
    int countByExample(TopJobCriteria example);

    int deleteByExample(TopJobCriteria example);

    int deleteByPrimaryKey(Integer topId);

    int insert(TopJob record);

    int insertSelective(TopJob record);

    List<TopJob> selectByExample(TopJobCriteria example);

    TopJob selectByPrimaryKey(Integer topId);

    int updateByExampleSelective(@Param("record") TopJob record, @Param("example") TopJobCriteria example);

    int updateByExample(@Param("record") TopJob record, @Param("example") TopJobCriteria example);

    int updateByPrimaryKeySelective(TopJob record);

    int updateByPrimaryKey(TopJob record);
}
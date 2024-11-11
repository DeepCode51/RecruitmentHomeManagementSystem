package com.recruit.dao.gen.mapper;

import com.recruit.dao.gen.model.Job;
import com.recruit.dao.gen.model.JobCriteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JobMapper {
    int countByExample(JobCriteria example);

    int deleteByExample(JobCriteria example);

    int deleteByPrimaryKey(Integer jobId);

    int insert(Job record);

    int insertSelective(Job record);

    List<Job> selectByExample(JobCriteria example);

    Job selectByPrimaryKey(Integer jobId);

    int updateByExampleSelective(@Param("record") Job record, @Param("example") JobCriteria example);

    int updateByExample(@Param("record") Job record, @Param("example") JobCriteria example);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}
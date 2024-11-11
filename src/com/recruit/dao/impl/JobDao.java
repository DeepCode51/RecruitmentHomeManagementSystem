package com.recruit.dao.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.recruit.dto.JobDto;

public interface JobDao {
	//查询前人气TOP10
	List<JobDto> findTopTen();
	
	public JobDto findByJobId(@Param("id") int id);
	
	public int  findComJobListcount(@Param("comid") int comid);
	
	public List<JobDto> findComJobList(@Param("comid") int comid,@Param("start") int start,@Param("end") int end);
	
	
	public int  findJobListcount(@Param("jobName") String jobName);
	
	public List<JobDto> findJobList(@Param("jobName") String jobName,@Param("start") int start,@Param("end") int end);
	
	public int updateTopJob(@Param("jobId") int jobId);
	
	public int  findHistoryJobListcount(@Param("jobName") String jobName,@Param("userId") int id);
	
	public List<JobDto> findHistoryJobList(@Param("jobName") String jobName,@Param("userId") int id,@Param("start") int start,@Param("end") int end);
	
}

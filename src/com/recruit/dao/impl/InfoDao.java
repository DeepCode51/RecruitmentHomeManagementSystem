package com.recruit.dao.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recruit.dto.CommondDto;
import com.recruit.dto.InfoDto;

public interface InfoDao {

	

	public int  findMyInfocount(@Param("userId") int userId);
	
	public List<InfoDto> findMyInfoList(@Param("userId") int userId,@Param("start") int start,@Param("end") int end);
	
	public int  findInfocount(@Param("userId") int userId,@Param("status") int status,@Param("isApply") int isApply);
	
	public List<InfoDto> findInfoList(@Param("userId") int userId,@Param("status") int status,@Param("isApply") int isApply,@Param("start") int start,@Param("end") int end);
	
	
	public int  findCommondcount(@Param("infoId") int infoId);
	
	public List<CommondDto> findCommondList(@Param("infoId") int infoId,@Param("start") int start,@Param("end") int end);
	
}

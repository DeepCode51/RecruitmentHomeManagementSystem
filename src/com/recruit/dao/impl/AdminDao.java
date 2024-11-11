package com.recruit.dao.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.recruit.dto.CompanyDto;
import com.recruit.dto.EmpDto;

public interface AdminDao {

	public int  findAllCompanyscount();
	
	public List<CompanyDto> findAllCompanys(@Param("start") int start,@Param("end") int end);
	
	
	public int  findAllEmpscount(@Param("param") String param);
	
	public List<EmpDto> findAllEmpsList(@Param("param") String param,@Param("start") int start,@Param("end") int end);

	public int findCompanyscount(@Param("param") String param);

	public List<CompanyDto> findCompanys(@Param("param") String param,@Param("start") int start, 
			@Param("end")int parseInt);
	
}

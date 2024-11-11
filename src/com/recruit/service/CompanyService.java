package com.recruit.service;

import com.recruit.dao.gen.model.Company;




public interface CompanyService {

	Company findByCompanyname(String username);
	
	//通过用户id 获得公司对象
	Company findByUid(int uid);

	public boolean saveCompany(Company user);
	
	public boolean updateCompany(Company user);
}

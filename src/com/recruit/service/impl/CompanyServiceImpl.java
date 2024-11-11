package com.recruit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.recruit.dao.gen.mapper.CompanyMapper;
import com.recruit.dao.gen.model.Company;
import com.recruit.dao.gen.model.CompanyCriteria;
import com.recruit.service.CompanyService;


@Service
public class CompanyServiceImpl  implements CompanyService{

	@Resource
	CompanyMapper companyMapper;

	
    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
	@Override
    public Company   findByCompanyname(String username) {
		Company user = new Company();
		CompanyCriteria userInfoCriteria = new CompanyCriteria();
		userInfoCriteria.createCriteria().andFullnameEqualTo(username);
		List<Company> users = companyMapper.selectByExample(userInfoCriteria);
		if(users.size()>0){
			return users.get(0);
		}else{
			return null;
		}		

    }

	@Override
	public boolean saveCompany(Company user) {
	int i=	companyMapper.insert(user);
	if(i>0){
		return true;
	}
		return false;
	}

	@Override
	public Company findByUid(int uid) {
		CompanyCriteria cc=new CompanyCriteria();
		cc.createCriteria().andUserIdEqualTo(uid);
		List<Company>  list=companyMapper.selectByExample(cc);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean updateCompany(Company user) {
		int i =companyMapper.updateByPrimaryKeySelective(user);
		if (i > 0) {
			return true;
		}
		return false;
	}
    

}

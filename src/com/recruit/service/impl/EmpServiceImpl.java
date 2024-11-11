package com.recruit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.recruit.dao.gen.mapper.EmpMapper;
import com.recruit.dao.gen.model.Emp;
import com.recruit.dao.gen.model.EmpCriteria;
import com.recruit.service.EmpService;

@Service
public class EmpServiceImpl implements EmpService {

	@Resource
	EmpMapper empMapper;

	@Override
	public boolean saveEmp(Emp user) {
		int i = empMapper.insert(user);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEmp(Emp dp) {
		int i =empMapper.updateByPrimaryKeySelective(dp);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Emp findById(Integer id) {
		EmpCriteria ec=new EmpCriteria();
		ec.createCriteria().andUserIdEqualTo(id);	
	List<Emp> list=	empMapper.selectByExample(ec);
	if(list.size()>0){
		return empMapper.selectByExample(ec).get(0);
	}
	return null;

	}

}

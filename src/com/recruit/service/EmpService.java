package com.recruit.service;

import com.recruit.dao.gen.model.Emp;




public interface EmpService {

	public boolean saveEmp(Emp user);

	public boolean updateEmp(Emp dp);
	
	public Emp findById(Integer id);

}

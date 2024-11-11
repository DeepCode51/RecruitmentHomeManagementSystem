package com.recruit.service;

import com.recruit.dao.gen.model.Commond;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;




public interface CommondService {

	public boolean saveCommond(Commond user);

	public boolean updateCommond(Commond dp);
	
	public JqueryDto findByInfoId(Pager page,Integer id);
	

}

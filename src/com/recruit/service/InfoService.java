package com.recruit.service;

import com.recruit.dao.gen.model.Info;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;




public interface InfoService {

	public boolean saveInfo(Info user);

	public boolean updateInfo(Info dp);
	
	public Info findById(Integer id);
	
	public JqueryDto findMyInfoList(Pager pager,int userId);

	JqueryDto findInfoList(Pager pager, int userId, int status,int isApply);

}

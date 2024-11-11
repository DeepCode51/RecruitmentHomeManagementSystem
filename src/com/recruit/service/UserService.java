package com.recruit.service;

import com.recruit.dao.gen.model.User;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;



public interface UserService {
	public User login(User user);

	User findByUsername(String username);

	public boolean saveUser(User user);
	
	public boolean updateUser(User user);
	
	public JqueryDto findAllCompanys(Pager pager);
	
	public JqueryDto findAllEmps(Pager pager, String param);

	public JqueryDto findAllCompanys(Pager pager, String param);
}

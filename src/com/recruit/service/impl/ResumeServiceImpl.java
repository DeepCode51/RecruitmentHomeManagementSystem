package com.recruit.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.recruit.dao.gen.mapper.ComResumeMapper;
import com.recruit.dao.gen.model.ComResume;
import com.recruit.service.ResumeService;
@Service
public class ResumeServiceImpl implements ResumeService{
	@Resource
	ComResumeMapper resumeMapper;
	@Override
	public boolean saveResume(ComResume user) {
		int i=resumeMapper.insert(user);
		if (i > 0) {
			return true;
		}

		return false;
	}

}

package com.recruit.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.recruit.dao.gen.mapper.JobMapper;
import com.recruit.dao.gen.mapper.TopJobMapper;
import com.recruit.dao.gen.model.Job;
import com.recruit.dao.gen.model.TopJob;
import com.recruit.dao.impl.JobDao;
import com.recruit.dto.JobDto;
import com.recruit.service.JobService;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;


@Service
public class JobServiceImpl implements JobService {

	@Resource
	JobMapper jobMapper;
	@Resource
	TopJobMapper topJobMapper;

	@Resource
	JobDao jobDao;

	@Override
	public boolean saveJob(Job job) {
		int i = jobMapper.insert(job);
		TopJob tj=new TopJob();
		tj.setCount(0);
		tj.setJobId(job.getJobId());
		tj.setJobName(job.getJobName());
		topJobMapper.insert(tj);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateJob(Job dp) {
		int i =jobMapper.updateByPrimaryKeySelective(dp);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<JobDto> findTen() {
    return jobDao.findTopTen();
	}

	@Override
	public JobDto findByJobId(int id) {
		 saveTopJob(id);
		 return jobDao.findByJobId(id);
	}

	@Override
	public JqueryDto findComJobList(Pager pager,int comid) {
		//查询总数
	int total=jobDao.findComJobListcount(comid);
	int start =Integer.parseInt(pager.getPage())-1;
	List<JobDto> list=jobDao.findComJobList(comid, start, Integer.parseInt(pager.getRows()));
	JqueryDto dto=new JqueryDto();
	dto.setTotal(total);
	pager.setObj(list);
//	String json = net.sf.json.JSONArray.fromObject(pager.getObj()).toString();
	dto.setRows(list);
		//查询分页条数
		return dto;
	}

	@Override
	public boolean del(int id) {
   int i= jobMapper.deleteByPrimaryKey(id);	
	if (i > 0) {
		return true;
	}
	return false;
	}

	@Override
	public JqueryDto findJobList(Pager pager, Job job) {
		//查询总数
		int total=jobDao.findJobListcount(job.getJobName());
		int start =Integer.parseInt(pager.getPage())-1;
		List<JobDto> list=jobDao.findJobList(job.getJobName(), start, Integer.parseInt(pager.getRows()));
		JqueryDto dto=new JqueryDto();
		dto.setTotal(total);
		pager.setObj(list);
//		String json = net.sf.json.JSONArray.fromObject(pager.getObj()).toString();
		dto.setRows(list);
			//查询分页条数
			return dto;
	}

	@Override
	public boolean saveTopJob(int jobId) {
		  int i= jobDao.updateTopJob(jobId);	
			if (i > 0) {
				return true;
			}
			return false;
	}

	@Override
	public JqueryDto findHistoryJobList(Pager pager, Job job,int userId) {
		//查询总数
				int total=jobDao.findHistoryJobListcount(job.getJobName(),userId);
				int start =Integer.parseInt(pager.getPage())-1;
				List<JobDto> list=jobDao.findHistoryJobList(job.getJobName(), userId,start, Integer.parseInt(pager.getRows()));
				JqueryDto dto=new JqueryDto();
				dto.setTotal(total);
				pager.setObj(list);
//				String json = net.sf.json.JSONArray.fromObject(pager.getObj()).toString();
				dto.setRows(list);
					//查询分页条数
					return dto;
	}



}

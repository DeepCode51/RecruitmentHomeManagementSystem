package com.recruit.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.ComResume;
import com.recruit.dao.gen.model.Company;
import com.recruit.dao.gen.model.Emp;
import com.recruit.dao.gen.model.Job;
import com.recruit.dao.gen.model.User;
import com.recruit.dto.JobDto;
import com.recruit.service.CompanyService;
import com.recruit.service.EmpService;
import com.recruit.service.JobService;
import com.recruit.service.ResumeService;
import com.recruit.util.BaseResponse;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;
import com.recruit.util.PagerUtils;

@Controller
@RequestMapping("/job")
public class JobController {

	@Resource
	JobService jobService;

	@Resource
	CompanyService companyService;
	
	@Resource
EmpService empService;
	
	@Resource
ResumeService resumeService;

	@RequestMapping(value = "/goSaveJob")
	public ModelAndView goSaveJob(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {

		}
		ModelAndView view = new ModelAndView();
		// if (flag.equals("1")) {
		// // 允许注册
		// view.setViewName("user/registerSuccess");
		// } else {
		// // 不允许注册
		// view.setViewName("job/jobRegister.jsp");
		// }
		view.setViewName("job/jobRegister");
		return view;
	}

	/**
	 * 保存用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveJob", method = RequestMethod.POST)
	public void saveJob(Job job, HttpServletRequest request,
			HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		Company com = companyService.findByUid(user.getId());
		boolean iscom = false;
		if (com.getComId() == null) {
			iscom = false;
		} else {
			iscom = true;
		}
		job.setComId(com.getComId());
		boolean flag = jobService.saveJob(job);

		try {
			if (flag && iscom) {
				response.setContentType("text/html;charset=utf-8");

				response.getWriter().print(1);

			} else if (iscom = false) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("对不起,该账号还未完成公司信息注册!!!");
			} else {

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/goSuccess")
	public ModelAndView goSuccess(String flag) {
		ModelAndView view = new ModelAndView();
		if (flag.equals("1")) {
			// 允许注册
			view.setViewName("user/registerSuccess");
		} else {
			// 不允许注册
			view.setViewName("user/empInfoRegister");
		}

		return view;
	}

	@RequestMapping(value = "/uploadImage")
	public void upload(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response,
			Integer eid) {

		// model.addAttribute("fileUrl",
		// request.getContextPath()+"/photo/"+fileName);

	}

	@ResponseBody
	@RequestMapping(value = "/findTen", method = RequestMethod.GET)
	public BaseResponse findTen(HttpSession session,
			HttpServletRequest request) {
		BaseResponse baseResponse = new BaseResponse();

		baseResponse.setStatus(200);

		baseResponse.setContent(jobService.findTen());
		return baseResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findByJobId", method = RequestMethod.GET)
	public BaseResponse findByJobId(HttpSession session,
			HttpServletRequest request,int id) {
		BaseResponse baseResponse = new BaseResponse();

		baseResponse.setStatus(200);

		baseResponse.setContent(jobService.findByJobId(id));
		return baseResponse;
	}
	@ResponseBody
	@RequestMapping(value="findComJobList")
	public JqueryDto findComJobList(HttpServletRequest request,HttpServletResponse response){
	//查询总数
		User user = (User) request.getSession().getAttribute("user");
		if (user == null||user.getStatus()==1) {
             return null;
		}
	Company  c=companyService.findByUid(user.getId());
	
	//查询分数LIST	
	Pager	pager = PagerUtils.getPager(request);
	
		return jobService.findComJobList(pager, c.getComId());
	}
	
	@RequestMapping(value = "/goComJobList")
	public ModelAndView goComJobList(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {

		}
		ModelAndView view = new ModelAndView();
		// if (flag.equals("1")) {
		// // 允许注册
		// view.setViewName("user/registerSuccess");
		// } else {
		// // 不允许注册
		// view.setViewName("job/jobRegister.jsp");
		// }
		view.setViewName("job/jobManager");
		return view;
	}
	@ResponseBody
	@RequestMapping(value = "/updateComJob")
	public Job updateComJob(
			HttpServletRequest request, HttpServletResponse response,
			Job job) {
		boolean flag = jobService.updateJob(job);
		return job;


		// model.addAttribute("fileUrl",
		// request.getContextPath()+"/photo/"+fileName);

	}

   @RequestMapping(value ="editOrSaveComJob", method = RequestMethod.POST)  
   public void editOrSavejob(Job job,HttpServletResponse response) {  
       String message = "";  
       try{  
           jobService.updateJob(job);  
           response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(1);
       }catch(Exception e){  
    	   e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			try {
				response.getWriter().print(0);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
       }  
		
         

   }  
   @RequestMapping(value ="delJob", method = RequestMethod.GET)  
   public void delJob(int id,HttpServletResponse response) {  
       String message = "";  
       try{  
          boolean f=  jobService.del(id);  
          if(f){
              response.setContentType("text/html;charset=utf-8");
  			response.getWriter().print(1);  
          }else{
              response.setContentType("text/html;charset=utf-8");
  			response.getWriter().print(0);
          }

       }catch(Exception e){  
    	   e.printStackTrace();
			response.setContentType("text/html;charset=utf-8");
			try {
				response.getWriter().print(0);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
       }  
		
         

   }  
     
	@ResponseBody
	@RequestMapping(value="findJobList")
	public JqueryDto findJobList(HttpServletRequest request,HttpServletResponse response,String jobName){
	//查询总数
//		User user = (User) request.getSession().getAttribute("user");
//		if (user == null||user.getStatus()==1) {
//            return null;
//		}
//	Company  c=companyService.findByUid(user.getId());
	Job job=new Job();
	job.setJobName(jobName);
	//查询分数LIST	
	Pager	pager = PagerUtils.getPager(request);
		return jobService.findJobList(pager, job);
	}
	
	   @RequestMapping(value ="applyJob", method = RequestMethod.POST)  
	   public void applyJob(JobDto dto,HttpServletResponse response,HttpServletRequest request) {  
			User user = (User) request.getSession().getAttribute("user");
			if (user == null||user.getStatus()==2) {
		          response.setContentType("text/html;charset=utf-8");
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
	       try{  
	    	 Emp emp=  empService.findById(user.getId());
	    	 
	    	 
	    	 if(emp==null||emp.getResumeName()==null||"".endsWith(emp.getResumeName())){
	             response.setContentType("text/html;charset=utf-8");
	  			 response.getWriter().print(3);  
	  			 return;
	    	 }
	    	 ComResume cr=new ComResume();
	    	 cr.setComId(dto.getComId());
	    	 cr.setEmpId(emp.getEmpId());
	    	 cr.setJobId(dto.getJobId());
	    	 cr.setLook(0);
	    	 cr.setResumeName(emp.getResumeName());
	    	 cr.setStatus("0");
//	   查询用户对应的简历名称是否存在
	    	boolean f= resumeService.saveResume(cr);
	    	  //插入对应职位表
	          if(f){
	              response.setContentType("text/html;charset=utf-8");
	  			response.getWriter().print(1);  
	          }else{
	              response.setContentType("text/html;charset=utf-8");
	  			response.getWriter().print(0);
	          }

	       }catch(Exception e){  
	    	   e.printStackTrace();
				response.setContentType("text/html;charset=utf-8");
				try {
					response.getWriter().print(0);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
	       }  
			
	         

	   }  
  
}

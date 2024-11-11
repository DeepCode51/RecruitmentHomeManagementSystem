package com.recruit.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.Emp;
import com.recruit.dao.gen.model.Job;
import com.recruit.dao.gen.model.User;
import com.recruit.service.EmpService;
import com.recruit.service.JobService;
import com.recruit.service.PhotoService;
import com.recruit.service.ResumeService;
import com.recruit.util.BaseResponse;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;
import com.recruit.util.PagerUtils;

@Controller
@RequestMapping("/emp")
public class EmpController {

	@Resource
	EmpService empService;
	
	@Resource
	PhotoService photoService;
	
	@Resource
ResumeService resumeService;
	

	@Resource
	JobService jobService;

	/**
	 * 保存用户
	 * 
	 * @return
	 */
	@RequestMapping(value = "/saveEmp")
	public  void saveEmp(Emp emp, HttpServletRequest request,HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		emp.setUserId(user.getId());

		boolean flag = empService.saveEmp(emp);
		
		try {
			if (flag) {
				response.setContentType("text/html;charset=utf-8");
			
				response.getWriter().print(emp.getEmpId());
			
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(0);
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	
	}
	
	@RequestMapping(value = "/updateEmp")
	public  void updateEmp(Emp emp, HttpServletRequest request,HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		emp.setUserId(user.getId());

		boolean flag = empService. updateEmp(emp);
		
		try {
			if (flag) {
				response.setContentType("text/html;charset=utf-8");
			
				response.getWriter().print(emp.getEmpId());
			
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(0);
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	
	}
	@RequestMapping(value = "/goSuccess")
	public ModelAndView  goSuccess(String flag) {
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
	    public void upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response, Integer eid) {  
	  
				boolean flag =photoService.saveDpersonImage(request, file, eid);


				
				try {
					if (flag) {
						response.setContentType("text/html;charset=utf-8");
					
						response.getWriter().print(1);
					
					} else {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().print(0);
					}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        //model.addAttribute("fileUrl", request.getContextPath()+"/photo/"+fileName);  

	    }  
		@RequestMapping(value = "/goEmpInfo")
		public ModelAndView  goEmpInfo() {
			ModelAndView view = new ModelAndView();

				// 允许注册
				view.setViewName("user/empInfo");


			return view;
		}
		@ResponseBody
		@RequestMapping(value = "/findEmpById")
		public BaseResponse findEmpById(HttpServletRequest request){
			//Company company=companyService.findByCompanyname(fullname);
			User user=	(User) request.getSession().getAttribute("user");
			BaseResponse b=new BaseResponse();
			
			if(user==null){
				//允许注册
				b.setStatus(400);
			
			}else if(user.getStatus()==2){
				b.setStatus(500);
				
			}else{
				
				Emp emp=empService.findById(user.getId());
				b.setStatus(200);
				b.setContent(emp);
			
			}

			return b;
			
		}
		@RequestMapping(value = "/goHistoryJobList")
		public ModelAndView  goHistoryJobList() {
			ModelAndView view = new ModelAndView();
			view.setViewName("job/historyJobList");
//			view.setViewName("user/MyJsp");
			return view;
		}
		@ResponseBody
		@RequestMapping(value="findHistoryJobList")
		public JqueryDto findHistoryJobList(HttpServletRequest request,HttpServletResponse response,Job job){
		//查询总数
			User user = (User) request.getSession().getAttribute("user");
			if (user == null||user.getStatus()==2) {
	            return null;
			}
//		Company  c=companyService.findByUid(user.getId());
		
		//查询分数LIST	
		Pager	pager = PagerUtils.getPager(request);
		
			return jobService.findHistoryJobList(pager, job, user.getId());
		}
}

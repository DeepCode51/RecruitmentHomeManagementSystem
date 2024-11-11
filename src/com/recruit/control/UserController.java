package com.recruit.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.Info;
import com.recruit.dao.gen.model.User;
import com.recruit.dto.JobDto;
import com.recruit.service.CommondService;
import com.recruit.service.InfoService;
import com.recruit.service.JobService;
import com.recruit.service.UserService;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;
import com.recruit.util.PagerUtils;




@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	UserService userService;
	
	@Resource
	JobService jobService;

	@Resource
	InfoService infoService;
	@Resource
	CommondService  cService;
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping(value = "/goMain")
	public ModelAndView  goMain() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	@RequestMapping(value = "/goCompany")
	public ModelAndView  goCompany() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("user/comRegister");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goUserInfo")
	public ModelAndView  goUserInfo() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("user/userInfo");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goSuccess")
	public ModelAndView  goSuccess() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("user/registerSuccess");
//		view.setViewName("user/MyJsp");
		return view;
	}

	@ResponseBody
	@RequestMapping(value = "/checkUsername")
	public String checkUsername(String  username){
		User user=userService.findByUsername(username);
		
		if(user==null){
			//允许注册
			return "1";
		}else{
			//不允许注册
			return "0";
		}

	}
	
	/**
	 * 保存用户
	 * @return
	 */
	@RequestMapping(value = "/saveUser")
	public ModelAndView  saveUser(User  user,HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
	boolean flag=userService.saveUser(user);
	request.getSession().setAttribute("user", user);
		if(flag==true){
			//允许注册
			if(user.getStatus()==1){
				view.setViewName("user/empInfoRegister");
			}else{
				view.setViewName("user/comInfoRegister");
			}

		}else{
			//不允许注册
			view.setViewName("user/comRegister");
		}


		return view;
	}
	@ResponseBody
	@RequestMapping(value = "/updateUserInfo")
	public String updateUserInfo(User  user){
		boolean flag=userService.updateUser(user);
		
		if(flag){
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.getSession().setAttribute("user", user);
			return "1";
		}else{
			//不允许注册
			return "0";
		}

		
	}
	@RequestMapping(value = "/goJobList")
	public ModelAndView  goJobList() {
		ModelAndView view = new ModelAndView();
		view.setViewName("job/jobList");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goJobList2")
	public ModelAndView  goJobList2(String  param) {
		ModelAndView view = new ModelAndView();

		view.addObject("param", param);
		view.setViewName("job/jobList");
//		view.setViewName("user/MyJsp");
		return view;
	}
	
	@RequestMapping(value = "/goJobDetail")
	public ModelAndView  goJobDetail(int id) {
		if(id != 0){
			//首先插入简历浏览表
			System.out.println("当前这份工作的id为："+id);
			
		}
		JobDto job=jobService.findByJobId(id);
	    
		ModelAndView view = new ModelAndView();
		view.addObject("job", job);
		view.setViewName("job/jobInfo");
//		view.setViewName("user/MyJsp");
		return view;
	}
	@RequestMapping(value = "/goInfoList")
	public ModelAndView  goInfoList() {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("info/listInfo");
//		view.setViewName("user/MyJsp");
		return view;
	}
	@RequestMapping(value = "/goCommond")
	public ModelAndView  goCommond(int id) {
		Info info=infoService.findById(id);
		ModelAndView view = new ModelAndView();
		view.addObject("info", info);
		view.setViewName("info/commond");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findCommondById", method = RequestMethod.POST)
	public JqueryDto findCommondById(HttpSession session,
			HttpServletRequest request,int id ) {
		Pager	pager = PagerUtils.getPager(request);
                   
		return cService.findByInfoId(pager, id);
	}
}

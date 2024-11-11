package com.recruit.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.User;
import com.recruit.service.UserService;
import com.recruit.util.BaseResponse;
import com.recruit.util.UserUtil;




@Controller
@RequestMapping("/")
public class LoginController {
	@Resource
	UserService userService;
	
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
	/**
	 * 进入数据录入页面
	 * @return
	 */
	@RequestMapping(value = "/goLogin")
	public ModelAndView enterPage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("login");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public BaseResponse getbyid(HttpSession session, HttpServletRequest request, String username,String pwd) {
		BaseResponse baseResponse=new BaseResponse();
		User user=new User();
		user.setUsername(username);
		user.setPwd(pwd);
		user.setStatus(0);
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
		token.setRememberMe(false);
		try {
			currentUser.login(token);
		} catch (AuthenticationException e) {
			e.printStackTrace();
			return BaseResponse.STATUS_500;
		}

		if(currentUser.isAuthenticated()){
			user = userService.findByUsername(username);
			currentUser.getSession().setAttribute("user", user);
			
			baseResponse.setStatus(200);
	
		}
		baseResponse.setContent(user);
		return baseResponse;
	}
	

	/**
	 * 进入数据录入页面
	 * @return
	 */
	@RequestMapping(value = "/admin")
	public ModelAndView goAdminLogin() {
		ModelAndView view = new ModelAndView();
		view.setViewName("admin/login");
		return view;
	}
	
	@ResponseBody
	@RequestMapping(value = "/doAdminLogin", method = RequestMethod.POST)
	public BaseResponse doAdminLogin(HttpSession session, HttpServletRequest request, String username,String pwd) {
		BaseResponse baseResponse=new BaseResponse();
		User user=new User();
		user.setUsername(username);
		user.setPwd(pwd);
		user.setStatus(0);
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, pwd);
		token.setRememberMe(false);
		try {
			currentUser.login(token);
		} catch (AuthenticationException e) {
			e.printStackTrace();
			return BaseResponse.STATUS_500;
		}

		if(currentUser.isAuthenticated()){
			user = userService.findByUsername(username);
			currentUser.getSession().setAttribute("user", user);
			if(user.getStatus()==3){
				baseResponse.setStatus(200);
			}else{
				baseResponse.setStatus(400);
			}
			
		
	
		}
		baseResponse.setContent(user);
		return baseResponse;
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout() {
		User user = UserUtil.getUser();
		if(user!=null) {
			// 记录退出		
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.logout();
		}
		
		ModelAndView view = new ModelAndView();
		view.setViewName("index");
		return view;
	}
	
}

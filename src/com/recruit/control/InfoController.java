package com.recruit.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.recruit.dao.gen.model.Info;
import com.recruit.dao.gen.model.User;
import com.recruit.service.InfoService;
import com.recruit.util.DateUtil;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;
import com.recruit.util.PagerUtils;


@Controller
@RequestMapping("/info")
public class InfoController {

	@Resource
	InfoService infoService;


	/**
	 * 保存用户
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
	public  void saveInfo(Info Info, HttpServletRequest request,HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			response.setContentType("text/html;charset=utf-8");
			
			response.getWriter().print("登入之后才能发布信息");
		}
		Info.setUserId(user.getId());
		Info.setIsapply(0);
		Info.setStatus(user.getStatus());
       Info.setCreatedate(DateUtil.currDay());
		boolean flag = infoService.saveInfo(Info);
		
		try {
			if (flag) {
				response.setContentType("text/html;charset=utf-8");
			
				response.getWriter().print(1);
			
			} else {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("发布失败");
			}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	
	}
	
	@RequestMapping(value = "/updateInfo")
	public  void updateInfo(Info Info, HttpServletRequest request,HttpServletResponse response) {
//		User user = (User) request.getSession().getAttribute("user");
//		Info.setUserId(user.getId());

		boolean flag = infoService. updateInfo(Info);
		
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

	
	}
	@RequestMapping(value = "/goAddInfo")
	public ModelAndView  goAddInfo() {
		ModelAndView view = new ModelAndView();
	
			// 允许注册
			view.setViewName("info/saveInfo");


		return view;
	}
	@RequestMapping(value = "/goMyInfo")
	public ModelAndView  goMyInfo() {
		ModelAndView view = new ModelAndView();
	
			// 允许注册
			view.setViewName("info/myInfo");


		return view;
	}
	@RequestMapping(value = "/goInfoList")
	public ModelAndView  goInfoList() {
		ModelAndView view = new ModelAndView();
	
			// 允许注册
			view.setViewName("info/addInfo");


		return view;
	}
	@ResponseBody
	@RequestMapping(value="findMyInfoList", method = RequestMethod.POST)
	public JqueryDto findMyInfoList(HttpServletRequest request,HttpServletResponse response){
	//查询总数
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
            return null;
		}
//	Company  c=companyService.findByUid(user.getId());
	
	//查询分数LIST	
	Pager	pager = PagerUtils.getPager(request);
		return infoService.findMyInfoList(pager, user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value="findInfoList", method = RequestMethod.POST)
	public JqueryDto findInfoList(HttpServletRequest request,HttpServletResponse response,int status,int isApply){
	//查询总数
//		User user = (User) request.getSession().getAttribute("user");
//		if (user == null) {
//            return null;
//		}
//	Company  c=companyService.findByUid(user.getId());
	//查询分数LIST	
    	Pager	pager = PagerUtils.getPager(request);
		return infoService.findInfoList(pager, 0,status,isApply);
	}
	
}

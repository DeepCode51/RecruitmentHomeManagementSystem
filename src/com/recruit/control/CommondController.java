package com.recruit.control;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.recruit.dao.gen.model.Commond;
import com.recruit.dao.gen.model.User;
import com.recruit.service.CommondService;
import com.recruit.util.DateUtil;



@Controller
@RequestMapping("/commond")
public class CommondController {

	@Resource
	CommondService commondService;


	/**
	 * 保存用户
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/saveCommond", method = RequestMethod.POST)
	public  void saveCommond(Commond Commond, HttpServletRequest request,HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			response.setContentType("text/html;charset=utf-8");
			
			response.getWriter().print("登入之后才能发布信息");
			return;
		}
		Commond.setUserId(user.getId());
       Commond.setCreatedate(DateUtil.currDay());
		boolean flag = commondService.saveCommond(Commond);
		
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

	

	
}

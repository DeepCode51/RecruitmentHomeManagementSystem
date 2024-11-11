package com.recruit.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.recruit.dao.gen.model.User;


/**
 * 
 *  
 * @Title:UserUtil 
 * @Description: 用户工具类
 * @Copyright:Copyright (c) 2015
 * @Company:zy
 * @Date:2015-8-25
 * @author hs 
 * @version 1.0
 */
public class UserUtil {

	public static final String USER = "user";

	/**
	 * 设置用户到session
	 * @param session
	 * @param user
	 */
	public static void saveUserToSession(HttpSession session, User user) {
		session.setAttribute(USER, user);
	}
	
	public static void saveUserInfoToSession(HttpSession session, User user) {
		session.setAttribute(USER, user);
	}

	/**
	 * 从Session获取当前用户信息
	 * @param session
	 * @return
	 */
	public static User getUserFromSession(HttpSession session) {
		Object attribute = session.getAttribute(USER);
		return attribute == null ? null : (User) attribute;
	}
	
	/**
	 * 从Session获取当前用户信息
	 * @param session
	 * @return
	 */
	public static User getUser() {
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser!=null) {
			return (User) currentUser.getSession().getAttribute("user");
		}else {
			return null;
		}
	}

	/**
	 * 
	 * @Title:  
	 * @Description:  从session中remove当前用户
	 * @return void 返回类型 
	 * @throws
	 */
	public static void removeUserFromSession(HttpSession session) {
		Object attribute = session.getAttribute(USER);
		if(null != attribute) {
			session.removeAttribute(USER);
		}
	}
	
	@SuppressWarnings("deprecation")
	
	public static void saveDate(HttpSession session) {
		SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new java.util.Date();//得到当前系统时间 
		//String str_date1 = formatter.format(currentTime); //将日期时间格式化 
		
		String monday="";
		Calendar cld = Calendar.getInstance();//取得系统时间星期几
		int weekflag = cld.get(Calendar.DAY_OF_WEEK); //取得系统时间星期几
		@SuppressWarnings("unused")
		String dow ="";
		if (weekflag==1) {
			dow="星期日";
			currentTime.setDate(currentTime.getDate()-6);
		}
		if (weekflag==2) {
			dow="星期一";
		}
		if (weekflag==3) {
			dow="星期二";
			currentTime.setDate(currentTime.getDate()-1);
		}
		if (weekflag==4) {
			dow="星期三";
			currentTime.setDate(currentTime.getDate()-2);
		}
		if (weekflag==5) {
			dow="星期四";
			currentTime.setDate(currentTime.getDate()-3);
		}
		if (weekflag==6) {
			dow="星期五";
			currentTime.setDate(currentTime.getDate()-4);
		}
		if (weekflag==7) {
			dow="星期六";
			currentTime.setDate(currentTime.getDate()-5);
		}
		monday = formatter.format(currentTime);
		session.setAttribute("monday", monday);
		currentTime.setDate(currentTime.getDate()+1);
		String tuesday = formatter.format(currentTime);
		session.setAttribute("tuesday", tuesday);
		currentTime.setDate(currentTime.getDate()+1);
		String wednesday = formatter.format(currentTime);
		session.setAttribute("wednesday", wednesday);
		currentTime.setDate(currentTime.getDate()+1);
		String thursday = formatter.format(currentTime);
		session.setAttribute("thursday", thursday);
		currentTime.setDate(currentTime.getDate()+1);
		String friday = formatter.format(currentTime);
		session.setAttribute("friday", friday);
		currentTime.setDate(currentTime.getDate()+1);
		String saturday = formatter.format(currentTime);
		session.setAttribute("saturday", saturday);
		currentTime.setDate(currentTime.getDate()+1);
		String sunday = formatter.format(currentTime);
		session.setAttribute("sunday", sunday);
		session.setAttribute("rInterval", monday +"-"+ sunday);
	}

}

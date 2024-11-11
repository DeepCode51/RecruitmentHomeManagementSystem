package com.recruit.util;



 

import javax.servlet.http.HttpServletRequest;



public class PagerUtils {
	
	public static Pager getPager(HttpServletRequest req){
		String page = req.getParameter("page")==null?"1":req.getParameter("page");
		String rows = req.getParameter("rows")==null?"1":req.getParameter("rows");
		String[] sort = new String[]{};
		if(req.getParameterValues("sort")!=null){
			sort = req.getParameterValues("sort");
		}
		String[] order = new String[]{};
		if(req.getParameterValues("order")!=null){
			order = req.getParameterValues("order");
		}
		Pager pager =  new Pager(page,rows,sort,order,null,"0");
		return pager;
	}

}

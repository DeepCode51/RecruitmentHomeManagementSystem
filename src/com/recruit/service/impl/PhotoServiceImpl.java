package com.recruit.service.impl;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.recruit.dao.gen.model.Emp;
import com.recruit.service.EmpService;
import com.recruit.service.PhotoService;



@Service("photoServiceService")
@Transactional
public class PhotoServiceImpl implements  PhotoService {
	@Resource
	EmpService empService;

	@Override
	public boolean saveDpersonImage(HttpServletRequest request,MultipartFile file, Integer id) {
		   String path = request.getSession().getServletContext().getRealPath("photo"); 
	        String fileName =com.recruit.util.DateUtil.getCurrDate("yyyy-MM-dd")+"_"+file.getOriginalFilename();  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }else{
	        	targetFile.delete();
	        	targetFile.mkdirs();  
	        } 
		  
	        try {  
	            file.transferTo(targetFile);  
	      	    System.out.println( request.getContextPath()+"/photo/"+fileName);
               Emp dp=new Emp();
              dp.setEmpId(id);
              dp.setImage( request.getContextPath()+"/photo/"+fileName);
				boolean flag = empService.updateEmp(dp);
				return flag;
	        } catch (Exception e) {  
	            e.printStackTrace();  
	            return false;
	        }  
		
	}
	@Override
	public boolean saveEpersonImage(HttpServletRequest request,
			MultipartFile file, Integer id) {
		   String path = request.getSession().getServletContext().getRealPath("photo");  
	        String fileName =file.getOriginalFilename()+"_"+com.recruit.util.DateUtil.getCurrDate("yyyy-MM-dd");  
//	        String fileName = new Date().getTime()+".jpg";  
	        
	        System.out.println(path);  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }else{
	        	targetFile.delete();
	        	targetFile.mkdirs();  
	        } 
		  
	        try {  
	            file.transferTo(targetFile);  
	      	    System.out.println( request.getContextPath()+"/photo/"+fileName);
	      	  Emp dp=new Emp();
              dp.setEmpId(id);
              dp.setImage( request.getContextPath()+"/photo/"+fileName);
				boolean flag = empService.updateEmp(dp);
				return flag;
	        } catch (Exception e) {  
	            e.printStackTrace();  
	            return false;
	        }  
	}

}

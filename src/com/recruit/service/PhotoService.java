package com.recruit.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface PhotoService {

public boolean saveDpersonImage(HttpServletRequest request,MultipartFile file,Integer id);


public boolean saveEpersonImage(HttpServletRequest request,MultipartFile file,Integer id);

}

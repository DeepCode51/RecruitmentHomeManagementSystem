package com.recruit.util;

import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class BaseResponse implements Serializable{

	private static final long serialVersionUID = -28667821450923254L;
	
	private int status;
	private Object content;
	
//	public static BaseResponse STATUS_200 = new BaseResponse(200, "成功");
//	public static BaseResponse STATUS_400 = new BaseResponse(400, "请求出现语法错误");
	public static BaseResponse STATUS_401 = new BaseResponse(401, "认证失败");
	public static BaseResponse STATUS_403 = new BaseResponse(403, "请求被拒绝");
	public static BaseResponse STATUS_404 = new BaseResponse(404, "没有找到指定的文件或目录");
	public static BaseResponse STATUS_408 = new BaseResponse(408, "请求Timeout");
	public static BaseResponse STATUS_500 = new BaseResponse(500, "服务器异常");
//	public static BaseResponse STATUS_600 = new BaseResponse(600, "SQL语句异常");
	public static BaseResponse STATUS_601 = new BaseResponse(601, "非法参数异常");
	public static BaseResponse STATUS_603 = new BaseResponse(603, "数据库连接异常");
	
	public static BaseResponse STATUS_200 = new BaseResponse(200, "成功");
	public static BaseResponse STATUS_400 = new BaseResponse(400, "失败");
	public static BaseResponse STATUS_600 = new BaseResponse(600, "该号码已被冻结");
	
	public BaseResponse(){
	}
	
	public BaseResponse(int status, Object content){
		this.status= status;
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Object getContent() {
		return content;
	}

	public void setContent(Object content) {
		this.content = content;
	}

	
}

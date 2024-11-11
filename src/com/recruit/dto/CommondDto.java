package com.recruit.dto;

import java.io.Serializable;

public class CommondDto implements Serializable {
	  private Integer commondId;

	    private String content;

	    private Integer userId;

	    private String createdate;

	    private Integer infoId;

    
    private String username;


	public Integer getCommondId() {
		return commondId;
	}


	public void setCommondId(Integer commondId) {
		this.commondId = commondId;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getCreatedate() {
		return createdate;
	}


	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}


	public Integer getInfoId() {
		return infoId;
	}


	public void setInfoId(Integer infoId) {
		this.infoId = infoId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}
    


}

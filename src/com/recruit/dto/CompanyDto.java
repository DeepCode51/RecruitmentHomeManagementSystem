package com.recruit.dto;

import java.io.Serializable;

public class CompanyDto  implements Serializable  {
	  private Integer comId;

	    private String fullname;

	    private String username;

	    private Integer userId;

	    private String comtype;

	    private String description;

	    private String empcount;

	    private String address;

	    private String email;

	    private String tel;

	    private String manager;

	    private String mTel;

	    private Integer id;


	    public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getPwd() {
			return pwd;
		}

		public void setPwd(String pwd) {
			this.pwd = pwd;
		}

		public String getQuestion() {
			return question;
		}

		public void setQuestion(String question) {
			this.question = question;
		}

		public String getAnswer() {
			return answer;
		}

		public void setAnswer(String answer) {
			this.answer = answer;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		private String pwd;

	    private String question;

	    private String answer;

	    private Integer status;

		public Integer getComId() {
			return comId;
		}

		public void setComId(Integer comId) {
			this.comId = comId;
		}

		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public Integer getUserId() {
			return userId;
		}

		public void setUserId(Integer userId) {
			this.userId = userId;
		}

		public String getComtype() {
			return comtype;
		}

		public void setComtype(String comtype) {
			this.comtype = comtype;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getEmpcount() {
			return empcount;
		}

		public void setEmpcount(String empcount) {
			this.empcount = empcount;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getTel() {
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
		}

		public String getManager() {
			return manager;
		}

		public void setManager(String manager) {
			this.manager = manager;
		}

		public String getmTel() {
			return mTel;
		}

		public void setmTel(String mTel) {
			this.mTel = mTel;
		}

    
    

}

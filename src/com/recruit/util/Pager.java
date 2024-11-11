package com.recruit.util;



import java.util.Arrays;

public class Pager {

	private String page = "1";// 前台查询第几页
	private String rows = "10";// 每页显示几条
	private String[] sort = new String[] {};
	private String[] order = new String[] {};
	private Object obj;  //查询结果
	private String length = "0";//满足条件的总数

	public Pager() {
		super();
	}

	public Pager(String page, String rows, String[] sort, String[] order,
			Object obj, String length) {
		super();
		this.page = page;
		this.rows = rows;
		this.sort = sort;
		this.order = order;
		this.obj = obj;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String[] getSort() {
		return sort;
	}

	public void setSort(String[] sort) {
		this.sort = sort;
	}

	public String[] getOrder() {
		return order;
	}

	public void setOrder(String[] order) {
		this.order = order;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	@Override
	public String toString() {
		return "Pager [page=" + page + ", rows=" + rows + ", sort="
				+ Arrays.toString(sort) + ", order=" + Arrays.toString(order)
				+ ", obj=" + obj + ", length=" + length + "]";
	}

}

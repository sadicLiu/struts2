package com.ace.bbs.action;

import java.util.List;

import com.ace.bbs.model.Category;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport
{
	@SuppressWarnings("unused")
	private List<Category> categories;

	@Override
	public String execute() throws Exception
	{
		return SUCCESS;
	}
	
	public String list()
	{
		return SUCCESS;
	}
	
	public String add() throws Exception
	{
		return "add_success";
	}

	public String delete() throws Exception
	{
		return "delete_success";
	}

	public String update() throws Exception
	{
		return "update_success";
	}

	public String query() throws Exception
	{
		return "query_success";
	}

}

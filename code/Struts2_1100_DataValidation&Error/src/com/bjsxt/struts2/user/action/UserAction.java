package com.bjsxt.struts2.user.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
	private String name;

	public String add()
	{
		if(null == name || !name.equals("admin"))
		{
			this.addFieldError("name", "name is error!");
			return ERROR;
		}
		
		return SUCCESS;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

}

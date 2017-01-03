package com.ace.bbs.model;

public class Category
{
	private int id;
	private String name;
	private String description;
	
	public String getDescription()
	{
		return description;
	}
	public int getId()
	{
		return id;
	}
	public String getName()
	{
		return name;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	
}

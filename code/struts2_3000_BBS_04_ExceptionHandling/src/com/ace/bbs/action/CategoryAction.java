package com.ace.bbs.action;

import java.sql.SQLException;
import java.util.List;

import com.ace.bbs.model.Category;
import com.ace.bbs.service.CategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport
{
	private List<Category> categories;
	private Category category;
	private CategoryService categoryService = new CategoryService();

	public String add() throws Exception
	{
		categoryService.add(category);
		return "add_success";
	}

	public String delete() throws Exception
	{
		categoryService.delete(category);
		return "delete_success";
	}

	
	public String list() throws SQLException
	{
		categories = categoryService.list();
		return SUCCESS;
	}

	public String update() throws Exception
	{
		categoryService.update(category);
		return "update_success";
	}
	
	public String updateInput() 
	{
		this.category = categoryService.loadById(category.getId());
		return "update_input";
	}
	
	public List<Category> getCategories()
	{
		return categories;
	}

	public Category getCategory()
	{
		return category;
	}

	public CategoryService getCategoryService()
	{
		return categoryService;
	}
	
	public void setCategories(List<Category> categories)
	{
		this.categories = categories;
	}

	public void setCategory(Category category)
	{
		this.category = category;
	}

	public void setCategoryService(CategoryService categoryService)
	{
		this.categoryService = categoryService;
	}

}

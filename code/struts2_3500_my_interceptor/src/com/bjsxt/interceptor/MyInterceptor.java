package com.bjsxt.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class MyInterceptor implements Interceptor
{
	public void destroy()
	{

	}

	public void init()
	{

	}

	public String intercept(ActionInvocation invocation) throws Exception
	{
		long start = System.currentTimeMillis();
		String r = invocation.invoke();
		long end = System.currentTimeMillis();
		System.out.println("action time = " + (end - start));
		return r;
	}

}

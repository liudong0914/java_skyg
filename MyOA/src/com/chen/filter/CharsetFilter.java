// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   CharsetFilter.java

package com.chen.filter;

import java.io.IOException;
import javax.servlet.*;
import org.apache.commons.lang.StringUtils;

public class CharsetFilter
	implements Filter
{

	private static final String characterEncodingType = "charsetEncodingType";
	private static final String defaultCharsetEncode = "GBK";
	private String charsetEncode;

	public CharsetFilter()
	{
		charsetEncode = null;
	}

	public void init(FilterConfig arg0)
		throws ServletException
	{
		charsetEncode = arg0.getInitParameter("charsetEncodingType");
		if (StringUtils.isEmpty(charsetEncode))
			charsetEncode = "GBK";
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
		throws IOException, ServletException
	{
		request.setCharacterEncoding(charsetEncode);
		filterChain.doFilter(request, response);
	}

	public void destroy()
	{
	}
}

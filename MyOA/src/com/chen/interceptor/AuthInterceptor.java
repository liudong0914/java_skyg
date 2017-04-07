package com.chen.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.chen.entity.Memu;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
/**
 * 
 * @author chen
 * 用于权限设置
 *
 */
public class AuthInterceptor implements Interceptor {
	public void init() {

	}
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String uri = request.getRequestURI();
		  //System.out.println("路径："+uri);
		uri = uri.substring(uri.indexOf("/") + 1);
		uri = uri.substring(uri.indexOf("/") + 1);
		String action = uri.substring(uri.indexOf("!") + 1, uri
				.lastIndexOf(".action"));
		Users loginUser = (Users) request.getSession()
				.getAttribute("loginUser");
		String mainAction=uri.substring(uri.indexOf("/")+1,uri.lastIndexOf("!"));
		if(!mainAction.equals("model")){
		if (loginUser != null) {
	      if(action.equals("out")){
		   invocation.invoke();
			}
			if(action.equals("login")){
				return "login";
			}
			Role role = loginUser.getRole();
		
			String[] newuriArr=uri.split("!");
			    String newStr=newuriArr[0];
			 
			Set funs = role.getMemus();
	
			List list = new ArrayList(funs);
			boolean t = false;
			String[] sArr=null;
			for (int i = 0; i < list.size(); i++) {
				Memu fun = (Memu) list.get(i);
				sArr=fun.getMemuUrl().split("!");
				
				if (newStr.equals(sArr[0])) {
					t = true;
					break;
				}
			}
			if (t){
				String res = invocation.invoke();
				return res;
			}
			else {
				return "err";
			}
		}
		
		if(action.equals("login")){
			return "login";
		}
		 else {
			 invocation.invoke();
		 	}
		}
		if(loginUser==null){
			
			 return "login";
		}
		else{
			invocation.invoke();
		}
		return "login";
	}
	public void destroy() {
	}
}

package com.books.management.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor  extends AbstractInterceptor {

        /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Override
        public String intercept(ActionInvocation invocation) throws Exception {
                Map<String, Object> session = invocation.getInvocationContext().getSession();

                String loginId = (String) session.get("empID");
                if (loginId == null) 
                {
                        return "sessionError";
                } 
                else 
                {
                        return invocation.invoke();
                }
        }
}

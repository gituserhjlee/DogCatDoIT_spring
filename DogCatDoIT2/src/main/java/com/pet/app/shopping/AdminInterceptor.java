package com.pet.app.shopping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.app.member.SessionInfo;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp=request.getContextPath();
		if (!info.getUserId().equals("admin")) {
			response.sendRedirect(cp+"/");
			return false;
		}
		return true;

	}

}

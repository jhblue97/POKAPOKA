package com.poka.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response,
			Authentication auth)
					throws IOException, ServletException {
		
		log.warn("로그인 성공");
		
		List<String> roleNms = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNms.add(authority.getAuthority());
		});	
		
		log.warn(roleNms);
		
		//ROLE_ADMIN이면 /sample/admin으로 리다이렉트
		if(roleNms.contains("ROLE_ADMIN")) {
			response.sendRedirect("/sample/admin");
			return;
		}
		//ROLE_MEMBER이면 /sample/member로 리다이렉트
		if(roleNms.contains("ROLE_MEMBER")) {
			response.sendRedirect("/sample/member");
			return;
		}
		//그 외는 /로 리다이렉트
		response.sendRedirect("/");
	}

}

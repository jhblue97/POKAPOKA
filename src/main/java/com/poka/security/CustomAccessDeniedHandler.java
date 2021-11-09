package com.poka.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request,
			HttpServletResponse response,
			AccessDeniedException accessDeniedException)
					throws IOException, ServletException {

		log.error("CustomAccessDeniedHandler");
		log.error("redirect......");
		//URL로 접근 제한 시 보이는 화면 처리
		response.sendRedirect("/user/accessError");
	}

}

package com.poka.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.poka.domain.MemberVO;
import com.poka.mapper.MemberMapper;
import com.poka.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("loadUserByUsername : " + username);
		
		MemberVO vo = memberMapper.read(username);
		
		return vo == null ? null : new CustomUser(vo);
	}

}

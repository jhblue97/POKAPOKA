package com.poka.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.poka.domain.UserVO;
import com.poka.mapper.UserMapper;
import com.poka.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		log.warn("loadUserByUsername : " + userid);
		
		UserVO vo = userMapper.read(userid);
		
		return vo == null ? null : new CustomUser(vo);
	}

}

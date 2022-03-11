package com.okpos.asp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.okpos.asp.domain.memberMng.PosmemberDTO;
import com.okpos.asp.service.MemberMngService;

//UserDetailsService
//컨테이너에 등록한다.
//시큐리티 설정에서 loginProcessingUrl(url) 로 걸어 놓았기 때문에
//위 url 로 요청이 오면 자동으로 UserDetailsService 타입으로 IoC 되어 있는
//loadUserByUsername() 가 실행된다.
@Service
public class PrincipalDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMngService memService;
	
	// UserDetails 를 리턴한다 --> 누구한테 리턴하나?
	// 시큐리티 sesssion (<= Authentication(<= 리턴된 UserDetails))
	@Override
	public UserDetails loadUserByUsername(String memId) throws UsernameNotFoundException {
		PosmemberDTO user = memService.findId(memId); // spring security의 username은 id를 뜻함
		
		if(user == null) {
			// InternalAuthenticationServiceException : 없는 아이디로 로그인하면 나타나는 오류
			return null;
		}
		PrincipalDetails userDetails = new PrincipalDetails(user); // PrincipalDetails 클래스에 PosmemberDTO 객체 초기화
		userDetails.setMemService(memService); // PrincipalDetails 클래스에 MemberMngService 객체 초기화
		return userDetails;
	}

}

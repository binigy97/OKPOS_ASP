package com.okpos.asp.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.okpos.asp.domain.memberMng.PosmemberDTO;
import com.okpos.asp.service.MemberMngService;

//아래의 과정을 거쳐, Spring Security가 DB의 정보를 가지고 로그인할 수 있음
//• User 데이터를 저장할 User Entity를 생성합니다.
//• User를 Database에 저장합니다.
//• 생성한 User Entity를 Spring Security의 내장 class와 연결합니다. 이때 UserDetails와 UserDetailsService Interface를 사용합니다.
//• Security Configuartion에 Database Auth를 정의합니다.
//[출처 : https://minholee93.tistory.com/entry/Spring-Security-Database-Authentication-Spring-Boot-6]

//시큐리티가 /loginOk 주소요청이 오면 낚아채서 로그인을 진행시킴
//로그인 진행이 완료되면 '시큐리티 session' 에 넣어주게 된다. 
//우리가 익히 알고 있는 같은 session 공간이긴 한데..
//시큐리티가 자신이 사용하기 위한 공간을 가집니다. 
//=> Security ContextHolder 라는 키값에다가 session 정보를 저장합니다.
//여기에 들어갈수 있는 객체는 Authentication 객체이어야 한다.
//Authentication 안에 User 정보가 있어야 됨. 
//User 정보 객체는 ==> UserDetails 타입 객체이어야 한다.

//따라서 로그인한 User 정보를 꺼내려면
//Security Session 에서 
// => Authentication 객체를 꺼내고, 그 안에서
//      => UserDetails 정보를 꺼내면 된다.
public class PrincipalDetails implements UserDetails {
	// User Entity
	private PosmemberDTO user;
	private MemberMngService memService;
	
	public PrincipalDetails(PosmemberDTO user) {
		// 여기서 UserDetails 타입의 User 객체 생성
		this.user = user;
	}

	public void setMemService(MemberMngService memService) {
		this.memService = memService;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// 이 메서드를 통해 Authentication 객체에서 UserDetails(DB에 저장된 user 정보) 꺼냄
		// 해당 메서드에서 꺼내려는 User 객체 : 특정 계정에 대한 권한(들)
		Collection<GrantedAuthority> collect = new ArrayList<>();
		String auth = memService.selectAuthById(user.getMemId()); // 계정이 여러 개면 List<String> 형 사용
		collect.add(new GrantedAuthority() {

			@Override
			public String getAuthority() {
				return auth;
			}
			
		});
		return null;
	}

	@Override
	public String getPassword() {
		return user.getMemPw();
	}

	@Override
	public String getUsername() {
		return user.getMemId();
	}

	// 계정이 만료된건 아닌지?
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	// 계정이 잠긴건 아닌지?
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	// 계정 credential 이 만료된건 아닌지?
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	// 계정이 활성화 되었는지?
	@Override
	public boolean isEnabled() {
		return true;
		// ex)
		// 사이트에서 1년동안 회원이 로그인을 안하면 휴면계정으로 하기로 했다면?
		// 현재시간 - 로그인시간 => 1년을 초과하면 false  
	}

}

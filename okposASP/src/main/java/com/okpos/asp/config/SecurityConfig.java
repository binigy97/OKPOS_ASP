package com.okpos.asp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

//스프링 시큐리티 설정
@Configuration // 일단 컨테이너에 생성되어야 한다.
@EnableWebSecurity // Web Security 활성화 (스프링 시큐리티 필터가 스프링 필터 체인에 등록)
				   // ↓ 등록할 필터 객체
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	// There is no PasswordEncoder mapped for the id "null" 오류
	// -> spring security 5부터는 PasswordEncoder이 변경되어 password 앞에 식별자 정보를 넣어야 됨
	// -> 즉, DB에 pw를 insert할 때 {noop}패스워드 형식으로 생성해주면 됨
	
	// bcrypt 형식으로 password를 encoding하는 함수 (비밀번호를 암호화할 때 이용)
	// PasswordEncoder 를 bean 으로 IoC 에 등록
//	@Bean
//	public BCryptPasswordEncoder encoder() {
//		return new BCryptPasswordEncoder();
//	}
	
	@Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }
	
	@Override
 	protected void configure(HttpSecurity http) throws Exception {
		// CSRF 비활성화
		http.csrf().disable();
		
		// 인증에 대한 세팅
 		http.authorizeRequests()
 			.antMatchers("/login").permitAll()
 			// ↓ '인증'뿐 아니라 ROLE_MANAGER 나 ROLE_USER 권한 갖고 있어야함('인가')
 			.antMatchers("/user/**").access("hasRole('ROLE_MANAGER') or hasRole('ROLE_USER')")
 			.antMatchers("/mng/**").access("hasRole('ROLE_MANAGER')")
 			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
 			.anyRequest().authenticated()
 			;
 		
 		// 로그인/로그아웃 세팅
 		http
	 		// ↓ /logout 경로로 요청(로그아웃)이 들어올 경우
 			.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
 			// ↓ /login 로 리다이렉트하고 세션 초기화 및 쿠키 삭제
 			.logoutSuccessUrl("/login").invalidateHttpSession(true).deleteCookies("JSESSIONID")
 			
 			// ↓ /login 경로로 username=memId, password=memPw 파라미터를 통해 요청(로그인)이 들어올 경우
 			// view 단에서 input의 name값이 username, password이면 시큐리티 디폴트 사용 가능 (뒤에 2개 함수 생략 가능)
 			.and().formLogin().loginPage("/login").usernameParameter("memId").passwordParameter("memPw")
 			// ↓ /loginOk 로 들어오는 request 를 시큐리티가 낚아채서 처리, 대신 로그인을 진행
 			// 이와 같이 하면 Controller 에서 /loginOk 를 만들지 않아도 됨 (단, view 단의 form의 action="/loginOk" 세팅필수) 
 			.loginProcessingUrl("/loginOk")
 			// ↓ 로그인 성공시 처리로직
 			.successHandler(new LoginSuccessHandler())
 			;
 	}
}

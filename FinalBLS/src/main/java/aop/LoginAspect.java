package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component
@Aspect
public class LoginAspect {
	@Around("execution(* controller.User*.*(..)) && args(id, session,..)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint, String id, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 거래 하세요.","../user/loginForm.shop");
		}
		//2.admin가 아니고, id와 로그인 정보가 다른 경우
		if(!id.equals(loginUser.getUserId()) && !loginUser.getUserId().equals("admin")) {
			throw new LoginException("본인만 거래 가능합니다.","../user/mypage.shop?id="+loginUser.getUserId());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around("execution(* controller.User*.*(..)) && args(user,session,..)")
	public Object userUpdateCheck(ProceedingJoinPoint joinPoint, User user, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("로그인 후 수정 하세요.","../user/loginForm.shop");
		}
		if(!user.getUserId().equals(loginUser.getUserId()) && !loginUser.getUserId().equals("admin")) {
			throw new LoginException("본인만 수정이 가능합니다.","../user/mypage.shop?id="+loginUser.getUserId());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}

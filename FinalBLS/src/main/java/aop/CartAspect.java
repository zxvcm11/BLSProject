package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.CartEmptyException;
import exception.LoginException;
import logic.Cart;
import logic.User;

@Component	
@Aspect		
public class CartAspect {

	@Around("execution(* controller.Cart*.check*(..))")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];	
		
		Cart cart = (Cart)session.getAttribute("CART");
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			throw new LoginException("로그인 후 거래하세요","../user/loginForm.shop");
		}
		if(cart == null || cart.isEmpty()) {
			throw new CartEmptyException("장바구니가 비었습니다.", "../item/list.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
		
	}
}

package controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.CartEmptyException;
import logic.ItemSet;
import logic.Sale;
import logic.Cart;
import logic.Item;
import logic.ShopService;
import logic.User;

@Controller
public class CartController {
	
	@Autowired
	ShopService service;
	
	@RequestMapping("cart/cartAdd")
	public ModelAndView add(String id, Integer quantity, HttpSession session) {
		//selectItem : ID값에서 Item객체를 db에 읽어서
		Item selectItem = service.getItem(id);
		Cart cart = (Cart)session.getAttribute("CART");	
		if(cart== null) {								//등록된 장바구니 상품이 없다.
			cart = new Cart();
			session.setAttribute("CART", cart);			//empty Cart 객체를 session 저장
		}
		cart.push(new ItemSet(selectItem, quantity));
		System.out.println();
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message", selectItem.getName() +"을/를" + quantity +"개를 장바구니에 추가");
		mav.addObject("cart", cart);
		return mav;
	}
	
	@RequestMapping("cart/cartDelete")
	public ModelAndView delete(Integer index, HttpSession session) {
		Cart cart = (Cart)session.getAttribute("CART");
		ModelAndView mav =new ModelAndView("cart/cart");
		int ind = index;
		ItemSet delete= null;
		try {
			delete = cart.getItemSetList().remove(ind);
			mav.addObject("message",delete.getItem().getName()+"상품을 제거함");
		} catch (Exception e) {
			mav.addObject("message","상품을 장바구니에서 제거 실패");
		}
		mav.addObject("cart",cart);
		return mav;
	}
	@RequestMapping("cart/cartView")
	public ModelAndView view(HttpSession session) {
		Cart cart = (Cart)session.getAttribute("CART");
		if(cart == null || cart.isEmpty() ) {//예외 등록 부분 기억해두자
			throw new CartEmptyException("장바구니에 상품이 없습니다.","../item/list.shop");
		}
		ModelAndView mav = new ModelAndView("cart/cart");
		mav.addObject("message1","※ 장바구니 입니다.  ※");
		mav.addObject("cart",cart);
		return mav;
		
	}
	
	@RequestMapping("cart/checkout")
	public String checkout(HttpSession session) {		//CartAspect Aop 대상이 되는 핵심 메서드
		return"cart/checkout";//이거 발동 전에 , aop패키지에 cartAspect가 실행이 됨.
	}
	
	//주문 확정
	//1. 주문테이블에 저장.
	//2. 장바구니의 상품을 제거하기 
	@RequestMapping("cart/end")
	public ModelAndView checkend(HttpSession session) {		//CartAspect Aop 대상이 되는 핵심 메서드
		ModelAndView mav = new ModelAndView();
		Cart cart = (Cart)session.getAttribute("CART");
		User loginUser = (User)session.getAttribute("loginUser");
//		sale : 구매고객정보, 구매상품정보 등을 저장한 객체.
		Sale sale = service.checkEnd(loginUser,cart);	//1.//주문 상품을 db에 저장하기
		int tot = cart.getTotalAmount();	
		cart.clearAll(session);
		mav.addObject("sale",sale);
		mav.addObject("totalAmount", tot);
		return mav;
	}

}

package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.ShopService;
import logic.User;
import util.CipherUtil;


@Controller
public class UserController {
	@Autowired
	ShopService service;

	@RequestMapping("user/userreg")
	public ModelAndView userreg() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new User());
		return mav;
	}
	
	@RequestMapping("user/userEntry")
	public ModelAndView entry(@Valid User user, BindingResult br) {
		ModelAndView mav = new ModelAndView("user/userreg");
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user", user);
		} catch (Exception e) {
			br.reject("error.duplicate.user");
		}
		return mav;
	}
	
	@RequestMapping("user/mypage")
	  public ModelAndView mypage(String id,HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		  User user = (User)session.getAttribute("loginUser");  
		  List<Sale> saleList = service.getSaleList(id);	  
		  for(Sale s : saleList) {

			  List<SaleItem> saleItemList = service.getSaleItemList(s.getSaleId());
			  s.setItemList(saleItemList);
			  for(SaleItem si : saleItemList) {
				  Item item=service.getItem(""+si.getItemId());
				  si.setItem(item);
			  }
		  }	  
		  mav.addObject("salelist",saleList);
		  user.setEmail(CipherUtil.decrypt(user.getEmail(), user.getUserId()));
		  mav.addObject("user",user);
		return mav;  
	  }
	
	@RequestMapping(value="user/login", method=RequestMethod.GET)
    public ModelAndView login() {
	    ModelAndView mav = new ModelAndView();
	    mav.addObject(new User());
		return mav; 
	}
	
	@RequestMapping(value="user/login", method=RequestMethod.POST)
     public ModelAndView login(@Valid User user, BindingResult br, HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      if (br.hasErrors()) {
	         mav.getModel().putAll(br.getModel());
	         System.out.println("hasErrors : "+br.getModel());
	         return mav;
	      }
	      try {
	         User dbuser = service.selectUser(user.getUserId());
	         if(dbuser == null) {
	            br.reject("error.login.id");
	            mav.getModel().putAll(br.getModel());
	            return mav;
	         }
	         if(user.getPassword().equals(dbuser.getPassword())) {
	            session.setAttribute("loginUser", dbuser);
	         } else {
	            br.reject("error.login.password");
	            mav.getModel().putAll(br.getModel());
	            return mav;
	         }
	      } catch (Exception e) {
	    	  e.printStackTrace();
	         br.reject("error.user.login");
	         mav.getModel().putAll(br.getModel());
	         return mav;
	      }
	      mav.setViewName("user/loginSuccess");
	      return mav;
	   }
	
	@RequestMapping("user/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:login.shop");
		return mav;	
	}
	
}
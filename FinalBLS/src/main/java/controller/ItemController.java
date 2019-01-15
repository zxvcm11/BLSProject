package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;			//Bean
import logic.ShopService;	//Service

/*
 *	컨트롤러 라고 선언 , 
 *	@Component의 하위 클래스. = 객체화를 시킨다는 의미
 *	@Component + Controller  
 */
//MVC에서 C역할
@Controller	// 서비스(ShopService) 와 뷰(jsp) 의 중재자 역할
public class ItemController {
	
	@Autowired
	private ShopService service;//@Service인 ShopService가 주입이 되어있음.
	
	@RequestMapping("item/list")
	public ModelAndView list(HttpServletRequest request) {
		//itemList : Item테이블의 모든 레코드를 저장하고 있는 List객체
		ModelAndView mav = new ModelAndView();	//view 등록 안함 : "item/list"가 기본 view
		List<Item> itemList = service.getItemList();
		int maxnum = service.getMaxnum();
		String teamtype =request.getParameter("type");
		mav.addObject("teamtype",teamtype);
		
		// /WEB/view/item/list.jsp
		if(request.getParameter("type")!=null) {
			itemList = service.getItemList_type(teamtype);
			mav.addObject("maxnum", maxnum);
			mav.addObject("itemList",itemList);
			return mav;
		}
		else {
		mav.addObject("itemList",itemList);	//ModelAndView 객체에 객체를 더한다는 의미
		return mav;
		}
	}
	
	@RequestMapping("item/*")
	public ModelAndView detail(String id) {//파라미터를 가져왔음 ., 어떻게 가져 왔지??? 그냥 스프링 기능임
//		 파라미터를 다른 것으로 써도 에러도 나지 않음
//		 id 파라미터를  가져옴 .
//		()안에 여러가지 자신이 원하는대로 객체를 넣어줄 수 있음. request, 클래스, 매개변수... 
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(id);	//item은 ItemDao의 return 값으로 ... mapper로 나오게 됨.
		mav.addObject("item",item);
		
		return mav;
	}
	
	
	@RequestMapping("item/create")
	public ModelAndView create() {
		ModelAndView mav= new ModelAndView();
		mav = new ModelAndView("item/add");
		mav.addObject(new Item());
		return mav;
	}
	
	@RequestMapping("item/register")
	public ModelAndView register
			(@Valid Item item,BindingResult br, HttpServletRequest request) {
		//@Valid : 유효성 검증. Item 클래스에 정의된 내용으로 검증을 함.
		//item 객체 : 파라미터 정보와 업로드된 파일내용을 저장
		ModelAndView mav= new ModelAndView();
		mav = new ModelAndView("item/add");
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		service.itemCreate(item,request);
		mav.setViewName("redirect:/item/list.shop");
		
		return mav;
	}
	
	
	@RequestMapping("item/update")
	public ModelAndView update
		(@Valid Item item, BindingResult br, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/edit");
			if(br.hasErrors()) {
				mav.getModel().putAll(br.getModel());
				return mav;
			}
			service.itemUpdate(item,request);
			mav.setViewName("redirect:/item/list.shop");
			return mav;
	}
	
	@RequestMapping("item/delete")
	public ModelAndView delete(String id) {
		ModelAndView mav= new ModelAndView();
		service.delete(id);
		mav.setViewName("redirect:/item/list.shop");
		return mav;
	}
	
	@RequestMapping("item/purchase")
	public ModelAndView purchase(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String quantity= request.getParameter("quantity");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		mav.addObject("quantity", quantity);
		mav.addObject("name", name);
		mav.addObject("price", price);
		mav.setViewName("item/purchase");
		return mav;
	}
	
	
}

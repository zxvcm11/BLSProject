package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import websocket.SocketIO;

@Controller
public class ChatContoller {
	@RequestMapping("chat/chat")
	public String chat() {
		return null; //return "chat/chat"; //view 이름 설정 // null인 경우에는 @RequestMapping의 url로 설정됨.
		//Map<String, String> teamCode=(Map<String, String>)session.getAttribute("teamCode");
	}
	@RequestMapping("chat/test1")
	public ModelAndView test1() {
		ModelAndView mav = new ModelAndView("chat/t1");
		return mav;
	}
	@RequestMapping("chat/test2")
	public ModelAndView test2() {
		ModelAndView mav = new ModelAndView("chat/t2");
		return mav;
	}
}

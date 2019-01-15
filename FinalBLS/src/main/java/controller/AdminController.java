package controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import logic.ShopService;
import logic.User;
import util.CipherUtil;

@Controller
public class AdminController {
		@Autowired
		private ShopService service;
		@RequestMapping("admin/list")
		public ModelAndView list(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			List<User> userlist = service.userList();
			for(User u : userlist) {
				u.setEmail(CipherUtil.decrypt(u.getEmail(), u.getUserId()));
			}
			mav.addObject("userlist",userlist);
			return mav;
		}
		
}
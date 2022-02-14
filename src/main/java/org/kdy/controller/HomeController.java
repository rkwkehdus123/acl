package org.kdy.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET) //Mapping : server와 파일을 연결시켜준다
	public String home(Locale locale, Model model) {
		// logger.info == System.out.println()
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		System.out.println(date);
		// 날짜 형식을 정해주는 데이터포멧 클래스
		// ex) 2022-01-05 or 2022/01/05 or 2022년 01월 05월
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		//데이터 참조변수와 데이터포멧 참조변수를 결합
		
		String formattedDate = dateFormat.format(date);
		System.out.println(formattedDate);
		
		// request.setAttribute()와 동일
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public void index() {
		
	}
	
}

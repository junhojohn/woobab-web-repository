package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestKakaoMapAPIController {
	
	private Log log = LogFactory.getLog(TestKakaoMapAPIController.class);
	
	public TestKakaoMapAPIController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="testKakaoMap.test", method=RequestMethod.GET)
	public ModelAndView testKakaoMap() {
		log.info(getClass().getName() + ".testKakaoMap() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testViews/testKakaoMap.jsp");
		log.info(getClass().getName() + ".testKakaoMap() ended.");
		return modelAndView;
	}
}

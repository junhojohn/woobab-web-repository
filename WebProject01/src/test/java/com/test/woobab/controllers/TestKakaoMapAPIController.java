package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestKakaoMapAPIController {
	
	private Log log = LogFactory.getLog(TestKakaoMapAPIController.class);
	
	public TestKakaoMapAPIController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="testMain.test", method=RequestMethod.GET)
	public ModelAndView testMain() {
		log.info(getClass().getName() + ".testKakaoMap() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testViews/testMain.jsp");
		log.info(getClass().getName() + ".testKakaoMap() ended.");
		return modelAndView;
	}
	
	@RequestMapping(value="testKakaoMap.test", method=RequestMethod.POST)
	public ModelAndView testKakaoMap(@RequestParam(value="location_search_keyword", required=true) String locationSearchKeyword) {
		log.info(getClass().getName() + ".testKakaoMap() started.");
		log.info("[PARAM01] location_search_keyword:" + locationSearchKeyword);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testViews/testKakaoMap.jsp");
		modelAndView.addObject("location_search_keyword", locationSearchKeyword);
		log.info(getClass().getName() + ".testKakaoMap() ended.");
		return modelAndView;
	}
}

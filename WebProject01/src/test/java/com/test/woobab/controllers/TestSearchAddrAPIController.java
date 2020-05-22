package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestSearchAddrAPIController {

	private Log log = LogFactory.getLog(TestSearchAddrAPIController.class);
	
	public TestSearchAddrAPIController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="/testSearchAddr.test", method=RequestMethod.GET)
	public ModelAndView testSearchAddr() {
		log.info(getClass().getName() + ".testSearchAddr() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testViews/testSearchAddr.jsp");
		log.info(getClass().getName() + ".testSearchAddr() ended.");
		return modelAndView;
	}
	
}

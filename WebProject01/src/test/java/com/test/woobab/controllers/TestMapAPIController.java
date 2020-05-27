package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.woobab.consts.Const;
import com.woobab.consts.TEST_REQ_ACTION_ENUM;

@Controller
public class TestMapAPIController {
	
	private Log log = LogFactory.getLog(TestKakaoMapAPIController.class);
	
	public TestMapAPIController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="/testMap.test", method=RequestMethod.POST)
	public ModelAndView testMap(@RequestParam(value=Const.LOC_SEARCH_KEYWORD, required=true) String locationSearchKeyword) {
		log.info(getClass().getName() + ".testMap() started.");
		log.info("[PARAM01] location_search_keyword:" + locationSearchKeyword);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_MAP.getJspPathURI());
		modelAndView.addObject("location_search_keyword", locationSearchKeyword);
		log.info(getClass().getName() + ".testMap() ended.");
		return modelAndView;
	}
}

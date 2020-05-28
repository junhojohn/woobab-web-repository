package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.woobab.consts.TEST_REQ_ACTION_ENUM;

@Controller
public class TestGeoLocationController {
	
	private Log log = LogFactory.getLog(TestGeoLocationController.class);
	
	public TestGeoLocationController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="/testGeoLocation.test", method=RequestMethod.GET)
	public ModelAndView testGeoLocation() {
		log.info(getClass().getName() + ".testGeoLocation() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_GEO_LOC.getJspPathURI());
		log.info(getClass().getName() + ".testGeoLocation() ended.");
		return modelAndView;
	}
	
	@RequestMapping(value="/testMapGeoLocation.test", method=RequestMethod.GET)
	public ModelAndView testMapGeoLocation() {
		log.info(getClass().getName() + ".testMapGeoLocation() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_MAP_GEO_LOC.getJspPathURI());
		log.info(getClass().getName() + ".testMapGeoLocation() ended.");
		return modelAndView;
	}
}

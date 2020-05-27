package com.test.woobab.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.woobab.consts.TEST_REQ_ACTION_ENUM;

@Controller
public class TestUIController {
	
	private Log log = LogFactory.getLog(TestUIController.class);
	
	public TestUIController() {
		log.info(getClass().getName() + "() called.");
	}
	
	@RequestMapping(value="/testBootstrap.test", method=RequestMethod.GET)
	public ModelAndView testBootstrap() {
		log.info(getClass().getName() + ".testBootstrap() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_BOOTSTRAP.getJspPathURI());
		log.info(getClass().getName() + ".testBootstrap() ended.");
		return modelAndView;
	}

	@RequestMapping(value="/testMain02.test", method=RequestMethod.GET)
	public ModelAndView testMain02() {
		log.info(getClass().getName() + ".testMain02() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_MAIN02.getJspPathURI());
		log.info(getClass().getName() + ".testMain02() ended.");
		return modelAndView;
	}
	
	@RequestMapping(value="/testMain03.test", method=RequestMethod.GET)
	public ModelAndView testMain03() {
		log.info(getClass().getName() + ".testMain03() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_MAIN03.getJspPathURI());
		log.info(getClass().getName() + ".testMain03() ended.");
		return modelAndView;
	}
	
	@RequestMapping(value="/testMain04.test", method=RequestMethod.GET)
	public ModelAndView testMain04() {
		log.info(getClass().getName() + ".testMain04() started.");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(TEST_REQ_ACTION_ENUM.REQ_TEST_MAIN04.getJspPathURI());
		log.info(getClass().getName() + ".testMain04() ended.");
		return modelAndView;
	}

}

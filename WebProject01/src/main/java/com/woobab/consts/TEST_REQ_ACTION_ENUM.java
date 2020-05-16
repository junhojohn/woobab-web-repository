package com.woobab.consts;

public enum TEST_REQ_ACTION_ENUM {

	REQ_TEST_MAIN("testMain", 			"testViews/testMain.jsp", 		"/testMain.test"),
	REQ_TEST_KAKAO_MAP("testKakaoMap", 	"testViews/testKakaoMap.jsp", 	"/testKakaoMap.test"),
	REQ_TEST_BOOTSTRAP("testBootstrap",	"testViews/testBootstrap.jsp", 	"/testBootstrap.test"),
	REQ_TEST_OVERLAY("testOverlay",		"testViews/testOverlay.jsp", 	"/testOverlay.test");
	
	private String requestActionKey;
	private String jspPathURI;
	private String requestURI;
	
	private TEST_REQ_ACTION_ENUM(String requestActionKey, String jspPathURI, String requestURI) {
		this.requestActionKey 	= requestActionKey;
		this.jspPathURI 		= jspPathURI;
		this.requestURI 		= requestURI;
	}
	
	public static String getRequestActionKeyByJSPPathURI(String jspPathURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getJspPathURI().equals(jspPathURI)) {
				return actionKind.getRequestActionKey();
			}
		}
		return null;
	}
	
	public static String getRequestActionKeyByRequestURI(String requestURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestURI().equals(requestURI)) {
				return actionKind.getRequestActionKey();
			}
		}
		return null;
	}
	
	public static String getJSPPathByRequestActionKey(String requestActionKey) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestActionKey().equals(requestActionKey)) {
				return actionKind.getJspPathURI();
			}
		}
		return null;
	}
	
	public static String getJSPPathByRequestURI(String requestURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestURI().equals(requestURI)) {
				return actionKind.getJspPathURI();
			}
		}
		return null;
	}
	
	public static String getRequestURIByRequestActionKey(String requestActionKey) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestActionKey().equals(requestActionKey)) {
				return actionKind.getRequestURI();
			}
		}
		return null;
	}
	
	public static String getRequestURIByJSPPathURI(String jspPathURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getJspPathURI().equals(jspPathURI)) {
				return actionKind.getRequestURI();
			}
		}
		return null;
	}
	
	public static TEST_REQ_ACTION_ENUM getKindByRequestActionKey(String requestActionKey) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestActionKey().equals(requestActionKey)) {
				return actionKind;
			}
		}
		return null;		
	}
	
	public static TEST_REQ_ACTION_ENUM getKindByJSPPathURI(String jspPathURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getJspPathURI().equals(jspPathURI)) {
				return actionKind;
			}
		}
		return null;		
	}
	
	public static TEST_REQ_ACTION_ENUM getKindByRequestURI(String requestURI) {
		for(TEST_REQ_ACTION_ENUM actionKind : TEST_REQ_ACTION_ENUM.values()) {
			if(actionKind.getRequestURI().equals(requestURI)) {
				return actionKind;
			}
		}
		return null;		
	}
	
	
	public String getRequestActionKey() {
		return requestActionKey;
	}

	public String getJspPathURI() {
		return jspPathURI;
	}

	public String getRequestURI() {
		return requestURI;
	}	
}

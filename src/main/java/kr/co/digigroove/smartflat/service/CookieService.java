package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.common.CookieEntity;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CookieService {

	/**
	 * 쿠키 세팅 [공통]
	 * @param cookie
	 * @return
	 * @throws Exception
	 */
	Cookie settingCookie(CookieEntity cookie) throws Exception;

	/**
	 * 아이디 기억하기(저장)
	 * @param req
	 * @param res
	 * @param cookie
	 * @throws Exception
	 */
	void setKeepIdCookie(HttpServletRequest req, HttpServletResponse res, CookieEntity cookie) throws Exception;

	/**
	 * 아이디 기억하기(조회)
	 * @param req
	 * @param cookieName
	 * @return
	 * @throws Exception
	 */
	String getKeepIdCookie(HttpServletRequest req, String cookieName) throws Exception;

}

package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.smartflat.entities.common.CookieEntity;
import kr.co.digigroove.smartflat.service.CookieService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;

import static kr.co.digigroove.smartflat.constant.Default.Cookie.*;

/**
 * Created by changjo on 15. 11. 24.
 */
@Service("CookieService")
public class CookieServiceImpl implements CookieService {

	private static final String COMMA = ",";
	private static final String SLASH = "/";

	/**
	 * 쿠키 세팅 [공통]
	 * @param cookie
	 * @return
	 */
	@Override
	public Cookie settingCookie(CookieEntity cookie) throws Exception {
		Cookie newCookie = new Cookie(cookie.getName(), cookie.getValue());
		newCookie.setMaxAge(cookie.getTime());
		newCookie.setPath(SLASH);
		return newCookie;
	}

	/**
	 * 아이디 기억하기(저장)
	 * @param req
	 * @param res
	 * @param cookie
	 */
	@Override
	public void setKeepIdCookie(HttpServletRequest req, HttpServletResponse res, CookieEntity cookie) throws Exception {
		boolean isExistCookie = false;
		Cookie nowCookies[] = req.getCookies();
		if (nowCookies != null) {
			for (Cookie nowCookie : nowCookies) {
				boolean isExistCookieName = nowCookie.getName().equals(cookie.getName());
				boolean isExistCookieValue = nowCookie.getValue().equals(cookie.getValue());
				if (isExistCookieName && isExistCookieValue) isExistCookie = true;
			}
		}
		cookie.setTime(LIFE_TIME_YEAR);
		if (!isExistCookie) res.addCookie(this.settingCookie(cookie));
	}

	/**
	 * 아이디 기억하기(조회)
	 * @param req
	 * @param cookieName
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getKeepIdCookie(HttpServletRequest req, String cookieName) throws Exception {
		String keepIdValue = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) keepIdValue = cookie.getValue();
			}
		}
		return keepIdValue;
	}

	/**
	 * 퀵메뉴 - 쿠키 누적
	 * >> value를 배열 앞으로 누적, 유효기간은 오늘밤 12시.
	 * @param cookies
	 * @param cookieName
	 * @param addValue
	 * @return
	 */
	private Cookie updateQuickViewCookie(Cookie[] cookies, String cookieName, String addValue) throws Exception {
		String cookieValue = addValue;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName) && StringUtils.isNotEmpty(cookie.getValue())) {
					cookieValue = addValue + COMMA + cookie.getValue();
				}
			}
		}
		CookieEntity cookie = new CookieEntity();
		cookie.setName(cookieName);
		cookie.setValue(cookieValue);
		cookie.setTime(this.cookieTimeForTonight());
		return this.settingCookie(cookie);
	}

	/**
	 * 남은 시간 조회 (오늘밤 12시)
	 * @return
	 */
	private int cookieTimeForTonight() {
		int hour = Calendar.HOUR_OF_DAY * TIME_UNIT * TIME_UNIT;
		int minute = Calendar.MINUTE * TIME_UNIT;
		int second = Calendar.SECOND;
		return LIFE_TIME_DATE - hour + minute + second;
	}
}

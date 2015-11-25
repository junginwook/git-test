package kr.co.digigroove.smartflat.interceptor;

import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static kr.co.digigroove.smartflat.constant.Default.*;

/**
 * 인증정보를 체크한다.
 */
public class AuthenticationCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;

	private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationCheckInterceptor.class);
	private static final String ADMIN = "admin";
	private static final String MANAGER = "manager";
	private static final String REQ_HEADER2 = "Ajax";
	private static final String REQ_HEADER1 = "XMLHttpRequest";
	private static final String AJAX_HEADER = "x-requested-with";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String loginNm    = Session.USER;
		String isAdmin    = String.valueOf(ZERO);
		String ajaxHeader = request.getHeader(AJAX_HEADER);

		if (request.getRequestURI().contains(ADMIN)) {
			loginNm = Session.ADMIN;
			isAdmin = String.valueOf(ONE);
		}

		UserEntity loginInfo = (UserEntity) request.getSession().getAttribute(loginNm);
		if (loginInfo == null) {
			boolean isAjax = REQ_HEADER1.equalsIgnoreCase(ajaxHeader) || REQ_HEADER2.equalsIgnoreCase(ajaxHeader);
			if (isAjax) response.sendRedirect(request.getContextPath() + "/common/errorAjax?code=error.need.login");
			else        response.sendRedirect(request.getContextPath() + "/common/error?code=error.need.login&redirect=login&isAdmin=" + isAdmin);
			return false;
		}
		else {
			UserEntity currentInfo = userService.retrieveUserEntity(loginInfo);
			final boolean isNotFoundInfo     = currentInfo == null;
			if (isNotFoundInfo) {
				request.getSession().removeAttribute(loginNm);
				response.sendRedirect(request.getContextPath() + "/common/error?code=error.account.changed&redirect=login&isAdmin=" + isAdmin);
				return false;
			}
		}
		LOGGER.info("Interceptor Check : Authentication Info");
		return true;
	}
}
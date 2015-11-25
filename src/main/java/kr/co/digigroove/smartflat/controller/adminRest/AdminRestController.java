package kr.co.digigroove.smartflat.controller.adminRest;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.entities.UserResultEntity;
import kr.co.digigroove.smartflat.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.InvalidParameterException;
import java.util.InputMismatchException;

/**
 * Created by changjo on 15. 11. 24.
 */
@RestController
public class AdminRestController {

	@Autowired
	private UserService userService;

	@Autowired
	private Messages messages;

	private static final Logger LOGGER = LoggerFactory.getLogger(AdminRestController.class);

	public static final String EMPTY_RESULT = "EmptyResult";
	public static final String PASSWORD_MISMATCHED = "PasswordMismatched";

	/**
	 * 본사관리자 로그인
	 * @param userCommon
	 * @param session
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping(value="/loginRest/loginSubmit")
	public UserResultEntity loginSubmitForWeb(UserEntity userCommon, HttpSession session,
	                                          HttpServletRequest req, HttpServletResponse res) {
		UserResultEntity result = new UserResultEntity();
		try {
			UserEntity userEntity = userService.loginUserCheck(userCommon);
			String loginName;
			loginName = Default.Session.ADMIN;
			result.setUrl("/admin/require/requireList");
//			if (userEntity.getGrade() == Default.Grade.ADMIN) {
//				loginName = Default.Session.ADMIN;
//				result.setUrl("/admin/userManagement/userList");
//			}else if(userEntity.getGrade() == Default.Grade.MANAGER){
//				loginName = Default.Session.ADMIN;
//				result.setUrl("/admin/userManagement/userDetail?userKey=" + userEntity.getUserKey());
//			} else {
//				loginName = Default.Session.USER;
//				result.setUrl("/");
//			}
			session.setAttribute(loginName, userEntity);
			result.setLoginInfo(userEntity);
			result.setCode(Default.Result.SUCCESS);
			result.setMessage(messages.getMessage("user.login.success"));
			userService.rememberKeepIdValue(req, res, userCommon); // 아이디 기억하기
			LOGGER.info("Welcome to SMARTFLAT! Login User ID is : {}.", userEntity.getId());

		} catch (InputMismatchException e) {
			result.setCode(PASSWORD_MISMATCHED);
			result.setMessage(messages.getMessage("user.account.not.found"));
			LOGGER.error("AdminRestController.loginSubmit:PasswordMismatched", e);

		} catch (InvalidParameterException e) {
			String type = e.getMessage();
			if (Default.LoginFailCode.NOT_FOUND.equals(type)) {
				result.setCode(EMPTY_RESULT);
				result.setMessage(messages.getMessage("user.account.not.found"));
				LOGGER.error("AdminRestController.loginSubmit:NotFoundAccount", e);
			}

		} catch (Exception e) {
			result.setCode(Default.Result.FAIL);
			result.setMessage(messages.getMessage("user.login.fail"));
			LOGGER.error("AdminRestController.loginSubmit:Failed", e);
		}
		return result;
	}


	/**
	 * 로그아웃
	 * @param session
	 * @param userCommon
	 * @return
	 */
	@RequestMapping(value = "/loginRest/logoutSubmit")
	public ResultEntity logoutSubmit(HttpSession session, UserEntity userCommon) {
		ResultEntity result = new ResultEntity();
		try {

			String loginName;
			loginName = Default.Session.ADMIN;
			result.setUrl("/");

			session.removeAttribute(loginName);

			result.setCode(Default.Result.SUCCESS);
			result.setMessage(messages.getMessage("user.logout.success"));

		} catch (Exception e) {
			result.setCode(Default.Result.FAIL);
			result.setMessage(messages.getMessage("user.logout.fail"));
			LOGGER.error("LoginRestController.logoutSubmit:Failed", e);
		}
		return result;
	}

}

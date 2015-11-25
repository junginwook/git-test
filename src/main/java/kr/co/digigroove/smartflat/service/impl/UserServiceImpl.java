package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.dao.UserDAO;
import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.service.CookieService;
import kr.co.digigroove.smartflat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.InvalidParameterException;
import java.util.InputMismatchException;

/**
 * Created by changjo on 15. 11. 24.
 */
@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService{

	/** 아이디 기억하기 */
	private static final String KEEP_ID_ON = "on";

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CookieService cookieService;

	@Override
	public void rememberKeepIdValue(HttpServletRequest req, HttpServletResponse res, UserEntity userCommon) throws Exception {

	}

	/**
	 * 로그인 체크
	 * @param userCommon
	 * @return
	 * @throws Exception
	 */
	@Override
	public UserEntity loginUserCheck(UserEntity userCommon) throws Exception {
		UserEntity userInfo = userDAO.selectLoginUserCheck(userCommon);
//		String password = HashUtils.encryptSHA256(userCommon.getPassword(), hashSalt);
		if (userInfo == null) throw new InvalidParameterException(Default.LoginFailCode.NOT_FOUND);
		else {
			if (!userCommon.getPassword().equals(userInfo.getPassword())) throw new InputMismatchException();
		}
		return userInfo;
	}

	@Override
	public UserEntity retrieveUserEntity(UserEntity userEntity) throws Exception {
		return userDAO.selectUserEntity(userEntity);
	}
}

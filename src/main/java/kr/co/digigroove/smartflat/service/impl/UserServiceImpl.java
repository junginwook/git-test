package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.commons.utils.HashUtils;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.dao.UserDAO;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.entities.UserResultEntity;
import kr.co.digigroove.smartflat.entities.common.CookieEntity;
import kr.co.digigroove.smartflat.service.CookieService;
import kr.co.digigroove.smartflat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@Value("#{serviceProp['hash_salt']}")
	private String hashSalt;

	@Override
	public void rememberKeepIdValue(HttpServletRequest req, HttpServletResponse res, UserEntity userCommon) throws Exception {
		CookieEntity cookie = new CookieEntity();
		cookie.setName(Default.Cookie.KEEP_ID_ADMIN);
		if (userCommon.getKeepIdYn() != null && KEEP_ID_ON.equals(userCommon.getKeepIdYn())) {
			cookie.setValue(userCommon.getId());
			cookieService.setKeepIdCookie(req, res, cookie);
		} else {
			cookie.setTime(0);
			res.addCookie(cookieService.settingCookie(cookie));
		}
	}

	/**
	 * 로그인 체크
	 * @param userEntity
	 * @return
	 * @throws Exception
	 */
	@Override
	public UserResultEntity loginUserCheck(UserEntity userEntity) throws Exception {

		UserResultEntity userResultEntity = new UserResultEntity();

		UserEntity userInfo = userDAO.selectLoginUserCheck(userEntity);
		String password = HashUtils.encryptSHA256(userEntity.getPassword(), hashSalt);
		if(userInfo == null) {
			userResultEntity.setCode(Default.Result.EMPTY);
		}else{
			if(userInfo.getPassword().equals(password)){
				userResultEntity.setCode(Default.Result.SUCCESS);
				userResultEntity.setLoginInfo(userInfo);
			}else{
				userResultEntity.setCode(Default.Result.PASSWORD_MISMATCHED);
			}
		}
		return userResultEntity;
	}

	@Override
	public UserEntity retrieveUserEntity(UserEntity userEntity) throws Exception {
		return userDAO.selectUserEntity(userEntity);
	}

	@Override
	@Transactional(readOnly = false)
	public ResultEntity modifyUserEntity(UserEntity userEntity) throws Exception {

		ResultEntity resultEntity = new ResultEntity();
		UserEntity oldUserEntity = userDAO.selectUserEntity(userEntity);

		String oldPassword = HashUtils.encryptSHA256(userEntity.getOldPassword(), hashSalt);
		String newPassword = HashUtils.encryptSHA256(userEntity.getNewPassword(), hashSalt);

		if(oldUserEntity.getPassword().equals(oldPassword)) {
			userEntity.setPassword(newPassword);
			userDAO.updateUserEntity(userEntity);
			resultEntity.setCode(Default.Result.SUCCESS);
		}else{
			resultEntity.setCode(Default.Result.PASSWORD_MISMATCHED);
		}

		return resultEntity;
	}
}

package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.UserEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by changjo on 15. 11. 24.
 */
public interface UserService {

	/**
	 * 로그인 체크
	 * @param userCommon
	 * @return
	 */
	UserEntity loginUserCheck(UserEntity userCommon) throws Exception;

	/**
	 * 아이디 기억하기
	 * @param req
	 * @param res
	 * @param userCommon
	 * @throws Exception
	 */
	void rememberKeepIdValue(HttpServletRequest req, HttpServletResponse res, UserEntity userCommon) throws Exception;

	UserEntity retrieveUserEntity(UserEntity userEntity) throws Exception;

}

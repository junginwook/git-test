package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.entities.UserResultEntity;

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
	UserResultEntity loginUserCheck(UserEntity userCommon) throws Exception;

	/**
	 * 아이디 기억하기
	 * @param req
	 * @param res
	 * @param userCommon
	 * @throws Exception
	 */
	void rememberKeepIdValue(HttpServletRequest req, HttpServletResponse res, UserEntity userCommon) throws Exception;

	UserEntity retrieveUserEntity(UserEntity userEntity) throws Exception;


	ResultEntity modifyUserEntity(UserEntity userEntity) throws Exception;

}

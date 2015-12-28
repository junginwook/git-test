package kr.co.digigroove.smartflat.dao;

import kr.co.digigroove.smartflat.entities.UserEntity;

/**
 * Created by parkchangjo on 2015. 7. 2..
 */
public interface UserDAO {

  /**
   * 아이디로 유저 조회
   * @param userEntity
   * @return
   */
  UserEntity selectLoginUserCheck(UserEntity userEntity) throws Exception;

  UserEntity selectUserEntity(UserEntity userEntity);

  void updateUserEntity(UserEntity userEntity);
}

package kr.co.digigroove.smartflat.dao;

import kr.co.digigroove.smartflat.entities.RepleEntity;

import java.util.List;

/**
 * Created by changjo on 15. 11. 25.
 */
public interface RepleDAO {

	List<RepleEntity> selectRepleEntityList(RepleEntity repleEntity);

	void insertRepleEntity(RepleEntity repleEntity);

}

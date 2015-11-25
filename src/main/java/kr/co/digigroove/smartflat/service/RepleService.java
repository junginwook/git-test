package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.RepleEntity;

/**
 * Created by changjo on 15. 11. 25.
 */
public interface RepleService {

	RepleEntity retrieveRepleEntityList(RepleEntity repleEntity) throws Exception;

	void registRepleEntity(RepleEntity repleEntity) throws Exception;

}

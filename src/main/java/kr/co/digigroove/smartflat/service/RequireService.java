package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.entities.RequirePageEntity;

/**
 * Created by changjo on 15. 11. 25.
 */
public interface RequireService {

	void registRequireEntity(RequireEntity requireEntity) throws Exception;

	void registRequireEntityByAdmin(RequireEntity requireEntity) throws Exception;

	RequirePageEntity retrieveRequireEntityList(RequirePageEntity requirePageEntity) throws Exception;

	RequireEntity retrieveRequireEntity(RequireEntity requireEntity) throws Exception;

	void modifyRequireEntity(RequireEntity requireEntity) throws Exception;

	void removeRequireEntity(long requireKey) throws Exception;

}

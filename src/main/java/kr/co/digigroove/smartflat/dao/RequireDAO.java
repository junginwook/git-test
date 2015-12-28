package kr.co.digigroove.smartflat.dao;

import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.entities.RequirePageEntity;

import java.util.List;

/**
 * Created by changjo on 15. 11. 25.
 */
public interface RequireDAO {

	void insertRequireEntity(RequireEntity requireEntity);

	void insertRequireEntityByAdmin(RequireEntity requireEntity);

	int selectRequireEntityListCount(RequirePageEntity requirePageEntity);

	List<RequirePageEntity> selectRequireEntityList(RequirePageEntity requirePageEntity);

	RequireEntity selectRequireEntity(RequireEntity requireEntity);

	void updateRequireEntity(RequireEntity requireEntity);

	void deleteRequireEntity(long requireKey);

	void increaseReple(long requireKey);

	void decreaseReple(long requireKey);
}

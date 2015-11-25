package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.smartflat.dao.RequireDAO;
import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.entities.RequirePageEntity;
import kr.co.digigroove.smartflat.service.RequireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changjo on 15. 11. 25.
 */
@Service
@Transactional(readOnly = true)
public class RequireServiceImpl implements RequireService{

	@Autowired
	private RequireDAO requireDAO;

	@Override
	@Transactional(readOnly = false)
	public void registRequireEntity(RequireEntity requireEntity) throws Exception {
		requireDAO.insertRequireEntity(requireEntity);
	}

	@Override
	public RequirePageEntity retrieveRequireEntityList(RequirePageEntity requirePageEntity) throws Exception {
		requirePageEntity.setPageParams();
		requirePageEntity.setDataSize(requireDAO.selectRequireEntityListCount(requirePageEntity));
		requirePageEntity.setRequirePageEntityList(requireDAO.selectRequireEntityList(requirePageEntity));
		return requirePageEntity;
	}

	@Override
	public RequireEntity retrieveRequireEntity(RequireEntity requireEntity) throws Exception {
		return requireDAO.selectRequireEntity(requireEntity);
	}

	@Override
	@Transactional(readOnly = false)
	public void modifyRequireEntity(RequireEntity requireEntity) throws Exception {
		requireDAO.updateRequireEntity(requireEntity);
	}
}

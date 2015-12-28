package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.smartflat.dao.RepleDAO;
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

	@Autowired
	private RepleDAO repleDAO;

	@Override
	@Transactional(readOnly = false)
	public void registRequireEntity(RequireEntity requireEntity) throws Exception {
		requireDAO.insertRequireEntity(requireEntity);
	}

	@Override
	@Transactional(readOnly = false)
	public void registRequireEntityByAdmin(RequireEntity requireEntity) throws Exception {
		requireDAO.insertRequireEntityByAdmin(requireEntity);
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

	@Override
	@Transactional(readOnly = false)
	public void removeRequireEntity(long requireKey) throws Exception {
		requireDAO.deleteRequireEntity(requireKey);
		repleDAO.deleteRepleEntityList(requireKey);
	}
}

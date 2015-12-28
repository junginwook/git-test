package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.smartflat.dao.RepleDAO;
import kr.co.digigroove.smartflat.dao.RequireDAO;
import kr.co.digigroove.smartflat.entities.RepleEntity;
import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.service.RepleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by changjo on 15. 11. 25.
 */
@Service
@Transactional(readOnly = true)
public class RepleServiceImpl implements RepleService{

	@Autowired
	private RepleDAO repleDAO;

	@Autowired
	private RequireDAO requireDAO;

	@Override
	public RepleEntity retrieveRepleEntityList(RepleEntity repleEntity) throws Exception {
		repleEntity.setRepleEntityList(repleDAO.selectRepleEntityList(repleEntity));
		return repleEntity;
	}

	@Override
	@Transactional(readOnly = false)
	public void registRepleEntity(RepleEntity repleEntity) throws Exception {
		repleDAO.insertRepleEntity(repleEntity);
		requireDAO.increaseReple(repleEntity.getRequireKey());
	}

	@Override
	@Transactional(readOnly = false)
	public void removeRepleEntity(long repleKey) throws Exception {
		RepleEntity repleEntity = new RepleEntity();
		repleEntity.setRepleKey(repleKey);
		repleEntity = repleDAO.selectRepleEntity(repleEntity);
		RequireEntity requireEntity = new RequireEntity();
		requireEntity.setRequireKey(repleEntity.getRequireKey());
		requireEntity = requireDAO.selectRequireEntity(requireEntity);

		requireDAO.decreaseReple(requireEntity.getRequireKey());
		repleDAO.deleteRepleEntity(repleKey);
	}
}

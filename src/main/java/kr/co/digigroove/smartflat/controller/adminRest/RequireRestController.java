package kr.co.digigroove.smartflat.controller.adminRest;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.service.RequireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changjo on 15. 11. 24.
 */
@RestController
@RequestMapping(value="/adminRest/requireRest")
public class RequireRestController {

	@Autowired
	private Messages messages;

	@Autowired
	private RequireService requireService;

	@RequestMapping(value="/registRequire", method= RequestMethod.POST)
	public ResultEntity registRequire(RequireEntity requireEntity){

		ResultEntity resultEntity = new ResultEntity();

		try {
			requireService.registRequireEntity(requireEntity);
			resultEntity.setCode(Default.Result.SUCCESS);
			resultEntity.setMessage(messages.getMessage("applicant.save.success"));
		} catch (Exception e) {
			resultEntity.setCode(Default.Result.FAIL);
			resultEntity.setMessage(messages.getMessage("applicant.save.fail"));
		}

		return resultEntity;
	}

	@RequestMapping(value="/modifyRequire", method=RequestMethod.POST)
	public ResultEntity modifyRequire(RequireEntity requireEntity){

		ResultEntity resultEntity = new ResultEntity();

		try {
			requireService.modifyRequireEntity(requireEntity);
			resultEntity.setCode(Default.Result.SUCCESS);
			resultEntity.setMessage(messages.getMessage("require.modify.success"));
		} catch (Exception e) {
			resultEntity.setCode(Default.Result.FAIL);
			resultEntity.setMessage(messages.getMessage("require.modify.fail"));
		}

		return resultEntity;
	}

}

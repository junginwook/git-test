package kr.co.digigroove.smartflat.controller.adminRest;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.RepleEntity;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.service.RepleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changjo on 15. 11. 25.
 */
@RestController
@RequestMapping(value="/adminRest/repleRest")
public class RepleRestController {

	@Autowired
	private RepleService repleService;

	@Autowired
	private Messages messages;

	@RequestMapping(value="/registReple", method= RequestMethod.POST)
	public ResultEntity registReple(RepleEntity repleEntity) throws Exception{

		ResultEntity resultEntity = new ResultEntity();

		try {
			repleService.registRepleEntity(repleEntity);
			resultEntity.setMessage(messages.getMessage("reple.regist.success"));
			resultEntity.setCode(Default.Result.SUCCESS);
		} catch (Exception e) {
			resultEntity.setMessage(messages.getMessage("reple.regist.fail"));
			resultEntity.setCode(Default.Result.FAIL);
		}

		return resultEntity;
	}

}

package kr.co.digigroove.smartflat.controller.adminRest;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.entities.UserEntity;
import kr.co.digigroove.smartflat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by changjo on 15. 11. 26.
 */
@RestController
@RequestMapping(value="/adminRest/userRest")
public class UserRestController {

	@Autowired
	private Messages messages;

	@Autowired
	private UserService userService;

	@RequestMapping(value="/modifyUser", method = RequestMethod.POST)
	public ResultEntity modifyUser(UserEntity userEntity) throws Exception{

		ResultEntity resultEntity = new ResultEntity();

		try {
			resultEntity = userService.modifyUserEntity(userEntity);
			if(resultEntity.getCode().equals(Default.Result.PASSWORD_MISMATCHED)){
				resultEntity.setMessage(messages.getMessage("password.modify.mismatch"));
			}else{
				resultEntity.setMessage(messages.getMessage("password.modify.success"));
			}
		} catch (Exception e) {
			resultEntity.setMessage(messages.getMessage("password.modify.fail"));
			resultEntity.setCode(Default.Result.FAIL);
		}

		return resultEntity;
	}

}

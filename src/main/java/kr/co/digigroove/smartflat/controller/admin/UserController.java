package kr.co.digigroove.smartflat.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by changjo on 15. 11. 26.
 */
@Controller
@RequestMapping(value="/admin/user")
public class UserController {

	@RequestMapping(value="/userDetail", method= RequestMethod.GET)
	public String userDetail() throws Exception{
		return "admin/user/userDetail";
	}

}

package kr.co.digigroove.smartflat.controller.admin;

import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.service.CookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by changjo on 15. 11. 24.
 */
@Controller
public class AdminController {

	@Autowired
	private CookieService cookieService;

	@RequestMapping(value = "/admin", method= RequestMethod.GET)
	public String login(HttpServletRequest httpServletRequest, final Model model) throws Exception{
		model.addAttribute("keepIdValue", cookieService.getKeepIdCookie(httpServletRequest, Default.Cookie.KEEP_ID_ADMIN));
		return "admin/login";
	}

}

package kr.co.digigroove.smartflat.common;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.commons.utils.StringUtils;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.ErrorResultEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by bearhj on 14. 11. 26.
 */
@Controller
@RequestMapping(value = "/common")
public class CommonController {


	@Autowired
	private Messages messages;

	private static final class Url {
		private static final String USER = "/";
		private static final String ADMIN = "/admin";
	}

	/**
	 * 에러 페이지
	 * @param errorResult
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String userError(@ModelAttribute ErrorResultEntity errorResult) throws Exception {
		errorResult.setMessage(StringUtils.nl2br(messages.getMessage(errorResult.getCode())));
		errorResult.setUrl(Integer.parseInt(errorResult.getIsAdmin()) == Default.IS_ADMIN ? Url.ADMIN : Url.USER);
		return "error";
	}

	/**
	 * ajax 에러 페이지
	 * @param errorResult
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/errorAjax", method = RequestMethod.GET)
	@ResponseBody
	public ErrorResultEntity userErrorAjax(ErrorResultEntity errorResult) throws Exception {
		return errorResult;
	}
}

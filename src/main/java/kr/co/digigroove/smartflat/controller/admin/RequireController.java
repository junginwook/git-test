package kr.co.digigroove.smartflat.controller.admin;

import com.google.gson.Gson;
import kr.co.digigroove.smartflat.entities.RepleEntity;
import kr.co.digigroove.smartflat.entities.RequireEntity;
import kr.co.digigroove.smartflat.entities.RequirePageEntity;
import kr.co.digigroove.smartflat.service.RepleService;
import kr.co.digigroove.smartflat.service.RequireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by changjo on 15. 11. 24.
 */
@Controller
@RequestMapping(value = "/admin/require")
public class RequireController {

	@Autowired
	private RequireService requireService;

	@Autowired
	private RepleService repleService;

	@RequestMapping(value="/requireList", method= RequestMethod.GET)
	public String requireList(final Model model, RequirePageEntity requirePageEntity) throws Exception {

		requirePageEntity = requireService.retrieveRequireEntityList(requirePageEntity);

		model.addAttribute("currentMenu", "requireList");
		model.addAttribute("requireEntityList", requirePageEntity);

		Gson gson = new Gson();
		model.addAttribute("jsonList", gson.toJson(requirePageEntity.getRequirePageEntityList()));

		return "admin/require/requireList";
	}

	@RequestMapping(value="/requireDetail", method=RequestMethod.GET)
	public String requieDetail(final Model model, @RequestParam(value="requireKey") int requireKey) throws Exception{

		RequireEntity requireEntity = new RequireEntity();
		requireEntity.setRequireKey(requireKey);

		model.addAttribute("requireEntity", requireService.retrieveRequireEntity(requireEntity));

		RepleEntity repleEntity = new RepleEntity();
		repleEntity.setRequireKey(requireKey);

		model.addAttribute("repleEntityList", repleService.retrieveRepleEntityList(repleEntity));

		model.addAttribute("currentMenu", "requireList");

		return "admin/require/requireDetail";
	}

	@RequestMapping(value="/requireRegistForm", method=RequestMethod.GET)
	public String requireRegistForm(final Model model) throws Exception{

		model.addAttribute("currentMenu", "requireList");

		return "admin/require/requireRegist";
	}
}

package kr.co.digigroove.smartflat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yusul on 15. 1. 30..
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String userMain(Model model) {
        model.addAttribute("currentPage", "main");
        return "main/main";
    }

    @RequestMapping(value="/pro")
    public String proMain(Model model){
        model.addAttribute("currentPage", "pro");
        return "main/property";
    }


}

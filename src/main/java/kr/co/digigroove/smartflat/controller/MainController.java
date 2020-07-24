package kr.co.digigroove.smartflat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yusul on 15. 1. 30..
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String userMain(Model model, HttpServletRequest request) {
        // https 접속유도 위한 분기처리
//        if("SSLv3".equals(request.getProtocol())) {
            model.addAttribute("currentPage", "main");
            return "main/main";
//        } else {
//            return "redirect:" + "https://smartflat.co.kr";
//        }
    }

    @RequestMapping(value="/pro")
    public String proMain(Model model){
        model.addAttribute("currentPage", "pro");
        return "main/property";
    }

}

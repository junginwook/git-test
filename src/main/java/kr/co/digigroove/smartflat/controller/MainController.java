package kr.co.digigroove.smartflat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yusul on 15. 1. 30..
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String userMain() {
        return "main/main";
    }

    @RequestMapping(value="/pro")
    public String proMain(){
        return "main/property";
    }


}

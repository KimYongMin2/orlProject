package com.bitcamp.orl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/map")
    public String map() {
        return "/mountain/mountain_all";
    }

    @RequestMapping("/info")
    public String info() {
        return "/mountain/mountain_info";
    }

    @RequestMapping("/local")
    public String local() {
        return "/mountain/local";
    }




}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.controller.pos;


import com.romaqui.siadi.util.SessionUtil;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author nerio
 */
@Controller("poshomeController")
@RequestMapping("pos/home")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpSession session, ModelMap m) {
        return SessionUtil.sesion("pos/index", session, "02","00","00", m);
    }
}

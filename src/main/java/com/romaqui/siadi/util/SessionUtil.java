package com.romaqui.siadi.util;

import com.romaqui.siadi.entity.Colaborador;
import com.romaqui.siadi.entity.Funcionacceso;
import com.romaqui.siadi.entity.Moduloacceso;
import com.romaqui.siadi.entity.Rolacceso;
import com.romaqui.siadi.entity.Usuario;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author nerio
 */
public class SessionUtil {

    public static String SessionExpired = "{\"sesion\":\"SessionExpired\"}";
    public static int NumberSessionExpired = -1;
    public static Usuario user = new Usuario(0, new Colaborador(0, 47887880, "NERIO", "BAEZ", "DELGADO"), "admin", "bf9b291c101de627b225c3cff9094660", true);

    public static ModelAndView sesion(ModelAndView mav, HttpSession sesion, String modulo, String rol, String funcion) {
        try {
            Usuario usera = (Usuario) sesion.getAttribute("user");

            List<Moduloacceso> lma = (List<Moduloacceso>) usera.getModuloaccesos();
            for (Moduloacceso ma : lma) {
                if (ma.getCodigo().equals(modulo)) {
                    sesion.setAttribute("modulo", ma);
                    List<Rolacceso> lra = (List<Rolacceso>) ma.getRolaccesos();
                    for (Rolacceso ra : lra) {
                        if (ra.getCodigo().equals(rol)) {
                            List<Funcionacceso> lfa = (List<Funcionacceso>) ra.getFuncionaccesos();
                            for (Funcionacceso fa : lfa) {
                                if (fa.getCodigo().equals(funcion)) {
                                    return mav;
                                }
                            }
                        } else {
                            if (rol.equals("00")) {
                                mav = new ModelAndView("redirect:" + ma.getRuta() + "/home");
                            }
                        }
                    }
                }
            }
            mav = new ModelAndView("modulos");
            mav.addObject("message", "» Usted no tiene permisos para acceder a la opcion que eligio.");
            return mav;
        } catch (Exception e) {
            mav = new ModelAndView("login");
            mav.addObject("error", "» La sesion ha expirado los 30 minutos de acceso.");
            return mav;
        }
    }

    public static String sesion(String v, HttpSession sesion, String modulo, String rol, String funcion, ModelMap model) {
        try {
            Usuario usera = (Usuario) sesion.getAttribute("user");

            List<Moduloacceso> lma = (List<Moduloacceso>) usera.getModuloaccesos();
            for (Moduloacceso ma : lma) {
                if (ma.getCodigo().equals(modulo)) {
                    sesion.setAttribute("modulo", ma);
                    List<Rolacceso> lra = (List<Rolacceso>) ma.getRolaccesos();
                    for (Rolacceso ra : lra) {
                        if (ra.getCodigo().equals(rol)) {
                            List<Funcionacceso> lfa = (List<Funcionacceso>) ra.getFuncionaccesos();
                            for (Funcionacceso fa : lfa) {
                                if (fa.getCodigo().equals(funcion)) {
                                    return v;
                                }
                            }
                        } else {
                            if (rol.equals("00")) {
                                return ma.getRuta() + "/index";
                            }
                        }
                    }
                }
            }

            model.addAttribute("message", "» Usted no tiene permisos para acceder a la opcion que eligio.");
            return "modulos";
        } catch (Exception e) {
            model.addAttribute("error", "» La sesion ha expirado los 30 minutos de acceso.");
            return "login";
        }
    }

    public static boolean sesion(HttpSession sesion) {
        try {
            Usuario usera = (Usuario) sesion.getAttribute("user");
            return usera != null;
        } catch (Exception e) {
            return false;
        }
    }

}

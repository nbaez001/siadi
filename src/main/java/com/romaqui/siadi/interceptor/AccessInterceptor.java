/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.interceptor;

import com.romaqui.siadi.util.LicenseUtil;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author nerio
 */
@Component
public class AccessInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Date fechaLimite = new Date(LicenseUtil.getFechaLimite());
        Date hoy = new Date();

        if (hoy.before(fechaLimite)) {
            return true;
        } else {
            response.getWriter().write("Something's wrong on database configuration, contact your software provider tel. 929181954");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
        Date fechaLimite = new Date(LicenseUtil.getFechaLimite());
        Date hoy = new Date();

        int contardias = contarDias(hoy, fechaLimite);

        if (hoy.before(fechaLimite)) {
            //MOSTRAR MENSAJE SI ESTA A 30 dias de expirar
            if (contardias <= 30) {
                mav.addObject("message", "Your license is near to expire, contact your software provider tel. 929181954");
            }
        } else {
            response.getWriter().write("Something's wrong on database configuration, contact your software provider tel. 929181954");
        }
    }

    public int contarDias(Date fechaInicio, Date fechaFin) {
        Calendar cFechainicio = Calendar.getInstance();
        cFechainicio.setTime(fechaInicio);

        Calendar cFechafin = Calendar.getInstance();
        cFechafin.setTime(fechaFin);

        int c = 0;
        while (cFechainicio.before(cFechafin)) {
            cFechainicio.add(Calendar.DATE, 1);
            c++;
        }

        return c;
    }
}

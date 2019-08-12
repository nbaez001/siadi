/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.AsistenciaDao;
import com.romaqui.siadi.dao.TablamaestraDao;
import com.romaqui.siadi.dao.TurnoDao;
import com.romaqui.siadi.entity.Asistencia;
import com.romaqui.siadi.entity.Contrato;
import com.romaqui.siadi.entity.Tablamaestra;
import com.romaqui.siadi.entity.Turno;
import com.romaqui.siadi.entity.nuevo.AsistenciaControl;
import com.romaqui.siadi.service.AsistenciaService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nerio
 */
@Service
public class AsistenciaServiceImpl extends GenericServiceImpl<Asistencia> implements AsistenciaService {

    @Autowired
    AsistenciaDao asistenciaDao;
    @Autowired
    TurnoDao turnoDao;
    @Autowired
    TablamaestraDao tablamaestraDao;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public List<String> controlSemanal(Contrato c) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());

        int dia = cal.get(Calendar.DAY_OF_WEEK);
        for (int i = dia; i >= 0; i--) {
            List<Turno> lt = turnoDao.consultList("from Turno t where t.dia=" + dia + " and t.contrato.id=" + c.getId() + " order by idttipoturno desc");
        }
        return null;
    }

    @Override
    public List<AsistenciaControl> controlAsistenciaMensual(Contrato c, Date fecha) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(fecha);
        int diaf = cal.getActualMaximum(Calendar.DATE);

        String fInicio = sdf.format(cal.getTime());
        fecha.setDate(diaf);
        String fFin = sdf.format(fecha);

        Tablamaestra tm;
        String color;

        List<AsistenciaControl> lac = new ArrayList<>();
        List<Asistencia> la = asistenciaDao.consultList("from Asistencia a where a.fecha>='" + fInicio + "' and a.fecha<='" + fFin + "' and a.contrato.id=" + c.getId());
        for (Asistencia a : la) {
            tm = tablamaestraDao.read(a.getIdttipoasistencia());
            if (tm.getIditem() == 1) {
                color = "#3a87ad";
            } else {
                if (tm.getIditem() == 2) {
                    color = "#FB8F00";
                } else {
                    color = "#FF0000";
                }
            }

            lac.add(new AsistenciaControl(tm.getNombre(), a.getFecha().getYear() + 1900, a.getFecha().getMonth(), a.getFecha().getDate(), a.getHoraentrada().getHours(), a.getHoraentrada().getMinutes(), a.getFecha().getYear() + 1900, a.getFecha().getMonth(), a.getFecha().getDate(), a.getHorasalida().getHours(), a.getHorasalida().getMinutes(), false, color, null));
        }
        /*
         for (int i = dia; i > 0; i--) {
         fechaAux.setDate(i);
         cal.setTime(fechaAux);
         if (fechaAux.before(new Date())) {
         List<Turno> lt = turnoDao.consultList("from Turno t where t.contrato.id=" + c.getId() + " and t.dia=" + cal.get(Calendar.DAY_OF_WEEK) + " order by idttipoturno desc");
         for (Turno t : lt) {
         a = (Asistencia) asistenciaDao.consultUnique("from Asistencia a where a.turno.id=" + t.getId() + " and a.fecha='" + sdf.format(fechaAux) + "'");

         if (a != null) {
         lac.add(new AsistenciaControl("ASISTIO", fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), a.getHoraentrada().getHours(), a.getHoraentrada().getMinutes(), fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHorasalida().getHours(), t.getHorasalida().getMinutes(), false,"#3a87ad",null));
         } else {
         lac.add(new AsistenciaControl("FALTO", fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHoraentrada().getHours(), t.getHoraentrada().getMinutes(), fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHorasalida().getHours(), t.getHorasalida().getMinutes(), false,"#FF0000","/personal/asistencia"));
         }
         }
         } else {
         List<Turno> lt = turnoDao.consultList("from Turno t where t.contrato.id=" + c.getId() + " and t.dia=" + cal.get(Calendar.DAY_OF_WEEK) + " order by idttipoturno desc");
         for (Turno t : lt) {
         a = (Asistencia) asistenciaDao.consultUnique("from Asistencia a where a.turno.id=" + t.getId() + " and a.fecha='" + sdf.format(fechaAux) + "'");

         if (a != null) {
         lac.add(new AsistenciaControl("ASISTIO", fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), a.getHoraentrada().getHours(), a.getHoraentrada().getMinutes(), fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHorasalida().getHours(), t.getHorasalida().getMinutes(), false,"#3a87ad",null));
         } else {
         //COMPARA POR CUANTOSMINUTOS SE PASO
         Date horaInAux = new Date();
         Date horaEnAux;
         try {
         horaInAux = sdf.parse(sdf.format(horaInAux));
         horaEnAux = sdf.parse(sdf.format(t.getHoraentrada()));
         if (horaInAux.compareTo(horaEnAux) < 0) {
         //COMPARAR POR CUANTOS MINUTOS ANTES

         } else {
         if (horaInAux.compareTo(horaEnAux) == 0) {

         } else {
         //COMPARAR POR CUANTOS MINUTOS SE TARDO
         Calendar calen = Calendar.getInstance();
         calen.setTime(horaEnAux);
         calen.add(Calendar.MINUTE, 30);

         horaEnAux = calen.getTime();
         if (horaInAux.after(horaEnAux)) {
         //FALTO
         lac.add(new AsistenciaControl("FALTO", fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHoraentrada().getHours(), t.getHoraentrada().getMinutes(), fechaAux.getYear() + 1900, fechaAux.getMonth(), fechaAux.getDate(), t.getHorasalida().getHours(), t.getHorasalida().getMinutes(), false,"",""));
         } else {
         //AUN NO MARCO
         }
         }
         }
         } catch (Exception e) {
         }
         }
         }
         }

         }*/
        return lac;
    }

}

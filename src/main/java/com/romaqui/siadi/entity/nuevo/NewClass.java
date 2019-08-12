/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author NERIO
 */
public class NewClass {
    public static void main(String[] args) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(new Date());
        
        System.out.println(""+cal.getActualMaximum(Calendar.DATE));
        
        /*int dia=cal.get(Calendar.DATE);
        int mes=cal.get(Calendar.MONTH)+1;
        int anio=cal.get(Calendar.YEAR);
        
        System.out.println("dia: "+dia);
        System.out.println("mes: "+mes);
        System.out.println("anio: "+anio);
        
        Date fechaAux=new Date();
        fechaAux.setDate(19);
        fechaAux.setMonth(8);
        fechaAux.setYear(118);
        System.out.println(""+fechaAux);*/
    }
}

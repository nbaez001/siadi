/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.util;

/**
 *
 * @author nerio
 */
public class LicenseUtil {

    private static String fechaLimite = "2019/08/12";

    public static String getFechaLimite() {
        return fechaLimite;
    }

    public static void setFechaLimite(String fechaLimite) {
        LicenseUtil.fechaLimite = fechaLimite;
    }
}

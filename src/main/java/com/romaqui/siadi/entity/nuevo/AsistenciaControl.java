/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.entity.nuevo;

/**
 *
 * @author NERIO
 */
public class AsistenciaControl {

    private String titulo;
    private int sAnio;
    private int sMes;
    private int sDia;
    private int sHora;
    private int sMin;
    private int eAnio;
    private int eMes;
    private int eDia;
    private int eHora;
    private int eMin;
    private boolean allDay;
    private String color;
    private String url;

    public AsistenciaControl() {
    }

    public AsistenciaControl(String titulo, int sAnio, int sMes, int sDia, int sHora, int sMin, int eAnio, int eMes, int eDia, int eHora, int eMin, boolean allDay, String color, String url) {
        this.titulo = titulo;
        this.sAnio = sAnio;
        this.sMes = sMes;
        this.sDia = sDia;
        this.sHora = sHora;
        this.sMin = sMin;
        this.eAnio = eAnio;
        this.eMes = eMes;
        this.eDia = eDia;
        this.eHora = eHora;
        this.eMin = eMin;
        this.allDay = allDay;
        this.color = color;
        this.url = url;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getsAnio() {
        return sAnio;
    }

    public void setsAnio(int sAnio) {
        this.sAnio = sAnio;
    }

    public int getsMes() {
        return sMes;
    }

    public void setsMes(int sMes) {
        this.sMes = sMes;
    }

    public int getsDia() {
        return sDia;
    }

    public void setsDia(int sDia) {
        this.sDia = sDia;
    }

    public int getsHora() {
        return sHora;
    }

    public void setsHora(int sHora) {
        this.sHora = sHora;
    }

    public int getsMin() {
        return sMin;
    }

    public void setsMin(int sMin) {
        this.sMin = sMin;
    }

    public int geteAnio() {
        return eAnio;
    }

    public void seteAnio(int eAnio) {
        this.eAnio = eAnio;
    }

    public int geteMes() {
        return eMes;
    }

    public void seteMes(int eMes) {
        this.eMes = eMes;
    }

    public int geteDia() {
        return eDia;
    }

    public void seteDia(int eDia) {
        this.eDia = eDia;
    }

    public int geteHora() {
        return eHora;
    }

    public void seteHora(int eHora) {
        this.eHora = eHora;
    }

    public int geteMin() {
        return eMin;
    }

    public void seteMin(int eMin) {
        this.eMin = eMin;
    }

    public boolean isAllDay() {
        return allDay;
    }

    public void setAllDay(boolean allDay) {
        this.allDay = allDay;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}

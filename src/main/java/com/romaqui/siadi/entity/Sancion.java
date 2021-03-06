package com.romaqui.siadi.entity;
// Generated 03/06/2017 09:12:02 PM by Hibernate Tools 4.3.1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Sancion generated by hbm2java
 */
@Entity
@Table(name = "sancion")
public class Sancion implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "idtiposancion", nullable = false)
    private int idtiposancion;

    @Column(name = "fechainicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechainicio;

    @Column(name = "fechafin", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechafin;

    @Column(name = "descripcion", nullable = true, length = 250)
    private String descripcion;

    public Sancion() {
    }

    public Sancion(int id, int idtiposancion, Date fechainicio, Date fechafin) {
        this.id = id;
        this.idtiposancion = idtiposancion;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
    }

    public Sancion(int id, int idtiposancion, Date fechainicio, Date fechafin, String descripcion) {
        this.id = id;
        this.idtiposancion = idtiposancion;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.descripcion = descripcion;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdtiposancion() {
        return this.idtiposancion;
    }

    public void setIdtiposancion(int idtiposancion) {
        this.idtiposancion = idtiposancion;
    }

    public Date getFechainicio() {
        return this.fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafin() {
        return this.fechafin;
    }

    public void setFechafin(Date fechafin) {
        this.fechafin = fechafin;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}

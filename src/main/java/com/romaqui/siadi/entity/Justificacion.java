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
 * Justificacion generated by hbm2java
 */
@Entity
@Table(name = "justificacion")
public class Justificacion implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "idtipojustificacion", nullable = false)
    private int idtipojustificacion;
    
    @Column(name = "fechainicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechainicio;
    
    @Column(name = "fechafin", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechafin;
    
    @Column(name = "horainicio", nullable = false)
    @Temporal(TemporalType.TIME)
    private Date horainicio;
    
    @Column(name = "horafin", nullable = true)
    @Temporal(TemporalType.TIME)
    private Date horafin;
    
    @Column(name = "descripcion", nullable = true, length = 250)
    private String descripcion;

    public Justificacion() {
    }

    public Justificacion(int id, int idtipojustificacion, Date fechainicio, Date fechafin, Date horainicio) {
        this.id = id;
        this.idtipojustificacion = idtipojustificacion;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.horainicio = horainicio;
    }

    public Justificacion(int id, int idtipojustificacion, Date fechainicio, Date fechafin, Date horainicio, Date horafin, String descripcion) {
        this.id = id;
        this.idtipojustificacion = idtipojustificacion;
        this.fechainicio = fechainicio;
        this.fechafin = fechafin;
        this.horainicio = horainicio;
        this.horafin = horafin;
        this.descripcion = descripcion;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdtipojustificacion() {
        return this.idtipojustificacion;
    }

    public void setIdtipojustificacion(int idtipojustificacion) {
        this.idtipojustificacion = idtipojustificacion;
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

    public Date getHorainicio() {
        return this.horainicio;
    }

    public void setHorainicio(Date horainicio) {
        this.horainicio = horainicio;
    }

    public Date getHorafin() {
        return this.horafin;
    }

    public void setHorafin(Date horafin) {
        this.horafin = horafin;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
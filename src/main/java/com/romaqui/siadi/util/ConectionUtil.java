/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author nerio
 */
public class ConectionUtil {

    private Connection conexion = null;
    private String url = "";

    public ConectionUtil() {
        try {
            Class.forName("org.postgresql.Driver");
            url = "jdbc:postgresql://localhost:5432/siadi";
            conexion = DriverManager.getConnection(url, "postgres", "1234");
            System.out.println("Conexion a Base de Datos " + url + " . . . . .Ok");
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public Connection cerrarConexion() {
        try {
            conexion.close();
            System.out.println("Cerrando conexion a " + url + " . . . . . Ok");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        conexion = null;
        return conexion;
    }
}

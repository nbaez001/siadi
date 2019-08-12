/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.util;

import java.io.ByteArrayOutputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;

/**
 *
 * @author nerio
 */
public class ReportUtil {

    public static final String MEDIA_TYPE_EXCEL = "application/vnd.ms-excel";
    public static final String MEDIA_TYPE_PDF = "application/pdf";
    public static final String EXTENSION_TYPE_EXCEL = "xls";
    public static final String EXTENSION_TYPE_PDF = "pdf";

    public HttpServletResponse export(String type,
            JasperPrint jp,
            HttpServletResponse response,
            ByteArrayOutputStream baos) {
        if (type.equalsIgnoreCase(EXTENSION_TYPE_EXCEL)) {
            exportXls(jp, baos);
            String fileName = "UserReport.xls";
            response.setHeader("Content-Disposition", "inline; filename=" + fileName);
            response.setContentType(MEDIA_TYPE_EXCEL);
            response.setContentLength(baos.size());
            return response;
        }
        if (type.equalsIgnoreCase(EXTENSION_TYPE_PDF)) {
            exportPdf(jp, baos);
            String fileName = "UserReport.pdf";
            response.setHeader("Content-Disposition", "inline; filename=" + fileName);
            response.setContentType(MEDIA_TYPE_PDF);
            response.setContentLength(baos.size());
            return response;
        }
        throw new RuntimeException("No type set for type " + type);
    }

    public void exportXls(JasperPrint jp, ByteArrayOutputStream baos) {
        JRXlsExporter exporter = new JRXlsExporter();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
        exporter.setParameter(JRXlsAbstractExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
        exporter.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
        exporter.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND,
                Boolean.FALSE);
        try {
            exporter.exportReport();
        } catch (JRException e) {
            throw new RuntimeException(e);
        }
    }

    public void exportPdf(JasperPrint jp, ByteArrayOutputStream baos) {
        JRPdfExporter exporter = new JRPdfExporter();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
        try {
            exporter.exportReport();
        } catch (JRException e) {
            throw new RuntimeException(e);
        }
    }

    public void write(String token, HttpServletResponse response, ByteArrayOutputStream baos) {
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            baos.writeTo(outputStream);
            outputStream.flush();
        } catch (Exception e) {
            System.out.println("Unable to write report to the output stream");
            throw new RuntimeException(e);
        }
    }
}

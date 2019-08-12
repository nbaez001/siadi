/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
public class FileUploaderUtil {

    public static String simpleUpload(MultipartFile file, HttpServletRequest request, String upload_folder, List<String> listaFiles) {
        String filename;
        try {
            if (!file.isEmpty()) {
                String applicationPath = request.getServletContext().getRealPath("");

                String currentFileName = file.getOriginalFilename();
                if (currentFileName.length() > 25) {
                    String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
                    currentFileName = currentFileName.substring(0, 19) + extension;
                    if (listaFiles.contains(currentFileName)) {
                        Long nameRadom = Calendar.getInstance().getTimeInMillis();
                        filename = nameRadom + extension;
                    } else {
                        filename = currentFileName;
                    }
                } else {
                    if (listaFiles.contains(currentFileName)) {
                        String extension = currentFileName.substring(currentFileName.lastIndexOf("."), currentFileName.length());
                        Long nameRadom = Calendar.getInstance().getTimeInMillis();
                        filename = nameRadom + extension;
                    } else {
                        filename = file.getOriginalFilename();
                    }
                }
                byte[] bytes = file.getBytes();
                File dir = new File(applicationPath + upload_folder);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return filename;

            } else {
                filename = null;
            }
        } catch (Exception e) {
            filename = null;
        }
        return filename;
    }

    public static List<String> MultipleUpload(List<MultipartFile> files, HttpServletRequest request, String upload_folder, List<String> listaFiles) {
        List<String> filenames = new ArrayList<>();
        try {
            if (!files.isEmpty()) {
                BufferedOutputStream stream = null;
                String applicationPath = request.getServletContext().getRealPath("");
                for (MultipartFile file : files) {
                    String filename = "";
                    String currentFileName = file.getOriginalFilename();
                    if (currentFileName.length() > 25) {
                        String extension = currentFileName.substring(
                                currentFileName.lastIndexOf("."),
                                currentFileName.length());
                        currentFileName = currentFileName.substring(0, 19) + extension;
                        if (listaFiles.contains(currentFileName)) {
                            Long nameRadom = Calendar.getInstance().getTimeInMillis();
                            String newfilename = nameRadom + extension;
                            filename = newfilename;
                        } else {
                            filename = currentFileName;
                        }
                    } else {
                        if (listaFiles.contains(currentFileName)) {
                            String extension = currentFileName.substring(
                                    currentFileName.lastIndexOf("."),
                                    currentFileName.length());
                            Long nameRadom = Calendar.getInstance().getTimeInMillis();
                            String newfilename = nameRadom + extension;
                            filename = newfilename;
                        } else {
                            filename = file.getOriginalFilename();
                        }
                    }
                    byte[] bytes = file.getBytes();
                    String rootPath = applicationPath;
                    File dir = new File(rootPath + upload_folder);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
                    stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                    stream.write(bytes);
                    System.out.println(filename);
                    filenames.add(filename);
                }
                stream.close();
            } else {
                filenames = null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            filenames = null;
        }
        return filenames;
    }

    public static List<String> listaArchivos(HttpServletRequest request, String upload_folder) {
        List<String> listaFicheros = new ArrayList<>();

        String applicationPath = request.getServletContext().getRealPath("") + upload_folder;
        File f = new File(applicationPath);

        if (f.exists()) {
            File[] ficheros = f.listFiles();
            for (File fichero : ficheros) {
                listaFicheros.add(fichero.getName());
            }
            return listaFicheros;
        } else {
            return listaFicheros;
        }
    }

    public static boolean deleteFile(HttpServletRequest request, String file) {
        String applicationPath = request.getServletContext().getRealPath("");
        File fichero = new File(applicationPath + file);
        return fichero.delete();
    }

    public static String logoUpload(MultipartFile file, HttpServletRequest request, String upload_folder, String filename) {
        try {
            if (!file.isEmpty()) {
                String applicationPath = request.getServletContext().getRealPath("");
                byte[] bytes = file.getBytes();
                File dir = new File(applicationPath + upload_folder);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(dir.getAbsolutePath() + File.separator + filename);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return filename;
            } else {
                filename = null;
            }
        } catch (Exception e) {
            filename = null;
        }
        return filename;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.romaqui.siadi.service.impl;

import com.romaqui.siadi.dao.AgenciaDao;
import com.romaqui.siadi.entity.Agencia;
import com.romaqui.siadi.service.AgenciaService;
import com.romaqui.siadi.util.FileUploaderUtil;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author nerio
 */
@Service
public class AgenciaServiceImpl extends GenericServiceImpl<Agencia> implements AgenciaService {

    @Autowired
    AgenciaDao empresaDao;

    @Override
    public boolean existeInitParams() {
        int data;
        try {
            data = Integer.parseInt(empresaDao.consultUnique("select count(e) from Agencia e").toString());
        } catch (Exception e) {
            data = 0;
        }
        return data >= 1;
    }

    @Override
    public Agencia registrarAgencia(Agencia p, MultipartFile f, HttpServletRequest request) {
        String upload_folder = "/assets/report/";

        FileUploaderUtil.deleteFile(request, upload_folder + "logo.jpg");
        String archivo = FileUploaderUtil.logoUpload(f, request, upload_folder, "logo.jpg");

        if (archivo != null) {
            p.setUrllogo(upload_folder + archivo);
        }

        //SETEAR INVENTARIOINICIAL A 0 CUANDO SE CREA
        Agencia dato = empresaDao.save(p);
        if (dato == null && archivo != null) {
            FileUploaderUtil.deleteFile(request, upload_folder + archivo);
        }
        return dato;
    }

    @Override
    public Agencia actualizarAgencia(Agencia p, MultipartFile f, HttpServletRequest request) {
        String upload_folder = "/assets/report/";

        if (f != null) {
            FileUploaderUtil.deleteFile(request, upload_folder + "logo.jpg");
            String archivo = FileUploaderUtil.logoUpload(f, request, upload_folder, "logo.jpg");

            if (archivo != null) {
                p.setUrllogo(upload_folder + archivo);
            }

            Agencia dato = empresaDao.update(p);
            if (dato == null && archivo != null) {
                FileUploaderUtil.deleteFile(request, upload_folder + archivo);
            }
            return dato;
        } else {
            Agencia dato = empresaDao.update(p);
            return dato;
        }
    }
}

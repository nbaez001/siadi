package com.romaqui.siadi.service;

import com.romaqui.siadi.entity.Merma;
import java.util.List;

public interface MermaService extends GenericService<Merma> {

    Merma registrarMerma(Merma m);

    int eliminarMerma(Merma m);

    List<Merma> listarMermaFechas(Merma m);

}

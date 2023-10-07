package com.soma.data.Epifitas;

import java.io.Serializable;

/**
 * Created by Sayem on 12/5/2017.
 */

public class EpifitasModel implements Serializable {

    private String etlatitude;
    private String etlongitude;
    private String etfamilia;
    private String etgenero;
    private String etespecie;

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getetlatitude() {
        return etlatitude;
    }

    public void setetlatitude(String etlatitude) {
        this.etlatitude = etlatitude;
    }

    public String getetlongitude() {
        return etlongitude;
    }

    public void setetlongitude(String etlongitude) {
        this.etlongitude = etlongitude;
    }

    public String getetfamilia() {
        return etfamilia;
    }

    public void setetfamilia(String etfamilia) {
        this.etfamilia = etfamilia;
    }

    public String getetgenero() {
        return etgenero;
    }

    public void setetgenero(String etgenero) {
        this.etgenero = etgenero;
    }

    public String getetespecie() {
        return etespecie;
    }

    public void setetespecie(String etespecie) {
        this.etespecie = etespecie;
    }

    

}

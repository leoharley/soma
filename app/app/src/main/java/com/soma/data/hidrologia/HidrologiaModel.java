package com.soma.data.Hidrologia;

import java.io.Serializable;

/**
 * Created by Sayem on 12/5/2017.
 */

public class HidrologiaModel implements Serializable {

    private String etlatitude;
    private String etlongitude;
    private String etdescricao;

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

    public String getetdescricao() {
        return etdescricao;
    }

    public void setetdescricao(String etdescricao) {
        this.etdescricao = etdescricao;
    }

   

}

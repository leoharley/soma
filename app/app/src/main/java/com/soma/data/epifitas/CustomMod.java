package com.soma.data.Epifitas;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomMod extends BaseAdapter {

    private Context context;
    private ArrayList<EpifitasModel> EpifitasModelArrayList;

    public CustomMod(Context context, ArrayList<EpifitasModel> EpifitasModelArrayList) {

        this.context = context;
        this.EpifitasModelArrayList = EpifitasModelArrayList;
    }


    @Override
    public int getCount() {
        return EpifitasModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return EpifitasModelArrayList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;

        if (convertView == null) {
            holder = new ViewHolder();
            LayoutInflater inflater = (LayoutInflater) context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.Epifitas_model_mod, null, true);

            holder.etlatitude = (TextView) convertView.findViewById(R.id.Epifitas_latitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.Epifitas_longitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.Epifitas_familia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.Epifitas_genero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.Epifitas_especie);


            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        System.out.println("PORRA"+ EpifitasModelArrayList.get(position).getetlatitude());
        holder.etlatitude.setText("Latitude: "+ EpifitasModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ EpifitasModelArrayList.get(position).getetlongitude());
        holder.etfamilia.setText("Família: "+ EpifitasModelArrayList.get(position).getetfamilia());
        holder.etgenero.setText("Gênero"+ EpifitasModelArrayList.get(position).getetgenero());
        holder.etespecie.setText("Espécie"+ EpifitasModelArrayList.get(position).getetespecie());


        return convertView;
    }

    private class ViewHolder {

        protected TextView
                etlatitude,
                etlongitude,
                etfamilia,
                etgenero,
                etespecie;

    }

}
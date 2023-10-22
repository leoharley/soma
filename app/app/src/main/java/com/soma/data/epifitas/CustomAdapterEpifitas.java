package com.soma.data.epifitas;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomAdapterEpifitas extends BaseAdapter {

    private Context context;
    private ArrayList<EpifitasModel> epifitasModelArrayList;

    public CustomAdapterEpifitas(Context context, ArrayList<EpifitasModel> epifitasModelArrayList) {

        this.context = context;
        this.epifitasModelArrayList = epifitasModelArrayList;
    }


    @Override
    public int getCount() {
        return epifitasModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return epifitasModelArrayList.get(position);
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
            convertView = inflater.inflate(R.layout.epifitas_model, null, true);

            holder.etlatitude = (TextView) convertView.findViewById(R.id.animais_etlatitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.animais_etlongitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.animais_etfamilia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.animais_etgenero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.animais_etespecie);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etlatitude.setText("Latitude: "+ epifitasModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ epifitasModelArrayList.get(position).getetlongitude());
        holder.etfamilia.setText("Família: "+ epifitasModelArrayList.get(position).getetfamilia());
        holder.etgenero.setText("Gênero"+ epifitasModelArrayList.get(position).getetgenero());
        holder.etespecie.setText("Espécie"+ epifitasModelArrayList.get(position).getetespecie());

        return convertView;
    }

    private class ViewHolder {

        protected TextView etlatitude,
                etlongitude,
                etfamilia,
                etgenero,
                etespecie;
    }

}
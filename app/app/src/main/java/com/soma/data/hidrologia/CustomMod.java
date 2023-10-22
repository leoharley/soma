package com.soma.data.hidrologia;

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
    private ArrayList<HidrologiaModel> hidrologiaModelArrayList;

    public CustomMod(Context context, ArrayList<HidrologiaModel> hidrologiaModelArrayList) {

        this.context = context;
        this.hidrologiaModelArrayList = hidrologiaModelArrayList;
    }


    @Override
    public int getCount() {
        return hidrologiaModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return hidrologiaModelArrayList.get(position);
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
            convertView = inflater.inflate(R.layout.hidrologia_model_mod, null, true);

            holder.etidcontrole = (TextView) convertView.findViewById(R.id.hidrologia_idcontrole);
            holder.etidparcela = (TextView) convertView.findViewById(R.id.hidrologia_idparcela);
            holder.etlatitude = (TextView) convertView.findViewById(R.id.hidrologia_latitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.hidrologia_longitude);
            holder.etdescricao = (TextView) convertView.findViewById(R.id.hidrologia_descricao);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etidcontrole.setText("Cadastro ID: " + hidrologiaModelArrayList.get(position).getetidcontrole());
        holder.etidparcela.setText("Parcela: "+ hidrologiaModelArrayList.get(position).getetidparcela());
        holder.etlatitude.setText("Latitude: "+ hidrologiaModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ hidrologiaModelArrayList.get(position).getetlongitude());
        holder.etdescricao.setText("Descrição: "+ hidrologiaModelArrayList.get(position).getetdescricao());

        return convertView;
    }

    private class ViewHolder {

        protected TextView
                etidcontrole,
                etidparcela,
                etlatitude,
                etlongitude,
                etdescricao;

    }

}
package com.soma.data.animais;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomAdapterAnimais extends BaseAdapter {

    private Context context;
    private ArrayList<AnimaisModel> animaisModelArrayList;

    public CustomAdapterAnimais(Context context, ArrayList<AnimaisModel> animaisModelArrayList) {

        this.context = context;
        this.animaisModelArrayList = animaisModelArrayList;
    }


    @Override
    public int getCount() {
        return animaisModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return animaisModelArrayList.get(position);
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
            convertView = inflater.inflate(R.layout.animais_model, null, true);

            holder.etlatitude = (TextView) convertView.findViewById(R.id.animais_etlatitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.animais_etlongitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.animais_etfamilia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.animais_etgenero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.animais_etespecie);
            holder.ettpobservacao = (TextView) convertView.findViewById(R.id.animais_ettpobservacao);
            holder.etclassificacao = (TextView) convertView.findViewById(R.id.animais_etclassificacao);
            holder.etgrauprotecao = (TextView) convertView.findViewById(R.id.animais_etgrauprotecao);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etlatitude.setText("Latitude: "+ animaisModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ animaisModelArrayList.get(position).getetlongitude());
        holder.etfamilia.setText("Família: "+ animaisModelArrayList.get(position).getetfamilia());
        holder.etgenero.setText("Gênero"+ animaisModelArrayList.get(position).getetgenero());
        holder.etespecie.setText("Espécie"+ animaisModelArrayList.get(position).getetespecie());
        holder.ettpobservacao.setText("Tipo de Observação"+ animaisModelArrayList.get(position).getettpobservacao());
        holder.etclassificacao.setText("Classificação"+ animaisModelArrayList.get(position).getetclassificacao());
        holder.etgrauprotecao.setText("Grau de Proteção"+ animaisModelArrayList.get(position).getetgrauprotecao());

        return convertView;
    }

    private class ViewHolder {

        protected TextView etlatitude,
                etlongitude,
                etfamilia,
                etgenero,
                etespecie,
                ettpobservacao,
                etclassificacao,
                etgrauprotecao;
    }

}
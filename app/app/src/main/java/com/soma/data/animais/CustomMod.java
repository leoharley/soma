package com.soma.data.animais;

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
    private ArrayList<AnimaisModel> animaisModelArrayList;

    public CustomMod(Context context, ArrayList<AnimaisModel> animaisModelArrayList) {

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
            convertView = inflater.inflate(R.layout.animais_model_mod, null, true);

            holder.etidcontrole = (TextView) convertView.findViewById(R.id.animais_idcontrole);
            holder.etidparcela = (TextView) convertView.findViewById(R.id.animais_idparcela);
            holder.etlatitude = (TextView) convertView.findViewById(R.id.animais_latitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.animais_longitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.animais_familia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.animais_genero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.animais_especie);
            holder.ettpobservacao = (TextView) convertView.findViewById(R.id.animais_tpobservacao);
            holder.etclassificacao = (TextView) convertView.findViewById(R.id.animais_classificacao);
            holder.etgrauprotecao = (TextView) convertView.findViewById(R.id.animais_graudeprotecao);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etidcontrole.setText("Cadastro ID: " + animaisModelArrayList.get(position).getetidcontrole());
        holder.etidparcela.setText("Parcela: "+ animaisModelArrayList.get(position).getetidparcela());
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

        protected TextView
                etidcontrole,
                etidparcela,
                etlatitude,
                etlongitude,
                etfamilia,
                etgenero,
                etespecie,
                ettpobservacao,
                etclassificacao,
                etgrauprotecao;

    }

}
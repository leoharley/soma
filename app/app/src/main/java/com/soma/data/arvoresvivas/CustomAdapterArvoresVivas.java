package com.soma.data.arvoresvivas;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomAdapterArvoresVivas extends BaseAdapter {

    private Context context;
    private ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList;

    public CustomAdapterArvoresVivas(Context context, ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList) {

        this.context = context;
        this.arvoresVivasModelArrayList = arvoresVivasModelArrayList;
    }


    @Override
    public int getCount() {
        return arvoresVivasModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return arvoresVivasModelArrayList.get(position);
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
            convertView = inflater.inflate(R.layout.arvores_vivas_model, null, true);

            holder.etlatitude = (TextView) convertView.findViewById(R.id.arvoresvivas_etlatitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.arvoresvivas_etlongitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.arvoresvivas_etfamilia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.arvoresvivas_etgenero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.arvoresvivas_etespecie);
            holder.etbiomassa = (TextView) convertView.findViewById(R.id.arvoresvivas_etbiomassa);
            holder.etidentificado = (TextView) convertView.findViewById(R.id.arvoresvivas_etidentificado);
            holder.etgrauprotecao = (TextView) convertView.findViewById(R.id.arvoresvivas_etgrauprotecao);
            holder.etcircunferencia = (TextView) convertView.findViewById(R.id.arvoresvivas_etcircunferencia);
            holder.etaltura = (TextView) convertView.findViewById(R.id.arvoresvivas_etaltura);
            holder.etalturatotal = (TextView) convertView.findViewById(R.id.arvoresvivas_etalturatotal);
            holder.etalturafuste = (TextView) convertView.findViewById(R.id.arvoresvivas_etalturafuste);
            holder.etalturacopa = (TextView) convertView.findViewById(R.id.arvoresvivas_etalturacopa);
            holder.etisolada = (TextView) convertView.findViewById(R.id.arvoresvivas_etisolada);
            holder.etfloracaofrutificacao = (TextView) convertView.findViewById(R.id.arvoresvivas_etfloracaofrutificacao);
         //   holder.etdescricao = (TextView) convertView.findViewById(R.id.arvoresvivas_etdescricao);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etlatitude.setText("Latitude: "+ arvoresVivasModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ arvoresVivasModelArrayList.get(position).getetlongitude());
        holder.etfamilia.setText("Família: "+ arvoresVivasModelArrayList.get(position).getetfamilia());
        holder.etgenero.setText("Gênero"+ arvoresVivasModelArrayList.get(position).getetgenero());
        holder.etespecie.setText("Espécie"+ arvoresVivasModelArrayList.get(position).getetespecie());
        holder.etbiomassa.setText("Biomassa"+ arvoresVivasModelArrayList.get(position).getetbiomassa());
        holder.etidentificado.setText("Identificado"+ arvoresVivasModelArrayList.get(position).getetidentificado());
        holder.etgrauprotecao.setText("Grau de Proteção"+ arvoresVivasModelArrayList.get(position).getetgrauprotecao());
        holder.etcircunferencia.setText("Circunferência"+ arvoresVivasModelArrayList.get(position).getetcircunferencia());
        holder.etaltura.setText("Altura"+ arvoresVivasModelArrayList.get(position).getetaltura());
        holder.etalturatotal.setText("Altura Total"+ arvoresVivasModelArrayList.get(position).getetalturatotal());
        holder.etalturafuste.setText("Altura Fuste"+ arvoresVivasModelArrayList.get(position).getetalturafuste());
        holder.etalturacopa.setText("Altura da Copa"+ arvoresVivasModelArrayList.get(position).getetalturacopa());
        holder.etisolada.setText("Isolada"+ arvoresVivasModelArrayList.get(position).getetisolada());
        holder.etfloracaofrutificacao.setText("Floração/Frutificação"+ arvoresVivasModelArrayList.get(position).getetfloracaofrutificacao());
     //   holder.etdescricao.setText("Descrição"+ arvoresVivasModelArrayList.get(position).getetdescricao());

        return convertView;
    }

    private class ViewHolder {

        protected TextView etlatitude,
                etlongitude,
                etfamilia,
                etgenero,
                etespecie,
                etbiomassa,
                etidentificado,
                etgrauprotecao,
                etcircunferencia,
                etaltura,
                etalturatotal,
                etalturafuste,
                etalturacopa,
                etisolada,
                etfloracaofrutificacao,
                etdescricao;
    }

}
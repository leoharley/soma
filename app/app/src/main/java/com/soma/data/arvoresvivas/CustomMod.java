package com.soma.data.arvoresvivas;

import static android.text.Html.fromHtml;

import android.content.Context;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Spinner;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomMod extends BaseAdapter {

    private Context context;
    private ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList;

    public CustomMod(Context context, ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList) {

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
            convertView = inflater.inflate(R.layout.arvores_vivas_model_mod, null, true);

            holder.etidcontrole = (TextView) convertView.findViewById(R.id.arvoresvivas_idcontrole);
            holder.etidparcela = (TextView) convertView.findViewById(R.id.arvoresvivas_idparcela);
            holder.etlatitude = (TextView) convertView.findViewById(R.id.arvoresvivas_latitude);
            holder.etlatitude = (TextView) convertView.findViewById(R.id.arvoresvivas_latitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.arvoresvivas_longitude);
            holder.etfamilia = (TextView) convertView.findViewById(R.id.arvoresvivas_familia);
            holder.etgenero = (TextView) convertView.findViewById(R.id.arvoresvivas_genero);
            holder.etespecie = (TextView) convertView.findViewById(R.id.arvoresvivas_especie);
            holder.etbiomassa = (TextView) convertView.findViewById(R.id.arvoresvivas_biomassa);
            holder.etidentificado = (TextView) convertView.findViewById(R.id.arvoresvivas_identificado);
            holder.etgrauprotecao = (TextView) convertView.findViewById(R.id.arvoresvivas_grauprotecao);
            holder.etcircunferencia = (TextView) convertView.findViewById(R.id.arvoresvivas_circunferencia);
            holder.etaltura = (TextView) convertView.findViewById(R.id.arvoresvivas_altura);
            holder.etalturatotal = (TextView) convertView.findViewById(R.id.arvoresvivas_alturatotal);
            holder.etalturafuste = (TextView) convertView.findViewById(R.id.arvoresvivas_alturafuste);
            holder.etalturacopa = (TextView) convertView.findViewById(R.id.arvoresvivas_alturacopa);
            holder.etisolada = (TextView) convertView.findViewById(R.id.arvoresvivas_isolada);
            holder.etfloracaofrutificacao = (TextView) convertView.findViewById(R.id.arvoresvivas_floracaofrutificacao);
            holder.etdescricao = (TextView) convertView.findViewById(R.id.arvoresvivas_etdescricao);
            holder.etestagioregeneracao = (TextView) convertView.findViewById(R.id.arvoresvivas_etestagioregeneracao);
            holder.etgrauepifitismo = (TextView) convertView.findViewById(R.id.arvoresvivas_etgrauepifitismo);

            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etidcontrole.setText("Cadastro ID: " + arvoresVivasModelArrayList.get(position).getetidcontrole());
        holder.etidparcela.setText("Parcela: "+ arvoresVivasModelArrayList.get(position).getetidparcela());
        holder.etlatitude.setText("Latitude: "+ arvoresVivasModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ arvoresVivasModelArrayList.get(position).getetlongitude());
        holder.etfamilia.setText("Família: "+ arvoresVivasModelArrayList.get(position).getetfamilia());
        holder.etgenero.setText("Gênero: "+ arvoresVivasModelArrayList.get(position).getetgenero());
        holder.etespecie.setText("Espécie: "+ arvoresVivasModelArrayList.get(position).getetespecie());
        holder.etbiomassa.setText("Biomassa: "+ arvoresVivasModelArrayList.get(position).getetbiomassa());
        holder.etidentificado.setText("Identificado: "+ arvoresVivasModelArrayList.get(position).getetidentificado());
        holder.etgrauprotecao.setText("Grau de Proteção: "+ arvoresVivasModelArrayList.get(position).getetgrauprotecao());
        holder.etcircunferencia.setText("Circunferência: "+ arvoresVivasModelArrayList.get(position).getetcircunferencia());
        holder.etaltura.setText("Altura: "+ arvoresVivasModelArrayList.get(position).getetaltura());
        holder.etalturatotal.setText("Altura Total: "+ arvoresVivasModelArrayList.get(position).getetalturatotal());
        holder.etalturafuste.setText("Altura Fuste: "+ arvoresVivasModelArrayList.get(position).getetalturafuste());
        holder.etalturacopa.setText("Altura da Copa: "+ arvoresVivasModelArrayList.get(position).getetalturacopa());
        holder.etisolada.setText("Isolada: "+ arvoresVivasModelArrayList.get(position).getetisolada());
        holder.etfloracaofrutificacao.setText("Floração/Frutificação: "+ arvoresVivasModelArrayList.get(position).getetfloracaofrutificacao());
        holder.etdescricao.setText("Descrição"+ arvoresVivasModelArrayList.get(position).getetdescricao());
        holder.etestagioregeneracao.setText("Estágio Regeneração"+ arvoresVivasModelArrayList.get(position).getetestagioregeneracao());
        holder.etgrauepifitismo.setText("Grau Epifitismo"+ arvoresVivasModelArrayList.get(position).getetgrauepifitismo());

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
                etdescricao,
                etestagioregeneracao,
                etgrauepifitismo;

    }

}
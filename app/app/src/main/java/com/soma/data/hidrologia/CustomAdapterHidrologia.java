package com.soma.data.Hidrologia;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;


public class CustomAdapterHidrologia extends BaseAdapter {

    private Context context;
    private ArrayList<HidrologiaModel> HidrologiaModelArrayList;

    public CustomAdapterHidrologia(Context context, ArrayList<HidrologiaModel> HidrologiaModelArrayList) {

        this.context = context;
        this.HidrologiaModelArrayList = HidrologiaModelArrayList;
    }


    @Override
    public int getCount() {
        return HidrologiaModelArrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return HidrologiaModelArrayList.get(position);
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
            convertView = inflater.inflate(R.layout.Hidrologia_model, null, true);

            holder.etlatitude = (TextView) convertView.findViewById(R.id.Hidrologia_etlatitude);
            holder.etlongitude = (TextView) convertView.findViewById(R.id.Hidrologia_etlongitude);
            holder.etdescricao = (TextView) convertView.findViewById(R.id.Hidrologia_etdescricao);




            convertView.setTag(holder);
        }else {
            // the getTag returns the viewHolder object set as a tag to the view
            holder = (ViewHolder)convertView.getTag();
        }

        holder.etlatitude.setText("Latitude: "+ HidrologiaModelArrayList.get(position).getetlatitude());
        holder.etlongitude.setText("Longitude: "+ HidrologiaModelArrayList.get(position).getetlongitude());
        holder.etdescricao.setText("Família: "+ HidrologiaModelArrayList.get(position).getetdescricao());


        return convertView;
    }

    private class ViewHolder {

        protected TextView etlatitude,
                etlongitude,
                etdescricao;

    }

}
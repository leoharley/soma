package com.soma.data.epifitas;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

public class ModEpifitas extends AppCompatActivity {

    private ListView listView;
    private ArrayList<EpifitasModel> EpifitasModelArrayList;
    private CustomMod customMod;
    private DatabaseHelperEpifitas databaseHelperEpifitas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.epifitas_activity_mod);

        listView = (ListView) findViewById(R.id.Epifitas_lvi);

        databaseHelperEpifitas = new DatabaseHelperEpifitas(this);

        EpifitasModelArrayList = databaseHelperEpifitas.getAllEpifitas();

        customMod = new CustomMod(this, EpifitasModelArrayList);
        listView.setAdapter(customMod);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(ModEpifitas.this, ModifyEpifitasActivity.class);
                intent.putExtra("Epifitas", EpifitasModelArrayList.get(position));
                startActivity(intent);
            }
        });
    }
}

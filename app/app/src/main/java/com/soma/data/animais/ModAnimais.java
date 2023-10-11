package com.soma.data.animais;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

public class ModAnimais extends AppCompatActivity {

    private ListView listView;
    private ArrayList<AnimaisModel> AnimaisModelArrayList;
    private CustomMod customMod;
    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.animais_activity_mod);

        listView = (ListView) findViewById(R.id.Animais_lvi);

        databaseHelperAnimais = new DatabaseHelperAnimais(this);

        AnimaisModelArrayList = databaseHelperAnimais.getAllAnimais();

        customMod = new CustomMod(this, AnimaisModelArrayList);
        listView.setAdapter(customMod);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(ModAnimais.this, ModifyAnimaisActivity.class);
                intent.putExtra("Animais", AnimaisModelArrayList.get(position));
                startActivity(intent);
            }
        });
    }
}

package com.soma.data.arvoresvivas;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

public class ModArvoresVivas extends AppCompatActivity {

    private ListView listView;
    private ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList;
    private CustomMod customMod;
    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.arvores_vivas_activity_mod);

        listView = (ListView) findViewById(R.id.arvoresvivas_lvi);

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(this);

        arvoresVivasModelArrayList = databaseHelperArvoresVivas.getAllArvoresVivas();

        customMod = new CustomMod(this, arvoresVivasModelArrayList);
        listView.setAdapter(customMod);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(ModArvoresVivas.this, ModifyArvoresVivasActivity.class);
                intent.putExtra("arvoresvivas", arvoresVivasModelArrayList.get(position));
                startActivity(intent);
            }
        });
    }
}

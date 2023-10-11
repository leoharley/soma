package com.soma.data.hidrologia;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

public class ModHidrologia extends AppCompatActivity {

    private ListView listView;
    private ArrayList<HidrologiaModel> HidrologiaModelArrayList;
    private CustomMod customMod;
    private DatabaseHelperHidrologia databaseHelperHidrologia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hidrologia_activity_mod);

        listView = (ListView) findViewById(R.id.Hidrologia_lvi);

        databaseHelperHidrologia = new DatabaseHelperHidrologia(this);

        HidrologiaModelArrayList = databaseHelperHidrologia.getAllHidrologia();

        customMod = new CustomMod(this, HidrologiaModelArrayList);
        listView.setAdapter(customMod);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(ModHidrologia.this, ModifyHidrologiaActivity.class);
                intent.putExtra("Hidrologia", HidrologiaModelArrayList.get(position));
                startActivity(intent);
            }
        });
    }
}

package com.soma.data.epifitas;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    Button addTeachers;
    Button modTeachers;

    private ListView listView;
    private ArrayList<EpifitasModel> EpifitasModelArrayList;
    private CustomAdapterEpifitas customAdapterTeacher;
    private DatabaseHelperEpifitas databaseHelperEpifitas;

    public  void addTeachersActivity(){
        addTeachers= (Button)findViewById(R.id.btn_add_teacher);
        addTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent addTeachersr = new Intent(MainActivity.this, AddRegistroEpifitas.class);
                startActivity(addTeachersr);

            }
        });
    }

    public  void modTeachersActivity(){
        modTeachers= (Button)findViewById(R.id.btn_teacher_modify);
        modTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent modTeachersr = new Intent(MainActivity.this, ModEpifitas.class);
                startActivity(modTeachersr);

            }
        });
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.epifitas_activity_main);

        addTeachersActivity();
        modTeachersActivity();

        listView = (ListView) findViewById(R.id.epifitas_lv);

        databaseHelperEpifitas = new DatabaseHelperEpifitas(this);

        EpifitasModelArrayList = databaseHelperEpifitas.getAllEpifitas();

        customAdapterTeacher = new CustomAdapterEpifitas(this, EpifitasModelArrayList);
        listView.setAdapter(customAdapterTeacher);
    }
}

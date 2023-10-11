package com.soma.data.animais;

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
    private ArrayList<AnimaisModel> AnimaisModelArrayList;
    private CustomAdapterAnimais customAdapterTeacher;
    private DatabaseHelperAnimais databaseHelperAnimais;

    public  void addTeachersActivity(){
        addTeachers= (Button)findViewById(R.id.btn_add_teacher);
        addTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent addTeachersr = new Intent(MainActivity.this, AddRegistroAnimais.class);
                startActivity(addTeachersr);

            }
        });
    }

    public  void modTeachersActivity(){
        modTeachers= (Button)findViewById(R.id.btn_teacher_modify);
        modTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent modTeachersr = new Intent(MainActivity.this, ModAnimais.class);
                startActivity(modTeachersr);

            }
        });
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.animais_activity_main);

        addTeachersActivity();
        modTeachersActivity();

        listView = (ListView) findViewById(R.id.teachers_lv);

        databaseHelperAnimais = new DatabaseHelperAnimais(this);

        AnimaisModelArrayList = databaseHelperAnimais.getAllAnimais();

        customAdapterTeacher = new CustomAdapterAnimais(this, AnimaisModelArrayList);
        listView.setAdapter(customAdapterTeacher);
    }
}

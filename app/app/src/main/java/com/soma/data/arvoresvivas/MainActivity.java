package com.soma.data.arvoresvivas;

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
    private ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList;
    private CustomAdapterArvoresVivas customAdapterTeacher;
    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;

    public  void addTeachersActivity(){
        addTeachers= (Button)findViewById(R.id.btn_add_teacher);
        addTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent addTeachersr = new Intent(MainActivity.this, AddRegistroArvoresVivas.class);
                startActivity(addTeachersr);

            }
        });
    }

    public  void modTeachersActivity(){
        modTeachers= (Button)findViewById(R.id.btn_teacher_modify);
        modTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent modTeachersr = new Intent(MainActivity.this, ModArvoresVivas.class);
                startActivity(modTeachersr);

            }
        });
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.arvores_vivas_activity_main);

        addTeachersActivity();
        modTeachersActivity();

        listView = (ListView) findViewById(R.id.teachers_lv);

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(this);

        arvoresVivasModelArrayList = databaseHelperArvoresVivas.getAllArvoresVivas();

        customAdapterTeacher = new CustomAdapterArvoresVivas(this, arvoresVivasModelArrayList);
        listView.setAdapter(customAdapterTeacher);
    }

}

package com.soma.data.hidrologia;

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
    private ArrayList<HidrologiaModel> HidrologiaModelArrayList;
    private CustomAdapterHidrologia customAdapterTeacher;
    private DatabaseHelperHidrologia databaseHelperHidrologia;

    public  void addTeachersActivity(){
        addTeachers= (Button)findViewById(R.id.btn_add_teacher);
        addTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent addTeachersr = new Intent(MainActivity.this, AddRegistroHidrologia.class);
                startActivity(addTeachersr);

            }
        });
    }

    public  void modTeachersActivity(){
        modTeachers= (Button)findViewById(R.id.btn_teacher_modify);
        modTeachers.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent modTeachersr = new Intent(MainActivity.this, ModHidrologia.class);
                startActivity(modTeachersr);

            }
        });
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hidrologia_activity_main);

        addTeachersActivity();
        modTeachersActivity();

        listView = (ListView) findViewById(R.id.teachers_lv);

        databaseHelperHidrologia = new DatabaseHelperHidrologia(this);

        HidrologiaModelArrayList = databaseHelperHidrologia.getAllHidrologia();

        customAdapterTeacher = new CustomAdapterHidrologia(this, HidrologiaModelArrayList);
        listView.setAdapter(customAdapterTeacher);
    }
}

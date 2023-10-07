package com.soma.data.Epifitas;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.R;

public class AddRegistroEpifitas extends AppCompatActivity {

    private Button btnSalvar;
    private EditText etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie;


    private DatabaseHelperEpifitas databaseHelperEpifitas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.Epifitas_activity_add_registro);

        databaseHelperEpifitas = new DatabaseHelperEpifitas(this);

        btnSalvar = (Button) findViewById(R.id.btnsalvar);
        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etfamilia = (EditText) findViewById(R.id.et_familia);
        etgenero = (EditText) findViewById(R.id.et_genero);
        etespecie = (EditText) findViewById(R.id.et_especie);


        btnSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

              /* String name = etlatitude.getText().toString();
                if (TextUtils.isEmpty(name)){
                    etlatitude.setError("Enter Name");
                    etlatitude.requestFocus();
                    return;
                } */ //CAMPOS OBRIGATÓRIOS

                databaseHelperEpifitas.addEpifitasDetail(
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etfamilia.getText().toString(),
                        etgenero.getText().toString(),
                        etespecie.getText().toString(),

              /*  etcourse.setText("");
                etphone.setText("");*/

                Toast.makeText(AddRegistroEpifitas.this, "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddRegistroEpifitas.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}
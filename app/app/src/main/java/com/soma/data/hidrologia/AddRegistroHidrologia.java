package com.soma.data.Hidrologia;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.R;

public class AddRegistroHidrologia extends AppCompatActivity {

    private Button btnSalvar;
    private EditText etlatitude,
            etlongitude,
			etdescricao;

    private DatabaseHelperHidrologia databaseHelperHidrologia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.Hidrologia_activity_add_registro);

        databaseHelperHidrologia = new DatabaseHelperHidrologia(this);

        btnSalvar = (Button) findViewById(R.id.btnsalvar);
        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etdescricao = (EditText) findViewById(R.id.et_descricao);


        btnSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

              /* String name = etlatitude.getText().toString();
                if (TextUtils.isEmpty(name)){
                    etlatitude.setError("Enter Name");
                    etlatitude.requestFocus();
                    return;
                } */ //CAMPOS OBRIGATÓRIOS

                databaseHelperHidrologia.addHidrologiaDetail(
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etdescricao.getText().toString(),

              /*  etcourse.setText("");
                etphone.setText("");*/

                Toast.makeText(AddRegistroHidrologia.this, "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddRegistroHidrologia.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}
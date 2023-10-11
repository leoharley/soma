package com.soma.data.animais;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.R;

public class AddRegistroAnimais extends AppCompatActivity {

    private Button btnSalvar;
    private EditText etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie,
			ettipoobservacao,
			etclassificacao,
			etgrauprotecao;

    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.animais_activity_add_registro);

        databaseHelperAnimais = new DatabaseHelperAnimais(this);

        btnSalvar = (Button) findViewById(R.id.btnsalvar);
        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etfamilia = (EditText) findViewById(R.id.et_familia);
        etgenero = (EditText) findViewById(R.id.et_genero);
        etespecie = (EditText) findViewById(R.id.et_especie);		
        ettipoobservacao = (EditText) findViewById(R.id.et_tipo_observacao);
        etclassificacao = (EditText) findViewById(R.id.et_classificacao);
		etgrauprotecao = (EditText) findViewById(R.id.et_grau_protecao);
        

        btnSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

              /* String name = etlatitude.getText().toString();
                if (TextUtils.isEmpty(name)){
                    etlatitude.setError("Enter Name");
                    etlatitude.requestFocus();
                    return;
                } */ //CAMPOS OBRIGATÓRIOS

                databaseHelperAnimais.addAnimaisDetail(
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etfamilia.getText().toString(),
                        etgenero.getText().toString(),
                        etespecie.getText().toString(),						
                        ettipoobservacao.getText().toString(),
                        etclassificacao.getText().toString(),
                        etgrauprotecao.getText().toString());

              /*  etcourse.setText("");
                etphone.setText("");*/

                Toast.makeText(AddRegistroAnimais.this, "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddRegistroAnimais.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}
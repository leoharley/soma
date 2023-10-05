package com.soma.data.arvoresvivas;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.R;

public class AddRegistroArvoresVivas extends AppCompatActivity {

    private Button btnSalvar;
    private EditText etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie,
            etbiomassa,
            etidentificado,
            etgrauprotecao,
            etcircunferencia,
            etaltura,
            etalturatotal,
            etalturafuste,
            etalturacopa,
            etisolada,
            etfloracaofrutificacao;

    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.arvores_vivas_activity_add_registro);

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(this);

        btnSalvar = (Button) findViewById(R.id.btnsalvar);
        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etfamilia = (EditText) findViewById(R.id.et_familia);
        etgenero = (EditText) findViewById(R.id.et_genero);
        etespecie = (EditText) findViewById(R.id.et_especie);
        etbiomassa = (EditText) findViewById(R.id.et_biomassa);
        etidentificado = (EditText) findViewById(R.id.et_identificado);
        etgrauprotecao = (EditText) findViewById(R.id.et_grau_protecao);
        etcircunferencia = (EditText) findViewById(R.id.et_circunferencia);
        etaltura = (EditText) findViewById(R.id.et_altura);
        etalturatotal = (EditText) findViewById(R.id.et_altura_total);
        etalturafuste = (EditText) findViewById(R.id.et_altura_fuste);
        etalturacopa = (EditText) findViewById(R.id.et_altura_copa);
        etisolada = (EditText) findViewById(R.id.et_isolada);
        etfloracaofrutificacao = (EditText) findViewById(R.id.et_floracao_frutificacao);

        btnSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

              /* String name = etlatitude.getText().toString();
                if (TextUtils.isEmpty(name)){
                    etlatitude.setError("Enter Name");
                    etlatitude.requestFocus();
                    return;
                } */ //CAMPOS OBRIGATÓRIOS

                databaseHelperArvoresVivas.addArvoresVivasDetail(
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etfamilia.getText().toString(),
                        etgenero.getText().toString(),
                        etespecie.getText().toString(),
                        etbiomassa.getText().toString(),
                        etidentificado.getText().toString(),
                        etgrauprotecao.getText().toString(),
                        etcircunferencia.getText().toString(),
                        etaltura.getText().toString(),
                        etalturatotal.getText().toString(),
                        etalturafuste.getText().toString(),
                        etalturacopa.getText().toString(),
                        etisolada.getText().toString(),
                        etfloracaofrutificacao.getText().toString());
              /*  etcourse.setText("");
                etphone.setText("");*/

                Toast.makeText(AddRegistroArvoresVivas.this, "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(AddRegistroArvoresVivas.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}
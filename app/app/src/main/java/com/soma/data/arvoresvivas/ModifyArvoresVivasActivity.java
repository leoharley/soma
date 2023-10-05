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

public class ModifyArvoresVivasActivity extends AppCompatActivity {

    private ArvoresVivasModel arvoresVivasModel;
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
    private Button btnupdate, btndelete;
    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.arvores_vivas_activity_modify);

        Intent intent = getIntent();
        arvoresVivasModel = (ArvoresVivasModel) intent.getSerializableExtra("arvoresvivas");

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(this);

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
        btndelete = (Button) findViewById(R.id.btndelete);
        btnupdate = (Button) findViewById(R.id.btnupdate);

        etlatitude.setText(arvoresVivasModel.getetlatitude());
        etlongitude.setText(arvoresVivasModel.getetlongitude());
        etfamilia.setText(arvoresVivasModel.getetfamilia());
        etgenero.setText(arvoresVivasModel.getetgenero());
        etespecie.setText(arvoresVivasModel.getetespecie());
        etbiomassa.setText(arvoresVivasModel.getetbiomassa());
        etidentificado.setText(arvoresVivasModel.getetidentificado());
        etgrauprotecao.setText(arvoresVivasModel.getetgrauprotecao());
        etcircunferencia.setText(arvoresVivasModel.getetcircunferencia());
        etaltura.setText(arvoresVivasModel.getetaltura());
        etalturatotal.setText(arvoresVivasModel.getetalturatotal());
        etalturafuste.setText(arvoresVivasModel.getetalturafuste());
        etalturacopa.setText(arvoresVivasModel.getetalturacopa());
        etfloracaofrutificacao.setText(arvoresVivasModel.getetfloracaofrutificacao());

        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperArvoresVivas.updateArvoresVivas(arvoresVivasModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),etfamilia.getText().toString(),
                        etgenero.getText().toString(), etespecie.getText().toString(), etbiomassa.getText().toString(), etidentificado.getText().toString(),
                        etgrauprotecao.getText().toString(), etcircunferencia.getText().toString(), etaltura.getText().toString(), etalturatotal.getText().toString(),
                        etalturafuste.getText().toString(), etalturacopa.getText().toString(), etisolada.getText().toString(), etfloracaofrutificacao.getText().toString());
                Toast.makeText(ModifyArvoresVivasActivity.this, "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyArvoresVivasActivity.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

        btndelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperArvoresVivas.deleteUSer(arvoresVivasModel.getId());
                Toast.makeText(ModifyArvoresVivasActivity.this, "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyArvoresVivasActivity.this,MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}

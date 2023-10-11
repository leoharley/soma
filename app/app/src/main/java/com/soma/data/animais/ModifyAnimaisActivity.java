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

public class ModifyAnimaisActivity extends AppCompatActivity {

    private AnimaisModel AnimaisModel;
    private EditText etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie,
            ettipoobservacao,
            etclassificacao,
            etgrauprotecao;

    private Button btnupdate, btndelete;
    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.animais_activity_modify);

        Intent intent = getIntent();
        AnimaisModel = (AnimaisModel) intent.getSerializableExtra("Animais");

        databaseHelperAnimais = new DatabaseHelperAnimais(this);

        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etfamilia = (EditText) findViewById(R.id.et_familia);
        etgenero = (EditText) findViewById(R.id.et_genero);
        etespecie = (EditText) findViewById(R.id.et_especie);		
        ettipoobservacao = (EditText) findViewById(R.id.et_tipo_observacao);
        etclassificacao = (EditText) findViewById(R.id.et_classificacao);
        etgrauprotecao = (EditText) findViewById(R.id.et_grau_protecao);		
        btndelete = (Button) findViewById(R.id.btndelete);
        btnupdate = (Button) findViewById(R.id.btnupdate);

        etlatitude.setText(AnimaisModel.getetlatitude());
        etlongitude.setText(AnimaisModel.getetlongitude());
        etfamilia.setText(AnimaisModel.getetfamilia());
        etgenero.setText(AnimaisModel.getetgenero());
        etespecie.setText(AnimaisModel.getetespecie());
        ettipoobservacao.setText(AnimaisModel.getettipoobservacao());
        etclassificacao.setText(AnimaisModel.getetclassificacao());
        etgrauprotecao.setText(AnimaisModel.getetgrauprotecao());


        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperAnimais.updateAnimais(AnimaisModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),etfamilia.getText().toString(),
                        etgenero.getText().toString(), etespecie.getText().toString(), ettipoobservacao.getText().toString(), etclassificacao.getText().toString(),
                        etgrauprotecao.getText().toString());
                Toast.makeText(ModifyAnimaisActivity.this, "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyAnimaisActivity.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

        btndelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperAnimais.deleteUSer(AnimaisModel.getId());
                Toast.makeText(ModifyAnimaisActivity.this, "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyAnimaisActivity.this,MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}

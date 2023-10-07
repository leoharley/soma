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

public class ModifyEpifitasActivity extends AppCompatActivity {

    private EpifitasModel EpifitasModel;
    private EditText etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie;

    private Button btnupdate, btndelete;
    private DatabaseHelperEpifitas databaseHelperEpifitas;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.Epifitas_activity_modify);

        Intent intent = getIntent();
        EpifitasModel = (EpifitasModel) intent.getSerializableExtra("Epifitas");

        databaseHelperEpifitas = new DatabaseHelperEpifitas(this);

        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etfamilia = (EditText) findViewById(R.id.et_familia);
        etgenero = (EditText) findViewById(R.id.et_genero);
        etespecie = (EditText) findViewById(R.id.et_especie);

        btndelete = (Button) findViewById(R.id.btndelete);
        btnupdate = (Button) findViewById(R.id.btnupdate);

        etlatitude.setText(EpifitasModel.getetlatitude());
        etlongitude.setText(EpifitasModel.getetlongitude());
        etfamilia.setText(EpifitasModel.getetfamilia());
        etgenero.setText(EpifitasModel.getetgenero());
        etespecie.setText(EpifitasModel.getetespecie());


        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperEpifitas.updateEpifitas(EpifitasModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),etfamilia.getText().toString(),
                        etgenero.getText().toString(), etespecie.getText().toString());
                Toast.makeText(ModifyEpifitasActivity.this, "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyEpifitasActivity.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

        btndelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperEpifitas.deleteUSer(EpifitasModel.getId());
                Toast.makeText(ModifyEpifitasActivity.this, "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyEpifitasActivity.this,MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}

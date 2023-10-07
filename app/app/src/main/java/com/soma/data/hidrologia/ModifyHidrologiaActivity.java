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

public class ModifyHidrologiaActivity extends AppCompatActivity {

    private HidrologiaModel HidrologiaModel;
    private EditText etlatitude,
            etlongitude,
            etdescricao;

    private Button btnupdate, btndelete;
    private DatabaseHelperHidrologia databaseHelperHidrologia;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.Hidrologia_activity_modify);

        Intent intent = getIntent();
        HidrologiaModel = (HidrologiaModel) intent.getSerializableExtra("Hidrologia");

        databaseHelperHidrologia = new DatabaseHelperHidrologia(this);

        etlatitude = (EditText) findViewById(R.id.et_latitude);
        etlongitude = (EditText) findViewById(R.id.et_longitude);
        etdescricao = (EditText) findViewById(R.id.et_descricao);

        btndelete = (Button) findViewById(R.id.btndelete);
        btnupdate = (Button) findViewById(R.id.btnupdate);

        etlatitude.setText(HidrologiaModel.getetlatitude());
        etlongitude.setText(HidrologiaModel.getetlongitude());
        etdescricao.setText(HidrologiaModel.getetdescricao());


        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperHidrologia.updateHidrologia(HidrologiaModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),etdescricao.getText().toString());
                Toast.makeText(ModifyHidrologiaActivity.this, "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyHidrologiaActivity.this, MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

        btndelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperHidrologia.deleteUSer(HidrologiaModel.getId());
                Toast.makeText(ModifyHidrologiaActivity.this, "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(ModifyHidrologiaActivity.this,MainActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}

package com.soma.utils.galeria;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.androidigniter.loginandregistration.R;

import java.io.File;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    RecyclerView recyclerView;
    ArrayList<Image> arrayList = new ArrayList<>();
    String idcontrole;
    String dscategoria;
    TextView semimagensaviso;
    private final ActivityResultLauncher<String> activityResultLauncher = registerForActivityResult(new ActivityResultContracts.RequestPermission(),
            result -> {
                if (result) {
                    getImages();
                }
            });
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.galeria_activity_main);
        recyclerView = findViewById(R.id.recycler);
        recyclerView.setLayoutManager(new LinearLayoutManager(MainActivity.this));
        recyclerView.setHasFixedSize(true);
        semimagensaviso = findViewById(R.id.aviso_sem_imagens);

        Intent myIntent = getIntent();
        idcontrole = myIntent.getStringExtra("idcontrole");
        dscategoria = myIntent.getStringExtra("dscategoria");

        if (ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            activityResultLauncher.launch(Manifest.permission.WRITE_EXTERNAL_STORAGE);
        } else if (ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            activityResultLauncher.launch(Manifest.permission.READ_EXTERNAL_STORAGE);
        } else {
            getImages();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        getImages();
    }

    private void getImages(){
        arrayList.clear();
       // String filePath = "/storage/emulated/0/inshot";
       // File file = new File(filePath);
        File file = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES) + File.separator + "images/" + dscategoria);
        if (! file.exists()){
            file.mkdir();
            // If you require it to make the entire directory path including parents,
            // use directory.mkdirs(); here instead.
        }

        File[] files = file.listFiles();
        Boolean achou = false;
        if (files != null) {
            for (File file1 : files) {
                if ((file1.getPath().endsWith(".png") || file1.getPath().endsWith(".jpg")) && file1.getName().contains(idcontrole)) {
                    arrayList.add(new Image(file1.getName(), file1.getPath(), file1.length()));
                    achou = true;
                }
            }
        }

        if (!achou) {
            semimagensaviso.setText("SEM IMAGENS");
        }

        ImageAdapter adapter = new ImageAdapter(MainActivity.this, arrayList);
        recyclerView.setAdapter(adapter);
        adapter.setOnItemClickListener((view, path) -> startActivity(new Intent(MainActivity.this, ImageViewerActivity.class).putExtra("image", path)));
    }
}
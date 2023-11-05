package com.androidigniter.loginandregistration;

import static android.text.TextUtils.indexOf;
import static android.text.TextUtils.substring;
import static com.androidigniter.loginandregistration.LoginActivity.isRecursionEnable;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Typeface;
import android.location.LocationManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.core.content.ContextCompat;

import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.ResultReceiver;
import android.os.storage.StorageManager;
import android.provider.DocumentsContract;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.adeel.library.easyFTP;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.soma.data.animais.DatabaseHelperAnimais;
import com.soma.data.arvoresvivas.DatabaseHelperArvoresVivas;
import com.soma.data.arvoresvivas.ModArvoresVivasFragment;
import com.soma.data.epifitas.DatabaseHelperEpifitas;
import com.soma.data.hidrologia.DatabaseHelperHidrologia;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * A simple {@link Fragment} subclass.
 */
public class MainFragment extends Fragment {

    private static final int LOCATION_PERMISSION_REQUEST_CODE = 1;
    TextView textLatLong;
    ResultReceiver resultReceiver;
    LocationManager locationManager ;
    boolean GpsStatus ;
    Spinner spinner;
    com.androidigniter.loginandregistration.MainActivity mainActivity;
    private String login_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/login.php";
    private String painel_parcela_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_info_parcelas.php";
    private String painel_fauna_familia_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_familias.php";
    private String painel_fauna_genero_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_generos.php";
    private String painel_fauna_especie_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_especies.php";
    private String painel_flora_familia_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_familias.php";
    private String painel_flora_genero_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_generos.php";
    private String painel_flora_especie_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_especies.php";
    private String painel_grau_protecao_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_grau_protecao.php";
    private String painel_fauna_classificacao_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_classificacao.php";
    private String painel_fauna_tpobservacao_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_tpobservacao.php";
    private String envia_painel_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/envia_painel.php";
    private AlertDialog alertDialog1;
    private static final String KEY_STATUS = "status";
    TextView statuslabel;
    public FTPClient mFTPClient = null;
    int counter = 75;
    //String hoje = new SimpleDateFormat("ddMMyyyyhhmmss", Locale.getDefault()).format(new Date());
    ProgressDialog progressDialog;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_main, container, false);

        leGPS();

        this.statuslabel = view.findViewById(R.id.textView3);

       // carregaPainelDB();

        alertDialog1 = new AlertDialog.Builder(
                getActivity()).create();
       // alertDialog1.setTitle("Alert Dialog");
        alertDialog1.setMessage("Atualizando parcelas...");
      //  alertDialog1.setIcon(R.drawable.common_google_signin_btn_icon_dark);
       /* alertDialog1.setButton("OK", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                Toast.makeText(getContext(),
                        "You clicked on OK", Toast.LENGTH_SHORT).show();
            }
        });*/

        Button btnAtualizarTudo = view.findViewById(R.id.btnAtualizarTudo);
        btnAtualizarTudo.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                //    alertDialog1.show();
                //    alertDialog1.setMessage("Atualizando parcelas...");

            //    Toast.makeText(getContext(), "ATUALIZANDO", Toast.LENGTH_LONG).show();

                Handler handler = new Handler(Looper.getMainLooper());
                Thread t = new Thread(String.valueOf(handler.post(
                        new Runnable()
                        {
                            @Override
                            public void run()
                            {
                                alertDialog1.show();
                                alertDialog1.setMessage("Sincronizando...");
                                try {
                                    runInBackground("tudo");
                                } catch (InterruptedException e) {
                                    throw new RuntimeException(e);
                                }

                              //  runUploadArquivosInBackground0();


                                //testeuploadftp();

                                //   alertDialog1.dismiss();
                            }
                        }
                )));

                t.start();
                try {
                    t.join();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
               // if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();


                // Code here executes on main thread after user presses button
            }
        });

      /*  Button btnAtualizarFauna = view.findViewById(R.id.btnAtualizarFauna);
        btnAtualizarFauna.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    runInBackground("fauna");
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                // Code here executes on main thread after user presses button
            }
        });

        Button btnAtualizarFlora = view.findViewById(R.id.btnAtualizarFlora);
        btnAtualizarFlora.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    runInBackground("flora");
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                // Code here executes on main thread after user presses button
            }
        });*/

        Button btnEnviarPainel = view.findViewById(R.id.btnEnviarPainel);
        btnEnviarPainel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                try {
                    runEnviarPainelInBackground();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        });

        Button btnUploadArquivos = view.findViewById(R.id.btnUploadArquivos);
        btnUploadArquivos.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                File directory = new File( Environment.getExternalStorageDirectory()+File.separator+"images/arvoresvivas/");

                // get all the files from a directory
                File[] fList = directory.listFiles();
                for (File file : fList) {
                    if (file.isFile()) {
                        try {
                            runUploadArquivosInBackground1(file.getName());
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }

              /*  //alertdialog1.dismiss();
                alertDialog1.setMessage("Atualizando arquivos em background!");
                alertDialog1.show();
                Handler handler = new Handler();
                handler.postDelayed(new Runnable() {
                    public void run() {
                        //alertdialog1.dismiss();
                    }
                }, 2000);*/

            }
        });


        return view;
    }

    void runInBackground(String tpAtualizacao) throws InterruptedException {

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.show();
                        alertDialog1.setMessage("Iniciando a sincronização...");
                        atualizaTudoPainel();
                    }
                }
        )));

        t.start();
        //if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();

        runEnviarPainelInBackground();

    //    Message msg = new Message();
        //  alertDialog1.show();
        //  alertDialog1.setMessage("Processando");
     /*   if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;*/

      /*  Handler handler = new Handler(new Handler.Callback() {

            @Override
            public boolean handleMessage(Message msg) {
                if(msg.arg1==1)
                {
               //     Toast.makeText(getContext(),"TESTE",Toast.LENGTH_LONG).show();
                }
                return false;
            }
        });*/

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
      /*  Thread t = new Thread(new Runnable() {
            public Handler mHandler;

            @Override
            public void run() {
                if (tpAtualizacao.equals("tudo")) {
                    atualizaTudoPainel();
                } else if (tpAtualizacao.equals("fauna")) {
                    atualizaFaunaPainel();
                } else if (tpAtualizacao.equals("flora")) {
                    atualizaFloraPainel();
                }

             //   handler.sendMessage(msg);
            }


        });
        t.start();
        t.join();*/
      //  statuslabel.setText("LEO");

        //runEnviarPainelInBackground();
    }

    void enviaInfoArquivoPainel(String dscategoria, String idcategoria, String description, String date,
                                String link, String link_thumb) throws InterruptedException {
      //  alertDialog1.show();
       /* if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;*/

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        enviaInfoArquivoPainel2(dscategoria,idcategoria, description, date,
                                link, link_thumb);
                        //   alertDialog1.dismiss();
                    }
                }
        )));

       // if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();

        t.start();
    //    if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();
        /*alertDialog1.dismiss();


        enviaInfoArquivoPainel("hidrologia",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);*/

     /*   Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                enviaInfoArquivoPainel2(dscategoria,idcategoria, description, date,
                        link, link_thumb);
            }
        });
        t.start();*/
       /* if (dscategoria == "hidrologia") {
            t.join();
            alertDialog1.dismiss();
        }*/
    }

    private void enviaInfoArquivoPainel2(String dscategoria, String idcategoria, String description, String date,
                                        String link, String link_thumb) {

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
                request.put("name", description);
                request.put("dscategoria", "infoarquivo");
                request.put("dscategoriatabela", dscategoria);
                request.put("idcategoria", idcategoria);
                request.put("description", description);
                request.put("date", date);
                request.put("link", link);
                request.put("linkthumb", link_thumb);
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    void runEnviarPainelInBackground() throws InterruptedException {
      //  alertDialog1.show();

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.setMessage("Sincronizando...");
                        enviaPainel();
                    }
                }
        )));

        t.start();
    //    if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();

        new upload_arvoresvivas().execute();

        final File folder_arvores_vivas = new File(Environment.getExternalStorageDirectory()+File.separator+"images/arvoresvivas");

        if (folder_arvores_vivas.listFiles() != null) {
            for (final File fileEntry : folder_arvores_vivas.listFiles()) {
                try {
                    String fileName = fileEntry.getName();
                    enviaInfoArquivoPainel2("arvoresvivas", fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")), "Árvores Vivas", null, "uploads/" + fileName, "uploads/" + fileName);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }

        new upload_animais().execute();

        final File folder_animais = new File(Environment.getExternalStorageDirectory()+File.separator+"images/animais");

        if (folder_animais.listFiles() != null) {
            for (final File fileEntry : folder_animais.listFiles()) {
                try {
                    String fileName = fileEntry.getName();
                    enviaInfoArquivoPainel2("animais", fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")), "Animais", null, "uploads/" + fileName, "uploads/" + fileName);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }

        new upload_epifitas().execute();

        final File folder_epifitas = new File(Environment.getExternalStorageDirectory()+File.separator+"images/epifitas");

        if (folder_epifitas.listFiles() != null) {
            for (final File fileEntry : folder_epifitas.listFiles()) {
                try {
                    String fileName = fileEntry.getName();
                    enviaInfoArquivoPainel2("epifitas", fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")), "Epifitas", null, "uploads/" + fileName, "uploads/" + fileName);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }

        new upload_hidrologia().execute();

        final File folder_hidrologia= new File(Environment.getExternalStorageDirectory()+File.separator+"images/hidrologia");

        if (folder_hidrologia.listFiles() != null) {
            for (final File fileEntry : folder_hidrologia.listFiles()) {
                try {
                    String fileName = fileEntry.getName();
                    enviaInfoArquivoPainel2("hidrologia", fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")), "Hidrologia", null, "uploads/" + fileName, "uploads/" + fileName);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }
      //  runUploadArquivosInBackground0();

      /*  if (!isRecursionEnable)

            return;

        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                enviaPainel();
            }
        });
        t.start();
        t.join();
        runUploadArquivosInBackground0();*/

    }

    private void runUploadArquivosInBackground0() {
        File directory = new File( Environment.getExternalStorageDirectory()+File.separator+"images/arvoresvivas/");

        try {
            // get all the files from a directory
            File[] fList = directory.listFiles();
            for (File file : fList) {
                if (file.isFile()) {
                    runUploadArquivosInBackground1(file.getName());
                }
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            runUploadArquivosInBackground3();
        }

    }

    void runUploadArquivosInBackground1(String nomeArquivo) throws InterruptedException {
    //    alertDialog1.show();

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.setMessage("Sincronizando...");
                        runUploadArquivosInBackground2(nomeArquivo);
                    }
                }
        )));

        t.start();
    //    if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();

        enviaInfoArquivoPainel("arvoresvivas",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);

       /* if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                runUploadArquivosInBackground2(nomeArquivo);
            }
        });
        t.start();
        t.join();
        enviaInfoArquivoPainel("arvoresvivas",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);
        */
    }


    public class upload_arvoresvivas extends AsyncTask<String, Void, Void> {

        @Override
        protected Void doInBackground(String... params) {
                mFTPClient = new FTPClient();
            try {
                // connecting to the host
                mFTPClient.connect("185.211.7.223", 21);

                mFTPClient.setSoTimeout(10000);
                mFTPClient.enterLocalPassiveMode();
                boolean status = mFTPClient.login("u699148595.somasustentabilidade.com.br", "%Teste006");
                if (status) {
                    mFTPClient.setFileType(FTP.BINARY_FILE_TYPE);
                    mFTPClient.setFileTransferMode(FTP.BINARY_FILE_TYPE);

                    final File folder = new File(Environment.getExternalStorageDirectory()+File.separator+"images/arvoresvivas");
                    final String remotePath = "homologacao/inventario/painel/uploads/";

                    for (final File fileEntry : folder.listFiles()) {
                        try {
                            FileInputStream fs = new FileInputStream(fileEntry);
                            if (!fileEntry.isDirectory()) {
                                String fileName = fileEntry.getName();
                                mFTPClient.storeFile(remotePath + fileName, fs);
                                fs.close();
                            }
                        } catch (Exception e) {
                            //   Log.i(TAG, "error uploading");
                        }
                    }
                }

            } catch (Exception e) {
                Log.i("testConnection", "Error: could not connect to host ");
                e.printStackTrace();

            }
            return null;
        }
    }

    public class upload_animais extends AsyncTask<String, Void, Void> {

        @Override
        protected Void doInBackground(String... params) {
            mFTPClient = new FTPClient();
            try {
                // connecting to the host
                mFTPClient.connect("185.211.7.223", 21);

                mFTPClient.setSoTimeout(10000);
                mFTPClient.enterLocalPassiveMode();
                boolean status = mFTPClient.login("u699148595.somasustentabilidade.com.br", "%Teste006");
                if (status) {
                    mFTPClient.setFileType(FTP.BINARY_FILE_TYPE);
                    mFTPClient.setFileTransferMode(FTP.BINARY_FILE_TYPE);

                    final File folder = new File(Environment.getExternalStorageDirectory()+File.separator+"images/animais");
                    final String remotePath = "homologacao/inventario/painel/uploads/";

                    for (final File fileEntry : folder.listFiles()) {
                        try {
                            FileInputStream fs = new FileInputStream(fileEntry);
                            if (!fileEntry.isDirectory()) {
                                String fileName = fileEntry.getName();
                                enviaInfoArquivoPainel2("animais",fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")),"teste", "2023-10-28", "uploads/"+fileName,"uploads/"+fileName);
                                mFTPClient.storeFile(remotePath + fileName, fs);
                                fs.close();
                            }
                        } catch (Exception e) {
                            //   Log.i(TAG, "error uploading");
                        }
                    }
                }

            } catch (Exception e) {
                Log.i("testConnection", "Error: could not connect to host ");
                e.printStackTrace();

            }
            return null;
        }
    }

    public class upload_epifitas extends AsyncTask<String, Void, Void> {

        @Override
        protected Void doInBackground(String... params) {
            mFTPClient = new FTPClient();
            try {
                // connecting to the host
                mFTPClient.connect("185.211.7.223", 21);

                mFTPClient.setSoTimeout(10000);
                mFTPClient.enterLocalPassiveMode();
                boolean status = mFTPClient.login("u699148595.somasustentabilidade.com.br", "%Teste006");
                if (status) {
                    mFTPClient.setFileType(FTP.BINARY_FILE_TYPE);
                    mFTPClient.setFileTransferMode(FTP.BINARY_FILE_TYPE);

                    final File folder = new File(Environment.getExternalStorageDirectory()+File.separator+"images/epifitas");
                    final String remotePath = "homologacao/inventario/painel/uploads/";

                    for (final File fileEntry : folder.listFiles()) {
                        try {
                            FileInputStream fs = new FileInputStream(fileEntry);
                            if (!fileEntry.isDirectory()) {
                                String fileName = fileEntry.getName();
                                enviaInfoArquivoPainel2("epifitas",fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")),"teste", "2023-10-28", "uploads/"+fileName,"uploads/"+fileName);
                                mFTPClient.storeFile(remotePath + fileName, fs);
                                fs.close();
                            }
                        } catch (Exception e) {
                            //   Log.i(TAG, "error uploading");
                        }
                    }
                }

            } catch (Exception e) {
                Log.i("testConnection", "Error: could not connect to host ");
                e.printStackTrace();

            }
            return null;
        }
    }

    public class upload_hidrologia extends AsyncTask<String, Void, Void> {

        @Override
        protected Void doInBackground(String... params) {
            mFTPClient = new FTPClient();
            try {
                // connecting to the host
                mFTPClient.connect("185.211.7.223", 21);

                mFTPClient.setSoTimeout(10000);
                mFTPClient.enterLocalPassiveMode();
                boolean status = mFTPClient.login("u699148595.somasustentabilidade.com.br", "%Teste006");
                if (status) {
                    mFTPClient.setFileType(FTP.BINARY_FILE_TYPE);
                    mFTPClient.setFileTransferMode(FTP.BINARY_FILE_TYPE);

                    final File folder = new File(Environment.getExternalStorageDirectory()+File.separator+"images/hidrologia");
                    final String remotePath = "homologacao/inventario/painel/uploads/";

                    for (final File fileEntry : folder.listFiles()) {
                        try {
                            FileInputStream fs = new FileInputStream(fileEntry);
                            if (!fileEntry.isDirectory()) {
                                String fileName = fileEntry.getName();
                                enviaInfoArquivoPainel2("hidrologia",fileName.substring(fileName.indexOf("-") + 1, fileName.indexOf(".")),"teste", "2023-10-28", "uploads/"+fileName,"uploads/"+fileName);
                                mFTPClient.storeFile(remotePath + fileName, fs);
                                fs.close();
                            }
                        } catch (Exception e) {
                            //   Log.i(TAG, "error uploading");
                        }
                    }
                }

            } catch (Exception e) {
                Log.i("testConnection", "Error: could not connect to host ");
                e.printStackTrace();

            }
            return null;
        }
    }


    private void runUploadArquivosInBackground2(String filename) {
        FTPClient con = null;
        boolean result = false;
       // String remotePath = "homologacao/inventario/painel/uploads/";
        String remotePath = "/tmp/";
        String localPath = "/storage/emulated/0/images/arvoresvivas/";

        try {
         //   alertDialog1.setMessage("Enviando arquivos...");
         //   alertDialog1.show();

            con = new FTPClient();
        //    con.connect("185.211.7.223");
            con.connect("186.233.226.4");
         //   if (con.login("u699148595.somasustentabilidade.com.br", "%Teste006")) {
            if (con.login("jelastic-ftp", "sqBLJegvoo")) {
                con.enterLocalPassiveMode(); // important!
                con.setFileType(FTP.BINARY_FILE_TYPE);

                String data = localPath+filename;
                FTPFile remoteFile = con.mlistFile(remotePath+filename);

             //   if (remoteFile == null) {
                    FileInputStream in = new FileInputStream(new File(data));
                    result = con.storeFile(remotePath + filename, in);
                    in.close();
                    if (result) {
                    //    //alertdialog1.dismiss();
                        Log.v("upload result", "succeeded");
                    }
             //   }
                /*else {
                    //alertdialog1.dismiss();
                }*/
                con.logout();
                con.disconnect();
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            //enviaInfoArquivoPainel("arvoresvivas",filename.substring(filename.indexOf("-") + 1, filename.indexOf(".")),"teste", "2023-10-28", "uploads/"+filename,"uploads/"+filename);
            //alertdialog1.dismiss();
        }
    }


    private void runUploadArquivosInBackground3() {
        File directory = new File( Environment.getExternalStorageDirectory()+File.separator+"images/animais/");

        try {
            // get all the files from a directory
            File[] fList = directory.listFiles();
            for (File file : fList) {
                if (file.isFile()) {
                    runUploadArquivosInBackground4(file.getName());
                }
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            runUploadArquivosInBackground6();
        }
    }

    void runUploadArquivosInBackground4(String nomeArquivo) throws InterruptedException {
    //    alertDialog1.show();
        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.setMessage("Sincronizando...");
                        runUploadArquivosInBackground5(nomeArquivo);
                    }
                }
        )));

        t.start();
    //    if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();

        enviaInfoArquivoPainel("animais",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);

        /*if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                runUploadArquivosInBackground5(nomeArquivo);
            }
        });
        t.start();
        t.join();
        enviaInfoArquivoPainel("animais",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);
         */
    }

    private void runUploadArquivosInBackground5(String filename) {
        FTPClient con = null;
        boolean result = false;
        String remotePath = "homologacao/inventario/painel/uploads/";
        String localPath = "/storage/emulated/0/images/animais/";

        try {
         //   alertDialog1.setMessage("Enviando arquivos...");
         //   alertDialog1.show();

            con = new FTPClient();
            con.connect("185.211.7.223");

            if (con.login("u699148595.somasustentabilidade.com.br", "%Teste006")) {
                con.enterLocalPassiveMode(); // important!
                con.setFileType(FTP.BINARY_FILE_TYPE);

                String data = localPath+filename;
                FTPFile remoteFile = con.mlistFile(remotePath+filename);

                if (remoteFile == null) {
                    FileInputStream in = new FileInputStream(new File(data));
                    result = con.storeFile(remotePath + filename, in);
                    in.close();
                    if (result) {
                        //    //alertdialog1.dismiss();
                        Log.v("upload result", "succeeded");
                    }
                }
                /*else {
                    //alertdialog1.dismiss();
                }*/
                con.logout();
                con.disconnect();
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            //enviaInfoArquivoPainel("arvoresvivas",filename.substring(filename.indexOf("-") + 1, filename.indexOf(".")),"teste", "2023-10-28", "uploads/"+filename,"uploads/"+filename);
            //alertdialog1.dismiss();
        }
    }

    private void runUploadArquivosInBackground6() {
        File directory = new File( Environment.getExternalStorageDirectory()+File.separator+"images/epifitas/");

        try {
            // get all the files from a directory
            File[] fList = directory.listFiles();
            for (File file : fList) {
                if (file.isFile()) {
                    runUploadArquivosInBackground7(file.getName());
                }
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            runUploadArquivosInBackground9();
        }

    }

    void runUploadArquivosInBackground7(String nomeArquivo) throws InterruptedException {
    //    alertDialog1.show();

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.setMessage("Sincronizando...");
                        runUploadArquivosInBackground8(nomeArquivo);
                    }
                }
        )));

        t.start();
    //    if (!t.isAlive()) alertDialog1.dismiss(); else alertDialog1.show();
        t.join();

        enviaInfoArquivoPainel("epifitas",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);

       /* if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                runUploadArquivosInBackground8(nomeArquivo);
            }
        });
        t.start();
        t.join();
        enviaInfoArquivoPainel("epifitas",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);*/
    }

    private void runUploadArquivosInBackground8(String filename) {
        FTPClient con = null;
        boolean result = false;
        String remotePath = "homologacao/inventario/painel/uploads/";
        String localPath = "/storage/emulated/0/images/epifitas/";

        try {
         //   alertDialog1.setMessage("Enviando arquivos...");
         //   alertDialog1.show();

            con = new FTPClient();
            con.connect("185.211.7.223");

            if (con.login("u699148595.somasustentabilidade.com.br", "%Teste006")) {
                con.enterLocalPassiveMode(); // important!
                con.setFileType(FTP.BINARY_FILE_TYPE);

                String data = localPath+filename;
                FTPFile remoteFile = con.mlistFile(remotePath+filename);

                if (remoteFile == null) {
                    FileInputStream in = new FileInputStream(new File(data));
                    result = con.storeFile(remotePath + filename, in);
                    in.close();
                    if (result) {
                        //    //alertdialog1.dismiss();
                        Log.v("upload result", "succeeded");
                    }
                }
                /*else {
                    //alertdialog1.dismiss();
                }*/
                con.logout();
                con.disconnect();
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            //enviaInfoArquivoPainel("arvoresvivas",filename.substring(filename.indexOf("-") + 1, filename.indexOf(".")),"teste", "2023-10-28", "uploads/"+filename,"uploads/"+filename);
            //alertdialog1.dismiss();
        }
    }

    private void runUploadArquivosInBackground9() {
        File directory = new File( Environment.getExternalStorageDirectory()+File.separator+"images/hidrologia/");

        try {
            // get all the files from a directory
            File[] fList = directory.listFiles();
            for (File file : fList) {
                if (file.isFile()) {
                    runUploadArquivosInBackground10(file.getName());
                }
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
            //alertdialog1.dismiss();
        }

    }

    void runUploadArquivosInBackground10(String nomeArquivo) throws InterruptedException {
    //    alertDialog1.show();

        Handler handler = new Handler(Looper.getMainLooper());
        Thread t = new Thread(String.valueOf(handler.post(
                new Runnable()
                {
                    @Override
                    public void run()
                    {
                        alertDialog1.setMessage("Sincronizando...");
                        runUploadArquivosInBackground11(nomeArquivo);
                    }
                }
        )));

        t.start();
        t.join();

        enviaInfoArquivoPainel("hidrologia",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);

        /*if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        Thread t = new Thread(new Runnable() {
            @Override
            public void run() {
                runUploadArquivosInBackground11(nomeArquivo);
            }
        });
        t.start();
        t.join();
        enviaInfoArquivoPainel("hidrologia",nomeArquivo.substring(nomeArquivo.indexOf("-") + 1, nomeArquivo.indexOf(".")),"teste", "2023-10-28", "uploads/"+nomeArquivo,"uploads/"+nomeArquivo);*/
    }

    private void runUploadArquivosInBackground11(String filename) {
        FTPClient con = null;
        boolean result = false;
        String remotePath = "homologacao/inventario/painel/uploads/";
        String localPath = "/storage/emulated/0/images/hidrologia/";

        try {
        //    alertDialog1.setMessage("Enviando arquivos...");
        //    alertDialog1.show();

            con = new FTPClient();
            con.connect("185.211.7.223");

            if (con.login("u699148595.somasustentabilidade.com.br", "%Teste006")) {
                con.enterLocalPassiveMode(); // important!
                con.setFileType(FTP.BINARY_FILE_TYPE);

                String data = localPath+filename;
                FTPFile remoteFile = con.mlistFile(remotePath+filename);

                if (remoteFile == null) {
                    FileInputStream in = new FileInputStream(new File(data));
                    result = con.storeFile(remotePath + filename, in);
                    in.close();
                    if (result) {
                        //    //alertdialog1.dismiss();
                        Log.v("upload result", "succeeded");
                    }
                }
                /*else {
                    //alertdialog1.dismiss();
                }*/
                con.logout();
                con.disconnect();
            }
        } catch (Exception e) {
            String t="Erro : " + e.getLocalizedMessage();
        } finally {
//            Toast.makeText(getContext(), "FINALIZOU", Toast.LENGTH_LONG).show();
            //enviaInfoArquivoPainel("arvoresvivas",filename.substring(filename.indexOf("-") + 1, filename.indexOf(".")),"teste", "2023-10-28", "uploads/"+filename,"uploads/"+filename);
            //alertdialog1.dismiss();
        }
    }

    private void atualizaTudoPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

        //    alertDialog1.setMessage("Atualizando parcelas...");
        /*CARREGA PARCELA*/
        JsonArrayRequest jsArrayRequest_parcela = new JsonArrayRequest
                (Request.Method.POST, painel_parcela_url, null, response -> {
                    try {
                        db.apagaTabelaParcela();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String no_propriedade    = jsonObject1.getString("no_propriedade");
                            String latitude    = jsonObject1.getString("latitude_gd");
                            String longitude    = jsonObject1.getString("longitude_gd");
                            db.insertParcela(id,no_propriedade,latitude,longitude);
                        }
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    } finally {
                    //    alertDialog1.show();
                        alertDialog1.setMessage("A sincronização estará sendo feita em background... Aguarde!");
                     /*   Handler handler = new Handler();
                        handler.postDelayed(new Runnable() {
                            public void run() {
                                alertDialog1.dismiss();
                            }
                        }, 3400);*/
                    //    alertDialog1.setMessage("Atualizando famílias da fauna...");
                        /*CARREGA FAUNA FAMÍLIA*/
                        JsonArrayRequest jsArrayRequest_fauna_familia = new JsonArrayRequest
                                (Request.Method.POST, painel_fauna_familia_url, null, response2 -> {
                                    try {
                                        if (!String.valueOf(db.CountFaunaFamilias()).equals(response2.getJSONObject(0).getString("contador"))) {
                                        db.apagaTabelaFaunaFamilia();
                                            for(int i=0; i < response2.length(); i++) {
                                                JSONObject jsonObject1 = response2.getJSONObject(i);
                                                String id       = jsonObject1.getString("id");
                                                String nome    = jsonObject1.getString("nome");
                                                db.insertFaunaFamilia(id,nome);
                                            }
                                        }
                                        db2.close();
                                    }
                                    catch (Exception e){
                                        e.printStackTrace();
                                    } finally {
                                    //    alertDialog1.setMessage("Atualizando gêneros da fauna...");
                                        /*CARREGA FAUNA GENERO*/
                                        JsonArrayRequest jsArrayRequest_fauna_genero = new JsonArrayRequest
                                                (Request.Method.POST, painel_fauna_genero_url, null, response3 -> {
                                                    try {
                                                        if (!String.valueOf(db.CountFaunaGeneros()).equals(response3.getJSONObject(0).getString("contador"))) {
                                                            db.apagaTabelaFaunaGenero();
                                                            for (int i = 0; i < response3.length(); i++) {
                                                                JSONObject jsonObject1 = response3.getJSONObject(i);
                                                                String id = jsonObject1.getString("id");
                                                                String nome = jsonObject1.getString("nome");
                                                                db.insertFaunaGenero(id, nome);
                                                            }
                                                        }
                                                        db2.close();
                                                    }
                                                    catch (Exception e){
                                                        e.printStackTrace();
                                                    } finally {
                                                    //    alertDialog1.setMessage("Atualizando espécies da fauna...");
                                                        /*CARREGA FAUNA ESPECIE*/
                                                        JsonArrayRequest jsArrayRequest_fauna_especie = new JsonArrayRequest
                                                                (Request.Method.POST, painel_fauna_especie_url, null, response4 -> {
                                                                    try {
                                                                        if (!String.valueOf(db.CountFaunaEspecies()).equals(response4.getJSONObject(0).getString("contador"))) {
                                                                            db.apagaTabelaFaunaEspecie();
                                                                            for (int i = 0; i < response4.length(); i++) {
                                                                                JSONObject jsonObject1 = response4.getJSONObject(i);
                                                                                String id = jsonObject1.getString("id");
                                                                                String nome = jsonObject1.getString("nome");
                                                                                String no_popular = jsonObject1.getString("no_popular");
                                                                                db.insertFaunaEspecie(id, nome, no_popular);
                                                                            }
                                                                        }
                                                                        db2.close();
                                                                    }
                                                                    catch (Exception e){
                                                                        e.printStackTrace();
                                                                    } finally {
                                                                    //    alertDialog1.setMessage("Atualizando famílias da flora...");
                                                                        /*CARREGA FLORA FAMÍLIA*/
                                                                        JsonArrayRequest jsArrayRequest_flora_familia = new JsonArrayRequest
                                                                                (Request.Method.POST, painel_flora_familia_url, null, response5 -> {
                                                                                    try {
                                                                                        if (!String.valueOf(db.CountFloraFamilias()).equals(response5.getJSONObject(0).getString("contador"))) {
                                                                                            db.apagaTabelaFloraFamilia();
                                                                                            for (int i = 0; i < response5.length(); i++) {
                                                                                                JSONObject jsonObject1 = response5.getJSONObject(i);
                                                                                                String id = jsonObject1.getString("id");
                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                db.insertFloraFamilia(id, nome);
                                                                                            }
                                                                                        }
                                                                                        db2.close();
                                                                                    }
                                                                                    catch (Exception e){
                                                                                        e.printStackTrace();
                                                                                    } finally {
                                                                                    //    alertDialog1.setMessage("Atualizando gêneros da flora...");
                                                                                        /*CARREGA FLORA GENERO*/
                                                                                        JsonArrayRequest jsArrayRequest_flora_genero = new JsonArrayRequest
                                                                                                (Request.Method.POST, painel_flora_genero_url, null, response6 -> {
                                                                                                    try {
                                                                                                        if (!String.valueOf(db.CountFloraGeneros()).equals(response6.getJSONObject(0).getString("contador"))) {
                                                                                                            db.apagaTabelaFloraGenero();
                                                                                                            for (int i = 0; i < response6.length(); i++) {
                                                                                                                JSONObject jsonObject1 = response6.getJSONObject(i);
                                                                                                                String id = jsonObject1.getString("id");
                                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                                db.insertFloraGenero(id, nome);
                                                                                                            }
                                                                                                        }
                                                                                                        db2.close();
                                                                                                    }
                                                                                                    catch (Exception e){
                                                                                                        e.printStackTrace();
                                                                                                    } finally {
                                                                                                    //    alertDialog1.setMessage("Atualizando espécies da flora...");

                                                                                                        /*CARREGA FLORA ESPECIE*/
                                                                                                        JsonArrayRequest jsArrayRequest_flora_especie = new JsonArrayRequest
                                                                                                                (Request.Method.POST, painel_flora_especie_url, null, response7 -> {
                                                                                                                    try {
                                                                                                                        if (!String.valueOf(db.CountFloraEspecies()).equals(response7.getJSONObject(0).getString("contador"))) {
                                                                                                                            db.apagaTabelaFloraEspecie();
                                                                                                                            for (int i = 0; i < response7.length(); i++) {
                                                                                                                                JSONObject jsonObject1 = response7.getJSONObject(i);
                                                                                                                                String id = jsonObject1.getString("id");
                                                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                                                String no_popular = jsonObject1.getString("no_popular");
                                                                                                                                db.insertFloraEspecie(id, nome, no_popular);
                                                                                                                            }
                                                                                                                        }
                                                                                                                        db2.close();
                                                                                                                    }
                                                                                                                    catch (Exception e){
                                                                                                                        e.printStackTrace();
                                                                                                                    } finally {
                                                                                                                        /*CARREGA GRAU DE PROTECAO*/
                                                                                                                        JsonArrayRequest jsArrayRequest_grau_protecao = new JsonArrayRequest
                                                                                                                                (Request.Method.POST, painel_grau_protecao_url, null, response8 -> {
                                                                                                                                    try {
                                                                                                                                        if (!String.valueOf(db.CountGrauProtecao()).equals(response8.getJSONObject(0).getString("contador"))) {
                                                                                                                                            db.apagaTabelaGrauProtecao();
                                                                                                                                            for (int i = 0; i < response8.length(); i++) {
                                                                                                                                                JSONObject jsonObject1 = response8.getJSONObject(i);
                                                                                                                                                String id = jsonObject1.getString("id");
                                                                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                                                                db.insertGrauProtecao(id, nome);
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                        db2.close();
                                                                                                                                    }
                                                                                                                                    catch (Exception e){
                                                                                                                                        e.printStackTrace();
                                                                                                                                    } finally {
                                                                                                                                        /*CARREGA FAUNA CLASSIFICACAO*/
                                                                                                                                        JsonArrayRequest jsArrayRequest_fauna_classificacao = new JsonArrayRequest
                                                                                                                                                (Request.Method.POST, painel_fauna_classificacao_url, null, response9 -> {
                                                                                                                                                    try {
                                                                                                                                                        if (!String.valueOf(db.CountFaunaClassificacao()).equals(response9.getJSONObject(0).getString("contador"))) {
                                                                                                                                                            db.apagaTabelaFaunaClassificacao();
                                                                                                                                                            for (int i = 0; i < response9.length(); i++) {
                                                                                                                                                                JSONObject jsonObject1 = response9.getJSONObject(i);
                                                                                                                                                                String id = jsonObject1.getString("id");
                                                                                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                                                                                db.insertFaunaClassificacao(id, nome);
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                        db2.close();
                                                                                                                                                    }
                                                                                                                                                    catch (Exception e){
                                                                                                                                                        e.printStackTrace();
                                                                                                                                                    } finally {
                                                                                                                                                        /*CARREGA FAUNA TIPO OBSERVACAO*/
                                                                                                                                                        JsonArrayRequest jsArrayRequest_fauna_tpobservacao = new JsonArrayRequest
                                                                                                                                                                (Request.Method.POST, painel_fauna_tpobservacao_url, null, response10 -> {
                                                                                                                                                                    try {
                                                                                                                                                                        if (!String.valueOf(db.CountFaunaTpObservacao()).equals(response10.getJSONObject(0).getString("contador"))) {
                                                                                                                                                                            db.apagaTabelaFaunaTpObservacao();
                                                                                                                                                                            for (int i = 0; i < response10.length(); i++) {
                                                                                                                                                                                JSONObject jsonObject1 = response10.getJSONObject(i);
                                                                                                                                                                                String id = jsonObject1.getString("id");
                                                                                                                                                                                String nome = jsonObject1.getString("nome");
                                                                                                                                                                                db.insertFaunaTpObservacao(id, nome);
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                        db2.close();
                                                                                                                                                                    }
                                                                                                                                                                    catch (Exception e){
                                                                                                                                                                        e.printStackTrace();
                                                                                                                                                                    } finally {
                                                                                                                                                                        //    alertDialog1.dismiss();
                                                                                                                                                                        alertDialog1.setMessage("Tudo atualizado!");
                                                                                                                                                                        Handler handler = new Handler();
                                                                                                                                                                        handler.postDelayed(new Runnable() {
                                                                                                                                                                            public void run() {
                                                                                                                                                                                alertDialog1.dismiss();
                                                                                                                                                                            }
                                                                                                                                                                        }, 1200);
                                                                                                                                                                        //runEnviarPainelInBackground();
                                                                                                                                                                    }
                                                                                                                                                                }, error -> {
                                                                                                                                                                    Toast.makeText(getContext(),
                                                                                                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                                                                                                });
                                                                                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_tpobservacao);
                                                                                                                                                    }
                                                                                                                                                }, error -> {
                                                                                                                                                    Toast.makeText(getContext(),
                                                                                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                                                                                });

                                                                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_classificacao);
                                                                                                                                    }
                                                                                                                                }, error -> {
                                                                                                                                    Toast.makeText(getContext(),
                                                                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                                                                });

                                                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_grau_protecao);
                                                                                                                    }
                                                                                                                }, error -> {
                                                                                                                    Toast.makeText(getContext(),
                                                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                                                });

                                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_especie);
                                                                                                    }
                                                                                                }, error -> {
                                                                                                    Toast.makeText(getContext(),
                                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                                });

                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_genero);

                                                                                    }
                                                                                }, error -> {
                                                                                    Toast.makeText(getContext(),
                                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                                });

                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_familia);

                                                                    }
                                                                }, error -> {
                                                                    Toast.makeText(getContext(),
                                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                                });

                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_especie);
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_genero);
                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_familia);
                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                }) {
            @Override
            protected Map<String, String> getParams() {
                // Posting parameters to login url
                Map<String, String> params = new HashMap<String, String>();
                params.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));
                return params;
            }
        };

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_parcela);
    }

    private void atualizaFaunaPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

    //    alertDialog1.setMessage("Atualizando famílias da fauna...");
        /*CARREGA FAUNA FAMÍLIA*/
        JsonArrayRequest jsArrayRequest_fauna_familia = new JsonArrayRequest
                (Request.Method.POST, painel_fauna_familia_url, null, response2 -> {
                    try {
                        if (!String.valueOf(db.CountFaunaFamilias()).equals(response2.getJSONObject(0).getString("contador"))) {
                            db.apagaTabelaFaunaFamilia();
                            for (int i = 0; i < response2.length(); i++) {
                                JSONObject jsonObject1 = response2.getJSONObject(i);
                                String id = jsonObject1.getString("id");
                                String nome = jsonObject1.getString("nome");
                                db.insertFaunaFamilia(id, nome);
                            }
                        }
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    } finally {
                    //    alertDialog1.setMessage("Atualizando gêneros da fauna...");
                        /*CARREGA FAUNA GENERO*/
                        JsonArrayRequest jsArrayRequest_fauna_genero = new JsonArrayRequest
                                (Request.Method.POST, painel_fauna_genero_url, null, response3 -> {
                                    try {
                                        if (!String.valueOf(db.CountFaunaGeneros()).equals(response3.getJSONObject(0).getString("contador"))) {
                                            db.apagaTabelaFaunaGenero();
                                            for (int i = 0; i < response3.length(); i++) {
                                                JSONObject jsonObject1 = response3.getJSONObject(i);
                                                String id = jsonObject1.getString("id");
                                                String nome = jsonObject1.getString("nome");
                                                db.insertFaunaGenero(id, nome);
                                            }
                                        }
                                        db2.close();
                                    }
                                    catch (Exception e){
                                        e.printStackTrace();
                                    } finally {
                                    //    alertDialog1.setMessage("Atualizando espécies da fauna...");
                                        /*CARREGA FAUNA ESPECIE*/
                                        JsonArrayRequest jsArrayRequest_fauna_especie = new JsonArrayRequest
                                                (Request.Method.POST, painel_fauna_especie_url, null, response4 -> {
                                                    try {
                                                        if (!String.valueOf(db.CountFaunaEspecies()).equals(response4.getJSONObject(0).getString("contador"))) {
                                                            db.apagaTabelaFaunaEspecie();
                                                            for (int i = 0; i < response4.length(); i++) {
                                                                JSONObject jsonObject1 = response4.getJSONObject(i);
                                                                String id = jsonObject1.getString("id");
                                                                String nome = jsonObject1.getString("nome");
                                                                String no_popular = jsonObject1.getString("no_popular");
                                                                db.insertFaunaEspecie(id, nome, no_popular);
                                                            }
                                                        }
                                                        db2.close();
                                                    }
                                                    catch (Exception e){
                                                        e.printStackTrace();
                                                    } finally {
                                                        //alertdialog1.dismiss();
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_especie);
                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_genero);
                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_familia);
    }

    private void atualizaFloraPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

    //    alertDialog1.setMessage("Atualizando famílias da flora...");
        /*CARREGA FLORA FAMÍLIA*/
        JsonArrayRequest jsArrayRequest_flora_familia = new JsonArrayRequest
                (Request.Method.POST, painel_flora_familia_url, null, response5 -> {
                    try {
                        db.apagaTabelaFloraFamilia();
                        for(int i=0; i < response5.length(); i++) {
                            JSONObject jsonObject1 = response5.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFloraFamilia(id,nome);
                        }
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    } finally {
                    //    alertDialog1.setMessage("Atualizando gêneros da flora...");
                        /*CARREGA FLORA GENERO*/
                        JsonArrayRequest jsArrayRequest_flora_genero = new JsonArrayRequest
                                (Request.Method.POST, painel_flora_genero_url, null, response6 -> {
                                    try {
                                        db.apagaTabelaFloraGenero();
                                        for(int i=0; i < response6.length(); i++) {
                                            JSONObject jsonObject1 = response6.getJSONObject(i);
                                            String id       = jsonObject1.getString("id");
                                            String nome    = jsonObject1.getString("nome");
                                            db.insertFloraGenero(id,nome);
                                        }
                                        db2.close();
                                    }
                                    catch (Exception e){
                                        e.printStackTrace();
                                    } finally {
                                    //    alertDialog1.setMessage("Atualizando espécies da flora...");

                                        /*CARREGA FLORA ESPECIE*/
                                        JsonArrayRequest jsArrayRequest_flora_especie = new JsonArrayRequest
                                                (Request.Method.POST, painel_flora_especie_url, null, response7 -> {
                                                    try {
                                                        db.apagaTabelaFloraEspecie();
                                                        for(int i=0; i < response7.length(); i++) {
                                                            JSONObject jsonObject1 = response7.getJSONObject(i);
                                                            String id       = jsonObject1.getString("id");
                                                            String nome    = jsonObject1.getString("nome");
                                                            String no_popular    = jsonObject1.getString("no_popular");
                                                            db.insertFloraEspecie(id,nome,no_popular);
                                                        }
                                                        db2.close();
                                                    }
                                                    catch (Exception e){
                                                        e.printStackTrace();
                                                    } finally {
                                                        //alertdialog1.dismiss();
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_especie);

                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_genero);

                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            "Banco de dados offline!", Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_familia);
    }

    private void enviaPainel() {
     //   alertDialog1.setMessage("Enviando animais para o painel");
      //  alertDialog1.show();

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
                request.put("dscategoria", "limpatabelas");
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                                try {
                                    //Check if user got registered successfully
                                    if (response.getInt(KEY_STATUS) == 0) {
                                    /*    alertDialog1.setMessage(response.getString("message"));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else if (response.getInt(KEY_STATUS) == 2) {
                                    /*    alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else {
                                    /*    alertDialog1.setMessage("ERRO COD: "+response.getInt(KEY_STATUS));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                } finally {
                                    enviaAnimaisPainel();
                                }
                            }
                        }, new Response.ErrorListener() {

                            @Override
                            public void onErrorResponse(VolleyError error) {
                            /*    alertDialog1.setMessage("Banco de dados offline!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                        ////alertdialog1.dismiss();
                                    }
                                }, 1200);*/
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void enviaAnimaisPainel() {
        //   alertDialog1.setMessage("Enviando animais para o painel");
        //  alertDialog1.show();

        DatabaseHelperAnimais db = new DatabaseHelperAnimais(getContext());

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
            if (db.getAllAnimais().size() == 0) {enviaArvoresVivasPainel();}
            for(int i = 0; i<db.getAllAnimais().size();i++){
                request.put("dscategoria", "animais");
                request.put("idcontroleanimais", String.valueOf(db.getAllAnimais().get(i).getetidcontrole()));
                request.put("idparcelaanimais", String.valueOf(db.getAllAnimais().get(i).getetidparcela()));
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));

                request.put("idfamilia", String.valueOf(db.getAllAnimais().get(i).getetfamilia()));
                request.put("idgenero", String.valueOf(db.getAllAnimais().get(i).getetgenero()));
                request.put("idespecie", String.valueOf(db.getAllAnimais().get(i).getetespecie()));

                request.put("idtpobservacao", String.valueOf(db.getAllAnimais().get(i).getettpobservacao()));
                request.put("idclassificacao", String.valueOf(db.getAllAnimais().get(i).getetclassificacao()));
                request.put("idgrauprotecao", String.valueOf(db.getAllAnimais().get(i).getetgrauprotecao()));
                request.put("latitudecampogd", db.getAllAnimais().get(i).getetlatitude());
                request.put("longitudecampogd", db.getAllAnimais().get(i).getetlongitude());

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                                try {
                                    //Check if user got registered successfully
                                    if (response.getInt(KEY_STATUS) == 0) {
                                    /*    alertDialog1.setMessage(response.getString("message"));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else if (response.getInt(KEY_STATUS) == 2) {
                                    /*    alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else {
                                    /*    alertDialog1.setMessage("ERRO COD: "+response.getInt(KEY_STATUS));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                ////alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                } finally {
                                    enviaArvoresVivasPainel();
                                }
                            }
                        }, new Response.ErrorListener() {

                            @Override
                            public void onErrorResponse(VolleyError error) {
                            /*    alertDialog1.setMessage("Banco de dados offline!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                        ////alertdialog1.dismiss();
                                    }
                                }, 1200);*/
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void enviaArvoresVivasPainel() {
     //   alertDialog1.show();
     //   alertDialog1.setMessage("Enviando arvores vivas para o painel");

        DatabaseHelperArvoresVivas db = new DatabaseHelperArvoresVivas(getContext());

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
            if (db.getAllArvoresVivas().size() == 0) {enviaEpifitasPainel();}
            for(int i = 0; i<db.getAllArvoresVivas().size();i++){
                request.put("dscategoria", "arvoresvivas");
                request.put("idcontrolearvoresvivas", db.getAllArvoresVivas().get(i).getetidcontrole());
                request.put("idparcelaarvoresvivas", db.getAllArvoresVivas().get(i).getetidparcela());
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));

                request.put("idfamilia", String.valueOf(db.getAllArvoresVivas().get(i).getetfamilia()));
                request.put("idgenero", String.valueOf(db.getAllArvoresVivas().get(i).getetgenero()));
                request.put("idespecie", String.valueOf(db.getAllArvoresVivas().get(i).getetespecie()));

                request.put("idgrauprotecao", db.getAllArvoresVivas().get(i).getetgrauprotecao());
                request.put("latitudecampogd", db.getAllArvoresVivas().get(i).getetlatitude());
                request.put("longitudecampogd", db.getAllArvoresVivas().get(i).getetlongitude());
                request.put("nubiomassa", db.getAllArvoresVivas().get(i).getetbiomassa());
                request.put("identificacao", db.getAllArvoresVivas().get(i).getetidentificado());
                request.put("nucircunferencia", db.getAllArvoresVivas().get(i).getetcircunferencia());
                request.put("nualtura", db.getAllArvoresVivas().get(i).getetaltura());
                request.put("nualturatotal", db.getAllArvoresVivas().get(i).getetalturatotal());
                request.put("nualturafuste", db.getAllArvoresVivas().get(i).getetalturafuste());
                request.put("nualturacopa", db.getAllArvoresVivas().get(i).getetalturacopa());
                request.put("isolada", db.getAllArvoresVivas().get(i).getetisolada());
                request.put("floracaofrutificacao", db.getAllArvoresVivas().get(i).getetfloracaofrutificacao());

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                                try {
                                    //Check if user got registered successfully
                                    if (response.getInt(KEY_STATUS) == 0) {
                                    /*    alertDialog1.setMessage(response.getString("message"));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                            //    //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else if (response.getInt(KEY_STATUS) == 2) {
                                    /*    alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                            //    //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else {
                                    /*    alertDialog1.setMessage("ERRO COD: "+response.getInt(KEY_STATUS));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                             //   //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                } finally {
                                    enviaEpifitasPainel();
                                }
                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                            /*    alertDialog1.setMessage("Banco de dados offline!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                    //    //alertdialog1.dismiss();
                                    }
                                }, 1200);*/
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void enviaEpifitasPainel() {
    //    alertDialog1.setMessage("Enviando epifitas para o painel");

        DatabaseHelperEpifitas db = new DatabaseHelperEpifitas(getContext());

        JSONObject request = new JSONObject();
        try {
            if (db.getAllEpifitas().size() == 0) {enviaHidrologiaPainel();}
            for(int i = 0; i<db.getAllEpifitas().size();i++){
                request.put("dscategoria", "epifitas");
                request.put("idcontroleepifitas", db.getAllEpifitas().get(i).getetidcontrole());
                request.put("idparcelaepifitas", db.getAllEpifitas().get(i).getetidparcela());
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));

                request.put("idfamilia", String.valueOf(db.getAllEpifitas().get(i).getetfamilia()));
                request.put("idgenero", String.valueOf(db.getAllEpifitas().get(i).getetgenero()));
                request.put("idespecie", String.valueOf(db.getAllEpifitas().get(i).getetespecie()));

                request.put("latitudecampogd", db.getAllEpifitas().get(i).getetlatitude());
                request.put("longitudecampogd", db.getAllEpifitas().get(i).getetlongitude());

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                                try {
                                    //Check if user got registered successfully
                                    if (response.getInt(KEY_STATUS) == 0) {
                                   /*     alertDialog1.setMessage(response.getString("message"));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                             //   //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else if (response.getInt(KEY_STATUS) == 2) {
                                    /*    alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                             //   //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else {
                                     /*   alertDialog1.setMessage("ERRO COD: "+response.getInt(KEY_STATUS));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                            //    //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                } finally {
                                    enviaHidrologiaPainel();
                                }
                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                            /*    alertDialog1.setMessage("AQUI");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                    //    //alertdialog1.dismiss();
                                    }
                                }, 1200);*/
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void enviaHidrologiaPainel() {
      //  alertDialog1.setMessage("Enviando hidrologia para o painel");

        DatabaseHelperHidrologia db = new DatabaseHelperHidrologia(getContext());

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
            for(int i = 0; i<db.getAllHidrologia().size();i++){
                request.put("dscategoria", "hidrologia");
                request.put("idcontrolehidrologia", db.getAllHidrologia().get(i).getetidcontrole());
                request.put("idparcelahidrologia", db.getAllHidrologia().get(i).getetidparcela());
                request.put("idacesso", String.valueOf(new SessionHandler(getContext()).getUserDetails().getIdAcesso()));
                request.put("descricao", db.getAllHidrologia().get(i).getetdescricao());
                request.put("latitudecampogd", db.getAllHidrologia().get(i).getetlatitude());
                request.put("longitudecampogd", db.getAllHidrologia().get(i).getetlongitude());

                JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                        (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {
                                try {
                                    //Check if user got registered successfully
                                    if (response.getInt(KEY_STATUS) == 0) {
                                      //  alertDialog1.setMessage(response.getString("message"));
                                      /*  Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/

                                    } else if (response.getInt(KEY_STATUS) == 2) {
                                    /*    alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    } else {
                                    /*    alertDialog1.setMessage("ERRO COD: "+response.getInt(KEY_STATUS));
                                        Handler handler = new Handler();
                                        handler.postDelayed(new Runnable() {
                                            public void run() {
                                                //alertdialog1.dismiss();
                                            }
                                        }, 1200);*/
                                    }
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                } finally {
                                //    alertDialog1.setMessage("Tudo feito! Os arquivos estão atualizando em background.");
                                   /* alertDialog1.setMessage("Enviado com sucesso!");
                                    Handler handler = new Handler();
                                    handler.postDelayed(new Runnable() {
                                        public void run() {
                                            //alertdialog1.dismiss();
                                        }
                                    }, 1400);*/
                                //    runUploadArquivosInBackground0();
                                }
                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                            /*    alertDialog1.setMessage("Banco de dados offline!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                        //alertdialog1.dismiss();
                                    }
                                }, 1200);*/
                            }
                        });
                MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);

            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void leGPS() {
        if (ContextCompat.checkSelfPermission(getContext(),
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions((Activity) getContext(),
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    LOCATION_PERMISSION_REQUEST_CODE);
        } else {
            getCurrentLocation();
        }
    }


    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == LOCATION_PERMISSION_REQUEST_CODE && grantResults.length > 0) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                getCurrentLocation();
            } else {
                Toast.makeText(getContext(), "Permission is denied!", Toast.LENGTH_SHORT).show();
            }
        }
    }


    public void CheckGpsStatus(){
        locationManager = (LocationManager)getContext().getSystemService(Context.LOCATION_SERVICE);
        assert locationManager != null;
        GpsStatus = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        if(GpsStatus == true) {
            Toast.makeText(getContext(), "GPS ativado!", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(getContext(), "GPS está desativado!", Toast.LENGTH_SHORT).show();
        }
    }




    private void getCurrentLocation() {
        CheckGpsStatus();
        LocationRequest locationRequest = new LocationRequest();
        locationRequest.setInterval(10000);
        locationRequest.setFastestInterval(3000);
        locationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);

        if (ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        LocationServices.getFusedLocationProviderClient(getContext())
                .requestLocationUpdates(locationRequest, new LocationCallback() {

                    @Override
                    public void onLocationResult(LocationResult locationResult) {
                        super.onLocationResult(locationResult);
                        LocationServices.getFusedLocationProviderClient(getContext())
                                .removeLocationUpdates(this);
                        if (locationResult != null && locationResult.getLocations().size() > 0) {
                            int latestlocIndex = locationResult.getLocations().size() - 1;
                            double lati = locationResult.getLocations().get(latestlocIndex).getLatitude();
                            double longi = locationResult.getLocations().get(latestlocIndex).getLongitude();
                        }
                    }
                }, Looper.getMainLooper());
    }

    private class PagerAdapter extends androidx.viewpager.widget.PagerAdapter {

        @Override
        public int getCount() {
            return 6;
        }

        @Override
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        @Override
        public Object instantiateItem(ViewGroup container, int position) {

            // Create some layout params
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(
                    RelativeLayout.LayoutParams.WRAP_CONTENT,
                    RelativeLayout.LayoutParams.WRAP_CONTENT);
            layoutParams.addRule(RelativeLayout.CENTER_IN_PARENT, RelativeLayout.TRUE);

            // Create some text
            TextView textView = getTextView(container.getContext());
            textView.setText(String.valueOf(position));
            textView.setLayoutParams(layoutParams);

            RelativeLayout layout = new RelativeLayout(container.getContext());
            layout.setBackgroundColor(ContextCompat.getColor(container.getContext(), R.color.colorPrimary));
            layout.setLayoutParams(layoutParams);

            layout.addView(textView);
            container.addView(layout);
            return layout;
        }

        private TextView getTextView(Context context) {
            TextView textView = new TextView(context);
            textView.setTextColor(Color.WHITE);
            textView.setTextSize(30);
            textView.setTypeface(Typeface.DEFAULT_BOLD);
            return textView;
        }

        @Override
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((RelativeLayout) object);
        }
    }
}
package com.androidigniter.loginandregistration;

import static com.androidigniter.loginandregistration.LoginActivity.isRecursionEnable;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.graphics.Typeface;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.core.content.ContextCompat;

import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.ResultReceiver;
import android.os.storage.StorageManager;
import android.provider.DocumentsContract;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.soma.data.arvoresvivas.ModArvoresVivasFragment;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.util.List;

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
    private String envia_painel_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/envia_painel.php";
    private AlertDialog alertDialog1;
    private static final String KEY_STATUS = "status";
    private static final String KEY_REGISTRO_ANIMAIS = "registroanimais";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_main, container, false);

        leGPS();

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
                runInBackground("tudo");
                // Code here executes on main thread after user presses button
            }
        });

        Button btnAtualizarFauna = view.findViewById(R.id.btnAtualizarFauna);
        btnAtualizarFauna.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                runInBackground("fauna");
                // Code here executes on main thread after user presses button
            }
        });

        Button btnAtualizarFlora = view.findViewById(R.id.btnAtualizarFlora);
        btnAtualizarFlora.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                runInBackground("flora");
                // Code here executes on main thread after user presses button
            }
        });

        Button btnEnviarPainel = view.findViewById(R.id.btnEnviarPainel);
        btnEnviarPainel.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                runEnviarPainelInBackground();
            }
        });


        return view;
    }

    void runInBackground(String tpAtualizacao) {
        alertDialog1.show();
        if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        new Thread(new Runnable() {
            @Override
            public void run() {
                if (tpAtualizacao.equals("tudo")) {
                    atualizaTudoPainel();
                } else if (tpAtualizacao.equals("fauna")) {
                    atualizaFaunaPainel();
                } else if (tpAtualizacao.equals("flora")) {
                    atualizaFloraPainel();
                }
            }
        }).start();
    }

    void runEnviarPainelInBackground() {
        alertDialog1.show();
        if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        new Thread(new Runnable() {
            @Override
            public void run() {
                enviaPainel();
            }
        }).start();
    }

    private void atualizaTudoPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();
        alertDialog1.setMessage("Atualizando parcelas...");
        /*CARREGA PARCELA*/
        JsonArrayRequest jsArrayRequest_parcela = new JsonArrayRequest
                (Request.Method.POST, painel_parcela_url, null, response -> {
                    try {
                        db.apagaTabelaParcela();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String no_propriedade    = jsonObject1.getString("no_propriedade");
                            db.insertParcela(id,no_propriedade);
                        }
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    } finally {
                        alertDialog1.setMessage("Atualizando famílias da fauna...");
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
                                        alertDialog1.setMessage("Atualizando gêneros da fauna...");
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
                                                        alertDialog1.setMessage("Atualizando espécies da fauna...");
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
                                                                        alertDialog1.setMessage("Atualizando famílias da flora...");
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
                                                                                        alertDialog1.setMessage("Atualizando gêneros da flora...");
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
                                                                                                        alertDialog1.setMessage("Atualizando espécies da flora...");

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
                                                                                                                        alertDialog1.setMessage("Tudo atualizado!");
                                                                                                                        Handler handler = new Handler();
                                                                                                                        handler.postDelayed(new Runnable() {
                                                                                                                            public void run() {
                                                                                                                                alertDialog1.dismiss();
                                                                                                                            }
                                                                                                                        }, 1200);
                                                                                                                    }
                                                                                                                }, error -> {
                                                                                                                    Toast.makeText(getContext(),
                                                                                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                                                                                });

                                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_especie);

                                                                                                    }
                                                                                                }, error -> {
                                                                                                    Toast.makeText(getContext(),
                                                                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                                                                });

                                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_genero);

                                                                                    }
                                                                                }, error -> {
                                                                                    Toast.makeText(getContext(),
                                                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                                                });

                                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_familia);

                                                                    }
                                                                }, error -> {
                                                                    Toast.makeText(getContext(),
                                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                                });

                                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_especie);
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_genero);
                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_familia);
                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_parcela);
    }

    private void atualizaFaunaPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

        alertDialog1.setMessage("Atualizando famílias da fauna...");
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
                        alertDialog1.setMessage("Atualizando gêneros da fauna...");
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
                                        alertDialog1.setMessage("Atualizando espécies da fauna...");
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
                                                        alertDialog1.dismiss();
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_especie);
                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_genero);
                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_fauna_familia);
    }

    private void atualizaFloraPainel() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

        alertDialog1.setMessage("Atualizando famílias da flora...");
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
                        alertDialog1.setMessage("Atualizando gêneros da flora...");
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
                                        alertDialog1.setMessage("Atualizando espécies da flora...");

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
                                                        alertDialog1.dismiss();
                                                    }
                                                }, error -> {
                                                    Toast.makeText(getContext(),
                                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                                });

                                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_especie);

                                    }
                                }, error -> {
                                    Toast.makeText(getContext(),
                                            error.getMessage(), Toast.LENGTH_SHORT).show();
                                });

                        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_genero);

                    }
                }, error -> {
                    Toast.makeText(getContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest_flora_familia);
    }


    private void enviaPainel() {
        alertDialog1.setMessage("Enviando registros para o painel...");
        alertDialog1.show();
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());

        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
            request.put(KEY_REGISTRO_ANIMAIS, db.getAllParcelas());

        } catch (JSONException e) {
            e.printStackTrace();
        }
        JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                (Request.Method.POST, envia_painel_url, request, new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        alertDialog1.dismiss();
                        try {
                            //Check if user got registered successfully
                            if (response.getInt(KEY_STATUS) == 0) {
                                alertDialog1.setMessage("Registros enviados!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                        alertDialog1.dismiss();
                                    }
                                }, 1200);
                            } else if (response.getInt(KEY_STATUS) == 2) {
                                alertDialog1.setMessage("Faltando parâmetros obrigatórios!");
                                Handler handler = new Handler();
                                handler.postDelayed(new Runnable() {
                                    public void run() {
                                        alertDialog1.dismiss();
                                    }
                                }, 1200);
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        alertDialog1.setMessage(error.getMessage());
                        Handler handler = new Handler();
                        handler.postDelayed(new Runnable() {
                            public void run() {
                                alertDialog1.dismiss();
                            }
                        }, 1200);
                    }
                });

        // Access the RequestQueue through your singleton class.
        MySingleton.getInstance(getContext()).addToRequestQueue(jsArrayRequest);
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
package com.androidigniter.loginandregistration;

import android.app.ProgressDialog;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class LoginActivity extends AppCompatActivity {
    private static final String KEY_STATUS = "status";
    private static final String KEY_MESSAGE = "message";
    private static final String KEY_FULL_NAME = "full_name";
    private static final String KEY_USERNAME = "username";
    private static final String KEY_PASSWORD = "password";
    private static final String KEY_IDACESSO = "idacesso";
    private static final String KEY_EMPTY = "";
    private EditText etUsername;
    private EditText etPassword;
    private String username;
    private String password;
    private ProgressDialog pDialog;
    private String login_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/login.php";
    private String painel_parcela_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_info_parcelas.php";
    private String painel_fauna_familia_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_familias.php";
    private String painel_fauna_genero_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_generos.php";
    private String painel_fauna_especie_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_fauna_especies.php";
    private String painel_flora_familia_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_familias.php";
    private String painel_flora_genero_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_generos.php";
    private String painel_flora_especie_url = "https://somasustentabilidade.com.br/homologacao/inventario/app/acessodb/carrega_flora_especies.php";
    private SessionHandler session;
    public static boolean isRecursionEnable = true;

    private ArrayList mylist;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        session = new SessionHandler(getApplicationContext());

        if(session.isLoggedIn()){
            loadDashboard();
        }
        setContentView(R.layout.activity_login);

        etUsername = findViewById(R.id.etLoginUsername);
        etPassword = findViewById(R.id.etLoginPassword);

        Button login = findViewById(R.id.btnLogin);

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Retrieve the data entered in the edit texts
                username = etUsername.getText().toString().toLowerCase().trim();
                password = etPassword.getText().toString().trim();
                if (validateInputs()) {
                    login();
                }
            }
        });
    }

    /**
     * Launch Dashboard Activity on Successful Login
     */
    private void loadDashboard() {
    /*    Intent i = new Intent(getApplicationContext(), DashboardActivity.class);
        startActivity(i);*/
        Intent i = new Intent(getApplicationContext(), MainActivity.class);
        startActivity(i);
        finish();

    }

    /**
     * Display Progress bar while Logging in
     */

    private void displayLoader() {
        pDialog = new ProgressDialog(LoginActivity.this);
        pDialog.setMessage("Fazendo o login.. Aguarde..");
        pDialog.setIndeterminate(false);
        pDialog.setCancelable(false);
        pDialog.show();

    }

    private void login() {
        displayLoader();
        JSONObject request = new JSONObject();
        try {
            //Populate the request parameters
            request.put(KEY_USERNAME, username);
            request.put(KEY_PASSWORD, password);

        } catch (JSONException e) {
            e.printStackTrace();
        }
        JsonObjectRequest jsArrayRequest = new JsonObjectRequest
                (Request.Method.POST, login_url, request, new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        pDialog.dismiss();
                        try {
                            //Check if user got logged in successfully

                            if (response.getInt(KEY_STATUS) == 0) {
                                session.loginUser(username,response.getString(KEY_FULL_NAME),response.getString(KEY_IDACESSO));
                                loadDashboard();
                            }else{
                                Toast.makeText(getApplicationContext(),
                                        "Usuário ou senha incorretos.", Toast.LENGTH_SHORT).show();
                                /*Toast.makeText(getApplicationContext(),
                                        response.getString(KEY_MESSAGE), Toast.LENGTH_SHORT).show();*/

                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pDialog.dismiss();

                        //Display error message whenever an error occurs
                        Toast.makeText(getApplicationContext(),
                                "aqui", Toast.LENGTH_SHORT).show();

                    }
                });

        // Access the RequestQueue through your singleton class.
        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest);

 //       runInBackground();

    }

    void runInBackground() {
        if (!isRecursionEnable)
            // Handle not to start multiple parallel threads
            return;

        // isRecursionEnable = false; when u want to stop
        // on exception on thread make it true again
        new Thread(new Runnable() {
            @Override
            public void run() {
                carregaPainelDB();

            }
        }).start();
    }


    private void carregaPainelDB() {
        DatabaseMainHandler db = new DatabaseMainHandler(getApplicationContext());
        SQLiteDatabase db2 = db.getWritableDatabase();

        /*CARREGA PARCELA*/
        JsonArrayRequest jsArrayRequest_parcela = new JsonArrayRequest
                (Request.Method.POST, painel_parcela_url, null, response -> {
                    pDialog.dismiss();
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
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getApplicationContext()).addToRequestQueue(jsArrayRequest_parcela);

        /*CARREGA FAUNA FAMÍLIA*/
        /*JsonArrayRequest jsArrayRequest_fauna_familia = new JsonArrayRequest
                (Request.Method.POST, painel_fauna_familia_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFaunaFamilia();
                        db2.beginTransaction();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFaunaFamilia(id,nome);
                        }
                        db2.setTransactionSuccessful();
                        db2.endTransaction();
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(getApplicationContext()).addToRequestQueue(jsArrayRequest_fauna_familia);*/


        /*CARREGA FAUNA GENERO*/
       /* JsonArrayRequest jsArrayRequest_fauna_genero = new JsonArrayRequest
                (Request.Method.POST, painel_fauna_genero_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFaunaFamilia();
                        db2.beginTransaction();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFaunaGenero(id,nome);
                        }
                        db2.setTransactionSuccessful();
                        db2.endTransaction();
                        db2.close();
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest_fauna_genero);*/

        /*CARREGA FAUNA ESPECIE*/
     /*   JsonArrayRequest jsArrayRequest_fauna_especie = new JsonArrayRequest
                (Request.Method.POST, painel_fauna_especie_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFaunaEspecie();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFaunaEspecie(id,nome);
                        }
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest_fauna_especie);*/

        /*CARREGA FLORA FAMÍLIA*/
       /* JsonArrayRequest jsArrayRequest_flora_familia = new JsonArrayRequest
                (Request.Method.POST, painel_flora_familia_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFloraFamilia();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFloraFamilia(id,nome);
                        }
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest_flora_familia);*/

        /*CARREGA FLORA GENERO*/
       /* JsonArrayRequest jsArrayRequest_flora_genero = new JsonArrayRequest
                (Request.Method.POST, painel_flora_genero_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFloraGenero();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFloraGenero(id,nome);
                        }
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest_flora_genero);*/

        /*CARREGA FLORA ESPECIE*/
     /*   JsonArrayRequest jsArrayRequest_flora_especie = new JsonArrayRequest
                (Request.Method.POST, painel_flora_especie_url, null, response -> {
                    pDialog.dismiss();
                    try {
                        db.apagaTabelaFloraEspecie();
                        for(int i=0; i < response.length(); i++) {
                            JSONObject jsonObject1 = response.getJSONObject(i);
                            String id       = jsonObject1.getString("id");
                            String nome    = jsonObject1.getString("nome");
                            db.insertFloraEspecie(id,nome);
                        }
                    }
                    catch (Exception e){
                        e.printStackTrace();
                    }
                }, error -> {
                    pDialog.dismiss();
                    Toast.makeText(getApplicationContext(),
                            error.getMessage(), Toast.LENGTH_SHORT).show();
                });

        MySingleton.getInstance(this).addToRequestQueue(jsArrayRequest_flora_especie);*/

    }

    /**
     * Validates inputs and shows error if any
     * @return
     */
    private boolean validateInputs() {
        if(KEY_EMPTY.equals(username)){
            etUsername.setError("Usuário não informado");
            etUsername.requestFocus();
            return false;
        }
        if(KEY_EMPTY.equals(password)){
            etPassword.setError("Senha não informada");
            etPassword.requestFocus();
            return false;
        }
        return true;
    }
}

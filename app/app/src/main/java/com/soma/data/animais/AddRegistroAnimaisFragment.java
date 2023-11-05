package com.soma.data.animais;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.os.ResultReceiver;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;


import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.DatabaseMainHandler;
import com.androidigniter.loginandregistration.NothingSelectedSpinnerAdapter;
import com.androidigniter.loginandregistration.R;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;
import com.soma.utils.camera.MainActivity;

import com.toptoche.searchablespinnerlibrary.SearchableSpinner;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;

/**
 * A simple {@link Fragment} subclass.
 */
public class AddRegistroAnimaisFragment extends Fragment {

    private static final int LOCATION_PERMISSION_REQUEST_CODE = 1;
    private Button btnSalvar;
    private
    EditText etidcontrole,
            etlatitude,
            etlongitude;
    Spinner spinner_parcela;
    SearchableSpinner
            spinner_familia,
            spinner_genero,
            spinner_especie,
            spinner_tpobservacao,
            spinner_classificacao,
            spinner_graudeprotecao;

    LocationManager locationManager ;
    boolean GpsStatus ;

    String[] options;
    TextView linkLatLong;
    String latParcela,longParcela;

    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.animais_activity_add_registro, container, false);

        databaseHelperAnimais = new DatabaseHelperAnimais(getContext());
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());

        /* BUTTONS */
        btnSalvar = (Button) view.findViewById(R.id.btnsalvar);

        /* SPINNERS */
        spinner_parcela = view.findViewById(R.id.spinner_parcela);


        linkLatLong = (TextView) view.findViewById(R.id.et_linklatlong);
        spinner_parcela.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

            @Override
            public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                // your code here
                if (spinner_parcela.getSelectedItemId() == -1) {
                    linkLatLong.setVisibility(View.GONE);
                } else {
                    linkLatLong.setVisibility(View.VISIBLE);
                    latParcela = db.getLatParcelas((String) spinner_parcela.getSelectedItem());
                    longParcela = db.getLongParcelas((String) spinner_parcela.getSelectedItem());
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parentView) {
                // your code here
            }
        });

        linkLatLong.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent i = new Intent(Intent.ACTION_VIEW,Uri.parse("geo:"+latParcela+","+longParcela+""));
                i.setClassName("com.google.android.apps.maps",
                        "com.google.android.maps.MapsActivity");
                startActivity(i);
            }
        });

        spinner_familia = view.findViewById(R.id.spinner_familia);
        List<String> familias = new ArrayList<String>();
        familias.add(0,"SELECIONE");
        familias.addAll(db.getAllFaunaFamilias());
        ArrayAdapter<String> adapter_spinner_familia = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, familias);

        adapter_spinner_familia.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_familia.setTitle("Pesquisar");
        spinner_familia.setPositiveButton("Fechar");
        spinner_familia.setAdapter(adapter_spinner_familia);

        spinner_genero = view.findViewById(R.id.spinner_genero);
        List<String> generos = new ArrayList<String>();
        generos.add(0,"SELECIONE");
        generos.addAll(db.getAllFaunaGeneros());
        ArrayAdapter<String> adapter_spinner_genero = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, generos);

        adapter_spinner_genero.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_genero.setTitle("Pesquisar");
        spinner_genero.setPositiveButton("Fechar");
        spinner_genero.setAdapter(adapter_spinner_genero);

        spinner_especie = view.findViewById(R.id.spinner_especie);
        List<String> especies = new ArrayList<String>();
        especies.add(0,"SELECIONE");
        especies.addAll(db.getAllFaunaEspecies());
        ArrayAdapter<String> adapter_spinner_especie = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, especies);

        adapter_spinner_especie.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_especie.setTitle("Pesquisar");
        spinner_especie.setPositiveButton("Fechar");
        spinner_especie.setAdapter(adapter_spinner_especie);

        spinner_tpobservacao = view.findViewById(R.id.spinner_tp_observacao);
        ArrayAdapter<CharSequence> adapter_spinner_tpobservacao = ArrayAdapter.createFromResource(getContext(),
                R.array.tpobservacao_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_tpobservacao.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_tpobservacao.setTitle("Pesquisar");
        spinner_tpobservacao.setPositiveButton("Fechar");
        spinner_tpobservacao.setAdapter(adapter_spinner_tpobservacao);

        spinner_classificacao = view.findViewById(R.id.spinner_classificacao);
        ArrayAdapter<CharSequence> adapter_spinner_classificacao = ArrayAdapter.createFromResource(getContext(),
                R.array.classificacao_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_classificacao.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_classificacao.setTitle("Pesquisar");
        spinner_classificacao.setPositiveButton("Fechar");
        spinner_classificacao.setAdapter(adapter_spinner_classificacao);

        spinner_graudeprotecao = view.findViewById(R.id.spinner_grau_de_protecao);
        ArrayAdapter<CharSequence> adapter_spinner_grau_de_protecao = ArrayAdapter.createFromResource(getContext(),
                R.array.grau_de_protecao_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_grau_de_protecao.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_graudeprotecao.setTitle("Pesquisar");
        spinner_graudeprotecao.setPositiveButton("Fechar");
        spinner_graudeprotecao.setAdapter(adapter_spinner_grau_de_protecao);

        /* EDITTEXT */
        etidcontrole = (EditText) view.findViewById(R.id.et_idcontrole);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);

        etidcontrole.setText(Integer.toString(generateRandomNumber(1,10000)));

        if (ContextCompat.checkSelfPermission(getContext(),
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions((Activity) getContext(),
                    new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                    LOCATION_PERMISSION_REQUEST_CODE);
            getCurrentLocation(view);
        } else {
            getCurrentLocation(view);
        }

        view.findViewById(R.id.btncapturar).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","animais");
                startActivity(myIntent);
            }
        });

        /*spinner_identificacao.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                //       Toast.makeText(getContext(), " Selecionado >> "+options[position], Toast.LENGTH_SHORT).show();
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        }); */
        //spinner.setOnItemSelectedListener((AdapterView.OnItemSelectedListener) this);
        options = getContext().getResources().getStringArray(R.array.identificado_tmp);
        loadSpinnerData();

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
                        spinner_parcela.getSelectedItem().toString(),
                        etidcontrole.getText().toString(),
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        spinner_familia.getSelectedItem().toString(),
                        spinner_genero.getSelectedItem().toString(),
                        spinner_especie.getSelectedItem().toString(),
                        spinner_tpobservacao.getSelectedItem().toString(),
                        spinner_classificacao.getSelectedItem().toString(),
                        spinner_graudeprotecao.getSelectedItem().toString());

                Toast.makeText(getContext(), "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModAnimaisFragment(), false);
            }
        });



        return view;
    }

    public static int generateRandomNumber(int min, int max) {
        return new Random().nextInt((max- min) + 1) + min;
    }

    private void loadSpinnerData() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        List<String> parcelas = db.getAllParcelas();

        // Creating adapter for spinner
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, parcelas);

        // Drop down layout style - list view with radio button
        dataAdapter.setDropDownViewResource(R.layout.simple_spinner_dropdown_item);

        spinner_parcela.setAdapter(
                new NothingSelectedSpinnerAdapter(
                        dataAdapter,
                        R.layout.contact_spinner_row_nothing_selected,
                        // R.layout.contact_spinner_nothing_selected_dropdown, // Optional
                        getContext()));

        // attaching data adapter to spinner
        // spinner.setAdapter(dataAdapter);
    }

    private void getCurrentLocation(View view) {

        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);

        CheckGpsStatus();
        //progressBar.setVisibility(View.VISIBLE);
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
                        //if (locationResult != null && locationResult.getLocations().size() > 0) {
                            int latestlocIndex = locationResult.getLocations().size() - 1;
                            double lati = locationResult.getLocations().get(latestlocIndex).getLatitude();
                            double longi = locationResult.getLocations().get(latestlocIndex).getLongitude();
                            etlatitude.setText(String.format("%s",lati));
                            etlongitude.setText(String.format("%s",longi));
                            //progressBar.setVisibility(View.GONE);

                       /* } else {
                            progressBar.setVisibility(View.GONE);

                        }*/
                    }
                }, Looper.getMainLooper());

    }

    public void CheckGpsStatus(){
        locationManager = (LocationManager)getContext().getSystemService(Context.LOCATION_SERVICE);
        assert locationManager != null;
        GpsStatus = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER);
        if(GpsStatus == true) {
        //    Toast.makeText(getContext(), "GPS Is Enabled!", Toast.LENGTH_SHORT).show();
        } else {
        //    Toast.makeText(getContext(), "GPS Is Disabled!", Toast.LENGTH_SHORT).show();
        }
    }

    public void goToFragment(Fragment fragment, boolean addToBackStack) {
        FragmentTransaction transaction = getParentFragmentManager().beginTransaction();

        if (addToBackStack) {
            transaction.addToBackStack(null);
        }

        getParentFragmentManager().beginTransaction().remove(fragment).commit();
        transaction.add(R.id.container, fragment).commit();
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
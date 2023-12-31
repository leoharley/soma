package com.soma.data.hidrologia;

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

import java.util.List;
import java.util.Random;

/**
 * A simple {@link Fragment} subclass.
 */
public class AddRegistroHidrologiaFragment extends Fragment {

    private static final int LOCATION_PERMISSION_REQUEST_CODE = 1;
    private Button btnSalvar;
    private
    EditText etidcontrole,
            etlatitude,
            etlongitude,
            etdescricao;

    Spinner spinner_parcela;
    LocationManager locationManager ;
    boolean GpsStatus ;
    String[] options;
    TextView linkLatLong;
    String latParcela,longParcela;

    private DatabaseHelperHidrologia databaseHelperHidrologia;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.hidrologia_activity_add_registro, container, false);

        databaseHelperHidrologia = new DatabaseHelperHidrologia(getContext());
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
                String url = "https://www.google.com/maps/search/?api=1&query="+latParcela+","+longParcela+"";
                startActivity( new Intent(Intent.ACTION_VIEW).setData(Uri.parse(url)));
            }
        });

        /* EDITTEXT */
        etidcontrole = (EditText) view.findViewById(R.id.et_idcontrole);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);
        etdescricao = (EditText) view.findViewById(R.id.et_descricao);

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
                myIntent.putExtra("dscategoria","hidrologia");
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

                databaseHelperHidrologia.addHidrologiaDetail(
                        spinner_parcela.getSelectedItem().toString(),
                        etidcontrole.getText().toString(),
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etdescricao.getText().toString());

                Toast.makeText(getContext(), "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModHidrologiaFragment(), false);
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
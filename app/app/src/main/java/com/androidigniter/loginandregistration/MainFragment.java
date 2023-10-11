package com.androidigniter.loginandregistration;

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

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.core.content.ContextCompat;

import android.os.Environment;
import android.os.Looper;
import android.os.ResultReceiver;
import android.os.storage.StorageManager;
import android.provider.DocumentsContract;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import com.google.android.gms.location.LocationServices;

import java.io.File;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class MainFragment extends Fragment {

    private static final int LOCATION_PERMISSION_REQUEST_CODE = 1;
    ProgressBar progressBar;
    TextView textLatLong;
    ResultReceiver resultReceiver;
    LocationManager locationManager ;
    boolean GpsStatus ;
    Spinner spinner;
    com.androidigniter.loginandregistration.MainActivity mainActivity;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_main, container, false);
        progressBar = view.findViewById(R.id.progress_circular);
        textLatLong = view.findViewById(R.id.textLatLong);
        spinner = view.findViewById(R.id.spinner);

        view.findViewById(R.id.button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(getContext(), "Clicked a button!", Toast.LENGTH_SHORT).show();
            }
        });

        view.findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.data.arvoresvivas.MainActivity.class);
                startActivity(i);
            //    ((AppCompatActivity) getContext()).getSupportFragmentManager().beginTransaction().replace(R.id.container,new PersonalFragment()).commit();
            }
        });

        view.findViewById(R.id.button3).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.data.animais.MainActivity.class);
                startActivity(i);
                //    ((AppCompatActivity) getContext()).getSupportFragmentManager().beginTransaction().replace(R.id.container,new PersonalFragment()).commit();
            }
        });

        view.findViewById(R.id.button4).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.data.epifitas.MainActivity.class);
                startActivity(i);
                //    ((AppCompatActivity) getContext()).getSupportFragmentManager().beginTransaction().replace(R.id.container,new PersonalFragment()).commit();
            }
        });

        view.findViewById(R.id.button5).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.data.hidrologia.MainActivity.class);
                startActivity(i);
                //    ((AppCompatActivity) getContext()).getSupportFragmentManager().beginTransaction().replace(R.id.container,new PersonalFragment()).commit();
            }
        });

        final TextView button = view.findViewById(R.id.leGPS);

        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
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
        });

        view.findViewById(R.id.abreImageFolder).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.utils.galeria.MainActivity.class);
                startActivity(i);
            }
        });

        view.findViewById(R.id.abreCamera).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getContext(), com.soma.utils.camera.MainActivity.class);
                startActivity(i);
            }
        });

        loadSpinnerData();

        return view;
    }

    private void loadSpinnerData() {
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());
        List<String> parcelas = db.getAllParcelas();

        // Creating adapter for spinner
        ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(getContext(),android.R.layout.simple_spinner_item, parcelas);

        // Drop down layout style - list view with radio button
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        spinner.setPrompt("Select your favorite Planet!");

        spinner.setAdapter(
                new NothingSelectedSpinnerAdapter(
                        dataAdapter,
                        R.layout.contact_spinner_row_nothing_selected,
                        // R.layout.contact_spinner_nothing_selected_dropdown, // Optional
                        getContext()));

        // attaching data adapter to spinner
       // spinner.setAdapter(dataAdapter);
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
            Toast.makeText(getContext(), "GPS Is Enabled!", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(getContext(), "GPS Is Disabled!", Toast.LENGTH_SHORT).show();
        }
    }


    private void getCurrentLocation() {
        CheckGpsStatus();
        progressBar.setVisibility(View.VISIBLE);
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
                            textLatLong.setText(String.format("Latitude : %s\n Longitude: %s", lati, longi));
                            progressBar.setVisibility(View.GONE);

                        } else {
                            progressBar.setVisibility(View.GONE);

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
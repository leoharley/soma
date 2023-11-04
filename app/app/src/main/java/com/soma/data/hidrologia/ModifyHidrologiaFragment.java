package com.soma.data.hidrologia;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.DatabaseMainHandler;
import com.androidigniter.loginandregistration.R;
import com.soma.data.animais.ModAnimaisFragment;

import java.io.File;

/**
 * A simple {@link Fragment} subclass.
 */
public class ModifyHidrologiaFragment extends Fragment {

    private HidrologiaModel hidrologiaModel;
    EditText etidcontrole,
            etlatitude,
            etlongitude,
            etdescricao;

    Spinner spinner_parcela;
    private TextView etidparcela;
    private Button btnupdate, btndelete;
    private DatabaseHelperHidrologia databaseHelperHidrologia;
    TextView linkLatLong;
    String latParcela,longParcela;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.hidrologia_activity_modify, container, false);

        Bundle bundle=getArguments();
        hidrologiaModel = (HidrologiaModel) bundle.getSerializable("hidrologia");

        databaseHelperHidrologia = new DatabaseHelperHidrologia(getContext());
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());

        /* BUTTONS */
        btndelete = (Button) view.findViewById(R.id.btndelete);
        btnupdate = (Button) view.findViewById(R.id.btnupdate);

        /* EDITTEXT */
        etidparcela = (TextView) view.findViewById(R.id.et_idparcela);
        etidcontrole = (EditText) view.findViewById(R.id.et_idcontrole);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);
        etdescricao = (EditText) view.findViewById(R.id.et_descricao);

        etidcontrole.setText(hidrologiaModel.getetidcontrole());
        etidparcela.setText(hidrologiaModel.getetidparcela());
        etlatitude.setText(hidrologiaModel.getetlatitude());
        etlongitude.setText(hidrologiaModel.getetlongitude());
        etdescricao.setText(hidrologiaModel.getetdescricao());

        linkLatLong = (TextView) view.findViewById(R.id.et_linklatlong);
        latParcela = String.valueOf(db.getLatParcelas((String) etidparcela.getText()));
        longParcela = String.valueOf(db.getLongParcelas((String) etidparcela.getText()));

        linkLatLong.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                String uri = "geo:-"+latParcela+",-"+longParcela;
                Intent intent = new Intent(android.content.Intent.ACTION_VIEW, Uri.parse(uri));
                intent.setClassName("com.google.android.apps.maps", "com.google.android.maps.MapsActivity");
                startActivity(intent);
            }
        });

        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperHidrologia.updateHidrologia(hidrologiaModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),etdescricao.getText().toString());
                Toast.makeText(getContext(), "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModHidrologiaFragment(), false);
            }
        });

        btndelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
                builder.setTitle("CONFIRMAÇÃO");
                builder.setMessage("Deseja a exclusão deste registro?");
                // builder.setIcon(R.drawable.common_google_signin_btn_icon_light);
                builder.setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.dismiss();

                        databaseHelperHidrologia.deleteTable(hidrologiaModel.getId());

                        /* APAGA OS ARQUIVOS VINCULADOS */
                        File dir = new File(Environment.getExternalStorageDirectory()+File.separator+"images/hidrologia");
                        File[] files = dir.listFiles();
                        for (File file : files) {
                            if (file.getName().contains("-"+hidrologiaModel.getetidcontrole())) {
                                file.delete();
                            }
                        }

                        Toast.makeText(getContext(), "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                        for (Fragment fragment : getParentFragmentManager().getFragments()) {
                            getParentFragmentManager().beginTransaction().remove(fragment).commit();
                        }
                        goToFragment(new ModHidrologiaFragment(), false);

                    }
                });
                builder.setNegativeButton("Não", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.dismiss();
                    }
                });
                AlertDialog alert = builder.create();
                alert.show();
            }
        });

        view.findViewById(R.id.btnadicionafoto).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), com.soma.utils.camera.MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","hidrologia");
                startActivity(myIntent);
            }
        });

        view.findViewById(R.id.btngaleria).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), com.soma.utils.galeria.MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","hidrologia");
                startActivity(myIntent);
            }
        });

        return view;
    }

    private void selectValue(Spinner spinner, Object value) {
        for (int i = 0; i < spinner.getCount(); i++) {
            if (spinner.getItemAtPosition(i).equals(value)) {
                spinner.setSelection(i);
                break;
            }
        }
    }

    public Intent getIntent() {
        throw new RuntimeException("Stub!");
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
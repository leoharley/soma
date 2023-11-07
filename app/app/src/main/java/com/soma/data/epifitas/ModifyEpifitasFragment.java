package com.soma.data.epifitas;

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

import com.androidigniter.loginandregistration.DatabaseMainHandler;
import com.soma.data.animais.ModAnimaisFragment;
import com.toptoche.searchablespinnerlibrary.SearchableSpinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.R;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class ModifyEpifitasFragment extends Fragment {

    private EpifitasModel epifitasModel;
    EditText etidcontrole,
            etlatitude,
            etlongitude,
            etdescricao;

    Spinner spinner_parcela;

    SearchableSpinner
            spinner_familia,
            spinner_genero,
            spinner_especie;
    private TextView etidparcela;
    private Button btnupdate, btndelete;
    private DatabaseHelperEpifitas databaseHelperEpifitas;
    TextView linkLatLong;
    String latParcela,longParcela;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.epifitas_activity_modify, container, false);

        Bundle bundle=getArguments();
        epifitasModel = (EpifitasModel) bundle.getSerializable("epifitas");

        databaseHelperEpifitas = new DatabaseHelperEpifitas(getContext());
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());

        /* BUTTONS */
        btndelete = (Button) view.findViewById(R.id.btndelete);
        btnupdate = (Button) view.findViewById(R.id.btnupdate);

        /* SPINNERS */
        etidparcela = (TextView) view.findViewById(R.id.et_idparcela);
        spinner_familia = view.findViewById(R.id.spinner_familia);
        List<String> familias = new ArrayList<String>();
        familias.add(0,"SELECIONE");
        familias.addAll(db.getAllFloraFamilias());
        ArrayAdapter<String> adapter_spinner_familia = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, familias);

        adapter_spinner_familia.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_familia.setTitle("Pesquisar");
        spinner_familia.setPositiveButton("Fechar");
        spinner_familia.setAdapter(adapter_spinner_familia);

        spinner_genero = view.findViewById(R.id.spinner_genero);
        List<String> generos = new ArrayList<String>();
        generos.add(0,"SELECIONE");
        generos.addAll(db.getAllFloraGeneros());
        ArrayAdapter<String> adapter_spinner_genero = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, generos);

        adapter_spinner_genero.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_genero.setTitle("Pesquisar");
        spinner_genero.setPositiveButton("Fechar");
        spinner_genero.setAdapter(adapter_spinner_genero);

        spinner_especie = view.findViewById(R.id.spinner_especie);
        List<String> especies = new ArrayList<String>();
        especies.add(0,"SELECIONE");
        especies.addAll(db.getAllFloraEspecies());
        ArrayAdapter<String> adapter_spinner_especie = new ArrayAdapter<String>(getContext(),R.layout.simple_spinner_item, especies);

        adapter_spinner_especie.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_especie.setTitle("Pesquisar");
        spinner_especie.setPositiveButton("Fechar");
        spinner_especie.setAdapter(adapter_spinner_especie);

        /* EDITTEXT */
        etidcontrole = (EditText) view.findViewById(R.id.et_idcontrole);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);
        etdescricao = (EditText) view.findViewById(R.id.et_descricao);

        etidcontrole.setText(epifitasModel.getetidcontrole());
        etidparcela.setText(epifitasModel.getetidparcela());
        etlatitude.setText(epifitasModel.getetlatitude());
        etlongitude.setText(epifitasModel.getetlongitude());
        etdescricao.setText(epifitasModel.getetdescricao());
        selectValue(spinner_familia, epifitasModel.getetfamilia());
        selectValue(spinner_genero, epifitasModel.getetgenero());
        selectValue(spinner_especie, epifitasModel.getetespecie());

        linkLatLong = (TextView) view.findViewById(R.id.et_linklatlong);
        latParcela = String.valueOf(db.getLatParcelas((String) etidparcela.getText()));
        longParcela = String.valueOf(db.getLongParcelas((String) etidparcela.getText()));

        linkLatLong.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                String url = "https://www.google.com/maps/search/?api=1&query="+latParcela+","+longParcela+"";
                startActivity( new Intent(Intent.ACTION_VIEW).setData(Uri.parse(url)));
            }
        });

        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperEpifitas.updateEpifitas(epifitasModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),spinner_familia.getSelectedItem().toString(),
                        spinner_genero.getSelectedItem().toString(), spinner_especie.getSelectedItem().toString(),
                        etdescricao.getText().toString());
                Toast.makeText(getContext(), "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModEpifitasFragment(), false);
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

                        databaseHelperEpifitas.deleteTable(epifitasModel.getId());

                        /* APAGA OS ARQUIVOS VINCULADOS */
                        File dir = new File(Environment.getExternalStorageDirectory()+File.separator+"images/epifitas");
                        File[] files = dir.listFiles();
                        for (File file : files) {
                            if (file.getName().contains("-"+epifitasModel.getetidcontrole())) {
                                file.delete();
                            }
                        }

                        Toast.makeText(getContext(), "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                        for (Fragment fragment : getParentFragmentManager().getFragments()) {
                            getParentFragmentManager().beginTransaction().remove(fragment).commit();
                        }
                        goToFragment(new ModEpifitasFragment(), false);

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
                myIntent.putExtra("dscategoria","epifitas");
                startActivity(myIntent);
            }
        });

        view.findViewById(R.id.btngaleria).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), com.soma.utils.galeria.MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","epifitas");
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
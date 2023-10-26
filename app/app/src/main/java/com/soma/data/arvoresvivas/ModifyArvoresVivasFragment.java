package com.soma.data.arvoresvivas;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.Spinner;

import com.soma.data.animais.ModAnimaisFragment;
import com.toptoche.searchablespinnerlibrary.SearchableSpinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.core.content.ContextCompat;
import androidx.cursoradapter.widget.SimpleCursorAdapter;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.DatabaseMainHandler;
import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.NothingSelectedSpinnerAdapter;
import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class ModifyArvoresVivasFragment extends Fragment {

    private ArvoresVivasModel arvoresVivasModel;
    private EditText
            etidcontrole,
            etlatitude,
            etlongitude,
            etfamilia,
            etgenero,
            etespecie,
            etbiomassa,
            etidentificado,
            etgrauprotecao,
            etcircunferencia,
            etaltura,
            etalturatotal,
            etalturafuste,
            etalturacopa,
            etisolada,
            etfloracaofrutificacao;

    private TextView etidparcela;
    private Button btnupdate, btndelete;
    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;
    SearchableSpinner
            spinner_familia,
            spinner_genero,
            spinner_especie,
            spinner_identificado,
            spinner_grau_de_protecao;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.arvores_vivas_activity_modify, container, false);

        Bundle bundle=getArguments();
        arvoresVivasModel = (ArvoresVivasModel) bundle.getSerializable("arvoresvivas");

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(getContext());
        DatabaseMainHandler db = new DatabaseMainHandler(getContext());

        etidparcela = (TextView) view.findViewById(R.id.et_idparcela);
        etidcontrole = (EditText) view.findViewById(R.id.et_idcontrole);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);

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

        etbiomassa = (EditText) view.findViewById(R.id.et_biomassa);

        spinner_identificado = view.findViewById(R.id.spinner_identificado);
        ArrayAdapter<CharSequence> adapter_spinner_identificado = ArrayAdapter.createFromResource(getContext(),
                R.array.identificado_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_identificado.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_identificado.setTitle("Pesquisar");
        spinner_identificado.setPositiveButton("Fechar");
        spinner_identificado.setAdapter(adapter_spinner_identificado);

        spinner_grau_de_protecao = view.findViewById(R.id.spinner_grau_de_protecao);
        ArrayAdapter<CharSequence> adapter_spinner_grau_de_protecao = ArrayAdapter.createFromResource(getContext(),
                R.array.grau_de_protecao_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_grau_de_protecao.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_grau_de_protecao.setTitle("Pesquisar");
        spinner_grau_de_protecao.setPositiveButton("Fechar");
        spinner_grau_de_protecao.setAdapter(adapter_spinner_grau_de_protecao);

        etcircunferencia = (EditText) view.findViewById(R.id.et_circunferencia);
        etaltura = (EditText) view.findViewById(R.id.et_altura);
        etalturatotal = (EditText) view.findViewById(R.id.et_altura_total);
        etalturafuste = (EditText) view.findViewById(R.id.et_altura_fuste);
        etalturacopa = (EditText) view.findViewById(R.id.et_altura_copa);
        etisolada = (EditText) view.findViewById(R.id.et_isolada);
        etfloracaofrutificacao = (EditText) view.findViewById(R.id.et_floracao_frutificacao);

        btndelete = (Button) view.findViewById(R.id.btndelete);
        btnupdate = (Button) view.findViewById(R.id.btnupdate);

        etidcontrole.setText(arvoresVivasModel.getetidcontrole());
        etidparcela.setText(arvoresVivasModel.getetidparcela());
        etlatitude.setText(arvoresVivasModel.getetlatitude());
        etlongitude.setText(arvoresVivasModel.getetlongitude());
        selectValue(spinner_familia,arvoresVivasModel.getetfamilia());
        selectValue(spinner_genero,arvoresVivasModel.getetgenero());
        selectValue(spinner_especie,arvoresVivasModel.getetespecie());
        etbiomassa.setText(arvoresVivasModel.getetbiomassa());
        selectValue(spinner_identificado,arvoresVivasModel.getetidentificado());
        selectValue(spinner_grau_de_protecao,arvoresVivasModel.getetgrauprotecao());
        etcircunferencia.setText(arvoresVivasModel.getetcircunferencia());
        etaltura.setText(arvoresVivasModel.getetaltura());
        etalturatotal.setText(arvoresVivasModel.getetalturatotal());
        etalturafuste.setText(arvoresVivasModel.getetalturafuste());
        etalturacopa.setText(arvoresVivasModel.getetalturacopa());
        etisolada.setText(arvoresVivasModel.getetisolada());
        etfloracaofrutificacao.setText(arvoresVivasModel.getetfloracaofrutificacao());

        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperArvoresVivas.updateArvoresVivas(arvoresVivasModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),spinner_familia.getSelectedItem().toString(),
                        spinner_genero.getSelectedItem().toString(), spinner_especie.getSelectedItem().toString(), etbiomassa.getText().toString(), spinner_identificado.getSelectedItem().toString(),
                        spinner_grau_de_protecao.getSelectedItem().toString(), etcircunferencia.getText().toString(), etaltura.getText().toString(), etalturatotal.getText().toString(),
                        etalturafuste.getText().toString(), etalturacopa.getText().toString(), etisolada.getText().toString(), etfloracaofrutificacao.getText().toString());
                Toast.makeText(getContext(), "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModArvoresVivasFragment(), false);
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

                        databaseHelperArvoresVivas.deleteUSer(arvoresVivasModel.getId());
                        Toast.makeText(getContext(), "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                        for (Fragment fragment : getParentFragmentManager().getFragments()) {
                            getParentFragmentManager().beginTransaction().remove(fragment).commit();
                        }
                        goToFragment(new ModArvoresVivasFragment(), false);

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
                myIntent.putExtra("dscategoria","arvoresvivas");
                startActivity(myIntent);
            }
        });

        view.findViewById(R.id.btngaleria).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), com.soma.utils.galeria.MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","arvoresvivas");
                startActivity(myIntent);
            }
        });

        //selectValue(spinner_parcela,arvoresVivasModel.getetidparcela());

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
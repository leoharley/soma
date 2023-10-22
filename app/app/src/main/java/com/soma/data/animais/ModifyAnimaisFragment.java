package com.soma.data.animais;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import com.toptoche.searchablespinnerlibrary.SearchableSpinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.R;

/**
 * A simple {@link Fragment} subclass.
 */
public class ModifyAnimaisFragment extends Fragment {

    private AnimaisModel animaisModel;
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
    private TextView etidparcela;
    private Button btnupdate, btndelete;
    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.animais_activity_modify, container, false);

        Bundle bundle=getArguments();
        animaisModel = (AnimaisModel) bundle.getSerializable("animais");

        databaseHelperAnimais = new DatabaseHelperAnimais(getContext());

        /* BUTTONS */
        btndelete = (Button) view.findViewById(R.id.btndelete);
        btnupdate = (Button) view.findViewById(R.id.btnupdate);

        /* SPINNERS */
        etidparcela = (TextView) view.findViewById(R.id.et_idparcela);
        spinner_familia = view.findViewById(R.id.spinner_familia);
        ArrayAdapter<CharSequence> adapter_spinner_familia = ArrayAdapter.createFromResource(getContext(),
                R.array.familia_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_familia.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_familia.setTitle("Pesquisar");
        spinner_familia.setPositiveButton("Fechar");
        spinner_familia.setAdapter(adapter_spinner_familia);

        spinner_genero = view.findViewById(R.id.spinner_genero);
        ArrayAdapter<CharSequence> adapter_spinner_genero = ArrayAdapter.createFromResource(getContext(),
                R.array.genero_tmp, android.R.layout.simple_spinner_item);
        adapter_spinner_genero.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_genero.setTitle("Pesquisar");
        spinner_genero.setPositiveButton("Fechar");
        spinner_genero.setAdapter(adapter_spinner_genero);

        spinner_especie = view.findViewById(R.id.spinner_especie);
        ArrayAdapter<CharSequence> adapter_spinner_especie = ArrayAdapter.createFromResource(getContext(),
                R.array.especie_tmp, android.R.layout.simple_spinner_item);
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

        etidcontrole.setText(animaisModel.getetidcontrole());
        etidparcela.setText(animaisModel.getetidparcela());
        etlatitude.setText(animaisModel.getetlatitude());
        etlongitude.setText(animaisModel.getetlongitude());
        selectValue(spinner_familia, animaisModel.getetfamilia());
        selectValue(spinner_genero, animaisModel.getetgenero());
        selectValue(spinner_especie, animaisModel.getetespecie());
        selectValue(spinner_tpobservacao, animaisModel.getettpobservacao());
        selectValue(spinner_classificacao, animaisModel.getetclassificacao());
        selectValue(spinner_graudeprotecao, animaisModel.getetgrauprotecao());

        btnupdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                databaseHelperAnimais.updateAnimais(animaisModel.getId(),etlatitude.getText().toString(),etlongitude.getText().toString(),spinner_familia.getSelectedItem().toString(),
                        spinner_genero.getSelectedItem().toString(), spinner_especie.getSelectedItem().toString(), spinner_tpobservacao.getSelectedItem().toString(), spinner_classificacao.getSelectedItem().toString(),
                        spinner_graudeprotecao.getSelectedItem().toString());
                Toast.makeText(getContext(), "Atualizado com sucesso!", Toast.LENGTH_LONG).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModAnimaisFragment(), false);
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

                        databaseHelperAnimais.deleteTable(animaisModel.getId());
                        Toast.makeText(getContext(), "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                        for (Fragment fragment : getParentFragmentManager().getFragments()) {
                            getParentFragmentManager().beginTransaction().remove(fragment).commit();
                        }
                        goToFragment(new ModAnimaisFragment(), false);

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
                myIntent.putExtra("dscategoria","animais");
                startActivity(myIntent);
            }
        });

        view.findViewById(R.id.btngaleria).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent myIntent = new Intent(getContext(), com.soma.utils.galeria.MainActivity.class);
                myIntent.putExtra("idcontrole",etidcontrole.getText().toString());
                myIntent.putExtra("dscategoria","animais");
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
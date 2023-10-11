package com.soma.data.arvoresvivas;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.MainActivity;
import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

/**
 * A simple {@link Fragment} subclass.
 */
public class AddRegistroArvoresVivasFragment extends Fragment {

    private Button btnSalvar;
    private EditText etlatitude,
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

    private DatabaseHelperArvoresVivas databaseHelperArvoresVivas;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.arvores_vivas_activity_add_registro, container, false);

        databaseHelperArvoresVivas = new DatabaseHelperArvoresVivas(getContext());

        btnSalvar = (Button) view.findViewById(R.id.btnsalvar);
        etlatitude = (EditText) view.findViewById(R.id.et_latitude);
        etlongitude = (EditText) view.findViewById(R.id.et_longitude);
        etfamilia = (EditText) view.findViewById(R.id.et_familia);
        etgenero = (EditText) view.findViewById(R.id.et_genero);
        etespecie = (EditText) view.findViewById(R.id.et_especie);
        etbiomassa = (EditText) view.findViewById(R.id.et_biomassa);
        etidentificado = (EditText) view.findViewById(R.id.et_identificado);
        etgrauprotecao = (EditText) view.findViewById(R.id.et_grau_protecao);
        etcircunferencia = (EditText) view.findViewById(R.id.et_circunferencia);
        etaltura = (EditText) view.findViewById(R.id.et_altura);
        etalturatotal = (EditText) view.findViewById(R.id.et_altura_total);
        etalturafuste = (EditText) view.findViewById(R.id.et_altura_fuste);
        etalturacopa = (EditText) view.findViewById(R.id.et_altura_copa);
        etisolada = (EditText) view.findViewById(R.id.et_isolada);
        etfloracaofrutificacao = (EditText) view.findViewById(R.id.et_floracao_frutificacao);

        btnSalvar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

              /* String name = etlatitude.getText().toString();
                if (TextUtils.isEmpty(name)){
                    etlatitude.setError("Enter Name");
                    etlatitude.requestFocus();
                    return;
                } */ //CAMPOS OBRIGATÓRIOS

                databaseHelperArvoresVivas.addArvoresVivasDetail(
                        etlatitude.getText().toString(),
                        etlongitude.getText().toString(),
                        etfamilia.getText().toString(),
                        etgenero.getText().toString(),
                        etespecie.getText().toString(),
                        etbiomassa.getText().toString(),
                        etidentificado.getText().toString(),
                        etgrauprotecao.getText().toString(),
                        etcircunferencia.getText().toString(),
                        etaltura.getText().toString(),
                        etalturatotal.getText().toString(),
                        etalturafuste.getText().toString(),
                        etalturacopa.getText().toString(),
                        etisolada.getText().toString(),
                        etfloracaofrutificacao.getText().toString());

                Toast.makeText(getContext(), "Cadastro com sucesso!", Toast.LENGTH_SHORT).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModArvoresVivasFragment(), false);
            }
        });

        return view;
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
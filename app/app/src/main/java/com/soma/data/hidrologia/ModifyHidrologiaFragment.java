package com.soma.data.hidrologia;

import android.content.Context;
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
import android.widget.TextView;
import android.widget.Toast;

import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.R;

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

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.hidrologia_activity_modify, container, false);

        Bundle bundle=getArguments();
        hidrologiaModel = (HidrologiaModel) bundle.getSerializable("hidrologia");

        databaseHelperHidrologia = new DatabaseHelperHidrologia(getContext());

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
                databaseHelperHidrologia.deleteTable(hidrologiaModel.getId());
                Toast.makeText(getContext(), "Apagado com sucesso!", Toast.LENGTH_LONG).show();
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModHidrologiaFragment(), false);
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
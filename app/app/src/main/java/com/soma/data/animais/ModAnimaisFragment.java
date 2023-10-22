package com.soma.data.animais;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.androidigniter.loginandregistration.R;

import java.util.ArrayList;

/**
 * A simple {@link Fragment} subclass.
 */
public class ModAnimaisFragment extends Fragment {

    private ListView listView;
    private ArrayList<AnimaisModel> animaisModelArrayList;
    private CustomMod customMod;
    private DatabaseHelperAnimais databaseHelperAnimais;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.animais_activity_mod, container, false);

        listView = (ListView) view.findViewById(R.id.animais_lvi);

        databaseHelperAnimais = new DatabaseHelperAnimais(getContext());

        animaisModelArrayList = databaseHelperAnimais.getAllAnimais();

        customMod = new CustomMod(getContext(), animaisModelArrayList);
        listView.setAdapter(customMod);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModifyAnimaisFragment(), false, position);

                /*Intent intent = new Intent(getContext(), ModifyArvoresVivasActivity.class);
                intent.putExtra("arvoresvivas", arvoresVivasModelArrayList.get(position));
                startActivity(intent);*/
            }
        });

        Button BtnAddAnimais = (Button)view.findViewById(R.id.btn_add_animais);
        BtnAddAnimais.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getParentFragmentManager().getFragments()) {
                    getParentFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new AddRegistroAnimaisFragment(), false, null);
            }
        });

        return view;
    }

    public void goToFragment(Fragment fragment, boolean addToBackStack, Integer position) {
        FragmentTransaction transaction = getParentFragmentManager().beginTransaction();

        if (addToBackStack) {
            transaction.addToBackStack(null);
        }
        if (position == null) {
            getParentFragmentManager().beginTransaction().remove(fragment).commit();
            transaction.add(R.id.container, fragment).commit();
        } else {
            FragmentTransaction ft = getParentFragmentManager().beginTransaction();
            Bundle args = new Bundle();
            args.putSerializable("animais", animaisModelArrayList.get(position));
            fragment.setArguments(args);
            ft.remove(fragment);
            ft.commit();
            transaction.add(R.id.container, fragment).commit();
        }
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
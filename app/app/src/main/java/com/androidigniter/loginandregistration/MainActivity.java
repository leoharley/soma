package com.androidigniter.loginandregistration;
import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.soma.data.animais.ModAnimaisFragment;
import com.soma.data.arvoresvivas.ArvoresVivasFragment;
import com.soma.data.arvoresvivas.ModArvoresVivasFragment;
import com.soma.data.epifitas.ModEpifitasFragment;
import com.soma.data.hidrologia.ModHidrologiaFragment;

import java.util.ArrayList;
import java.util.Arrays;

import nl.psdcompany.duonavigationdrawer.views.DuoDrawerLayout;
import nl.psdcompany.duonavigationdrawer.views.DuoMenuView;
import nl.psdcompany.duonavigationdrawer.widgets.DuoDrawerToggle;

public class MainActivity extends AppCompatActivity implements DuoMenuView.OnMenuClickListener {
    private MenuAdapter mMenuAdapter;
    private ViewHolder mViewHolder;

    private SessionHandler session;

    private ArrayList<String> mTitles = new ArrayList<>();
    String dscategoria;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mTitles = new ArrayList<>(Arrays.asList(getResources().getStringArray(R.array.menuOptions)));

        SQLiteDatabase myDB =
                openOrCreateDatabase("campo_data", MODE_PRIVATE, null);

        session = new SessionHandler(getApplicationContext());
        User user = session.getUserDetails();

        final TextView button = findViewById(R.id.logout);
        final TextView hello = findViewById(R.id.hello);

        final TextView home = findViewById(R.id.home);
        final TextView opcao_arvoresvivas = findViewById(R.id.opcao_arvoresvivas);
        final TextView opcao_animais = findViewById(R.id.opcao_animais);
        final TextView opcao_epifitas = findViewById(R.id.opcao_epifitas);
        final TextView opcao_hidrologia = findViewById(R.id.opcao_hidrologia);
        final TextView opcao_sobre = findViewById(R.id.versaoapp);

        opcao_sobre.setText("Versão: "+(BuildConfig.VERSION_NAME).toString());


        myDB.execSQL(
                "CREATE TABLE IF NOT EXISTS arvoresvivas(id INTEGER PRIMARY KEY AUTOINCREMENT, etidparcela VARCHAR NOT NULL, etidcontrole VARCHAR NOT NULL, etlatitude TEXT NOT NULL, etlongitude TEXT NOT NULL, etfamilia VARCHAR, etgenero VARCHAR, etespecie VARCHAR, etbiomassa VARCHAR, etidentificado VARCHAR, etgrauprotecao VARCHAR, etcircunferencia VARCHAR, etaltura VARCHAR, etalturatotal VARCHAR, etalturafuste VARCHAR, etalturacopa VARCHAR, etisolada VARCHAR, etfloracaofrutificacao VARCHAR, etdescricao VARCHAR, etestagioregeneracao VARCHAR, etgrauepifitismo VARCHAR)"
        );

        myDB.execSQL(
                "CREATE TABLE IF NOT EXISTS animais(id INTEGER PRIMARY KEY AUTOINCREMENT, etidparcela VARCHAR NOT NULL, etidcontrole VARCHAR NOT NULL, etlatitude TEXT NOT NULL, etlongitude TEXT NOT NULL, etfamilia VARCHAR, etgenero VARCHAR, etespecie VARCHAR, ettpobservacao VARCHAR, etclassificacao VARCHAR, etgrauprotecao VARCHAR, etdescricao VARCHAR)"
        );

        myDB.execSQL(
                "CREATE TABLE IF NOT EXISTS hidrologia (id INTEGER PRIMARY KEY AUTOINCREMENT, etidparcela VARCHAR NOT NULL, etidcontrole VARCHAR NOT NULL, etlatitude TEXT NOT NULL, etlongitude TEXT NOT NULL, etdescricao VARCHAR)"
        );

        myDB.execSQL(
                "CREATE TABLE IF NOT EXISTS epifitas (id INTEGER PRIMARY KEY AUTOINCREMENT, etidparcela VARCHAR NOT NULL, etidcontrole VARCHAR NOT NULL, etlatitude TEXT NOT NULL, etlongitude TEXT NOT NULL, etfamilia VARCHAR, etgenero VARCHAR, etespecie VARCHAR, etdescricao VARCHAR)"
        );

        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                setTitle(mTitles.get(0));
                goToFragment(new MainFragment(), false);
                mViewHolder.mDuoDrawerLayout.closeDrawer();
                //    ((AppCompatActivity) getContext()).getSupportFragmentManager().beginTransaction().replace(R.id.container,new PersonalFragment()).commit();
            }
        });

        opcao_arvoresvivas.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                setTitle(mTitles.get(1));
                goToFragment(new ModArvoresVivasFragment(), false);
                mViewHolder.mDuoDrawerLayout.closeDrawer();
            }
        });

        opcao_animais.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                setTitle(mTitles.get(2));
                goToFragment(new ModAnimaisFragment(), false);
                mViewHolder.mDuoDrawerLayout.closeDrawer();
            }
        });

        opcao_epifitas.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                setTitle(mTitles.get(3));
                goToFragment(new ModEpifitasFragment(), false);
                mViewHolder.mDuoDrawerLayout.closeDrawer();
            }
        });

        opcao_hidrologia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                setTitle(mTitles.get(4));
                goToFragment(new ModHidrologiaFragment(), false);
                mViewHolder.mDuoDrawerLayout.closeDrawer();
            }
        });

        /*Intent myIntent = getIntent();
        dscategoria = myIntent.getStringExtra("dscategoria");
        if (dscategoria!=null) {
            if (dscategoria.equals("arvoresvivas")) {
                opcao_arvoresvivas.performClick();
            }
        }*/

       /* myDB.execSQL(
                "CREATE TABLE IF NOT EXISTS user (name VARCHAR(200), age INT, is_single INT)"
        );

        ContentValues row1 = new ContentValues();
        row1.put("name", "Alice");
        row1.put("age", 25);
        row1.put("is_single", 1);
        ContentValues row2 = new ContentValues();
        row2.put("name", "Bob");
        row2.put("age", 20);
        row2.put("is_single", 0);

        myDB.insert("user", null, row1);
        myDB.insert("user", null, row2);*/

        hello.setText("Olá, " + user.fullName);
        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                session.logoutUser();
                Intent i = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(i);
                finish();
                // Code here executes on main thread after user presses button
            }
        });

        // Initialize the views
        mViewHolder = new ViewHolder();

        // Handle toolbar actions
        handleToolbar();

        // Handle menu actions
        handleMenu();

        // Handle drawer actions
        handleDrawer();

       // @SuppressLint("WrongViewCast") Button logoutBtn = findViewById(R.id.logout);

        // Show main fragment in container
        goToFragment(new MainFragment(), false);
        mMenuAdapter.setViewSelected(0, true);
        setTitle(mTitles.get(0));
    }

    private void handleToolbar() {
        setSupportActionBar(mViewHolder.mToolbar);
    }

    private void handleDrawer() {
        DuoDrawerToggle duoDrawerToggle = new DuoDrawerToggle(this,
                mViewHolder.mDuoDrawerLayout,
                mViewHolder.mToolbar,
                R.string.navigation_drawer_open,
                R.string.navigation_drawer_close);

        mViewHolder.mDuoDrawerLayout.setDrawerListener(duoDrawerToggle);
        mViewHolder.mDuoDrawerLayout.setBackgroundColor(2);
        duoDrawerToggle.syncState();

    }

    private void handleMenu() {
        mMenuAdapter = new MenuAdapter(mTitles);

        mViewHolder.mDuoMenuView.setOnMenuClickListener(this);
        mViewHolder.mDuoMenuView.setAdapter(mMenuAdapter);
    }

    @Override
    public void onFooterClicked() {
        Toast.makeText(this, "onFooterClicked", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onHeaderClicked() {
        Toast.makeText(this, "onHeaderClicked", Toast.LENGTH_SHORT).show();
    }

    public void goToFragment(Fragment fragment, boolean addToBackStack) {
        FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();

        if (addToBackStack) {
            transaction.addToBackStack(null);
        }

        getSupportFragmentManager().beginTransaction().remove(fragment).commit();
        transaction.add(R.id.container, fragment).commit();
    }

    @Override
    public void onOptionClicked(int position, Object objectClicked) {
        // Set the toolbar title
       /* setTitle(mTitles.get(position));

        // Set the right options selected
        mMenuAdapter.setViewSelected(position, true);

        // Navigate to the right fragment
        switch (position) {
            case 1:
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new ModArvoresVivasFragment(), false);
                break;
            default:
                for (Fragment fragment : getSupportFragmentManager().getFragments()) {
                    getSupportFragmentManager().beginTransaction().remove(fragment).commit();
                }
                goToFragment(new MainFragment(), false);
                break;
        }

        // Close the drawer
        mViewHolder.mDuoDrawerLayout.closeDrawer();*/
    }


    private class ViewHolder {
        private DuoDrawerLayout mDuoDrawerLayout;
        private DuoMenuView mDuoMenuView;
        private Toolbar mToolbar;

        ViewHolder() {
            mDuoDrawerLayout = (DuoDrawerLayout) findViewById(R.id.drawer);
            mDuoMenuView = (DuoMenuView) mDuoDrawerLayout.getMenuView();
            mToolbar = (Toolbar) findViewById(R.id.toolbar);
        }
    }
}
package com.soma.data.animais;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.util.ArrayList;

/**
 * Created by Sayem on 12/5/2017.
 */

public class DatabaseHelperAnimais extends SQLiteOpenHelper {

    public static String DATABASE_NAME = "campo_data";
    private static final int DATABASE_VERSION = 17;
    private static final String TABLE_NAME = "animais";
    private static final String KEY_ID = "id";
    private static final String KEY_ETIDPARCELA = "etidparcela";
    private static final String KEY_ETIDCONTROLE = "etidcontrole";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETFAMILIA = "etfamilia";
    private static final String KEY_ETGENERO = "etgenero";
    private static final String KEY_ETESPECIE = "etespecie";
    private static final String KEY_ETTPOBSERVACAO = "ettpobservacao";
    private static final String KEY_ETCLASSIFICACAO = "etclassificacao";
    private static final String KEY_ETGRAUPROTECAO = "etgrauprotecao";
    private static final String KEY_ETDESCRICAO = "etdescricao";

    private static final String CREATE_TABLE_ANIMAIS = "CREATE TABLE IF NOT EXISTS "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETIDPARCELA + " VARCHAR NOT NULL, "+
            KEY_ETIDCONTROLE + " VARCHAR NOT NULL, "+
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETFAMILIA + " VARCHAR, "+
            KEY_ETGENERO + " VARCHAR, " +
            KEY_ETESPECIE + " VARCHAR, " +
            KEY_ETTPOBSERVACAO + " VARCHAR, " +
            KEY_ETCLASSIFICACAO + " VARCHAR, " +
            KEY_ETGRAUPROTECAO + " VARCHAR, " +
            KEY_ETDESCRICAO + " VARCHAR " +
            "); ";

    public DatabaseHelperAnimais(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);

        Log.d("table", CREATE_TABLE_ANIMAIS);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE_ANIMAIS);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS '" + TABLE_NAME + "'");
        onCreate(db);
    }

    public long addAnimaisDetail(String etidparcela, String etidcontrole, String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                      String etespecie, String ettpobservacao, String etclassificacao, String etgrauprotecao, String etdescricao) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETIDPARCELA, etidparcela);
        values.put(KEY_ETIDCONTROLE, etidcontrole);
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETTPOBSERVACAO, ettpobservacao);
        values.put(KEY_ETCLASSIFICACAO, etclassificacao);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);
        values.put(KEY_ETDESCRICAO, etdescricao);
        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    @SuppressLint("Range")
    public ArrayList<AnimaisModel> getAllAnimais() {
        ArrayList<AnimaisModel> animaisModelArrayList = new ArrayList<AnimaisModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                AnimaisModel animaisModel = new AnimaisModel();
                animaisModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                animaisModel.setetidparcela(c.getString(c.getColumnIndex(KEY_ETIDPARCELA)));
                animaisModel.setetidcontrole(c.getString(c.getColumnIndex(KEY_ETIDCONTROLE)));
                animaisModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                animaisModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                animaisModel.setetfamilia(c.getString(c.getColumnIndex(KEY_ETFAMILIA)));
                animaisModel.setetgenero(c.getString(c.getColumnIndex(KEY_ETGENERO)));
                animaisModel.setetespecie(c.getString(c.getColumnIndex(KEY_ETESPECIE)));
                animaisModel.setettpobservacao(c.getString(c.getColumnIndex(KEY_ETTPOBSERVACAO)));
                animaisModel.setetclassificacao(c.getString(c.getColumnIndex(KEY_ETCLASSIFICACAO)));
                animaisModel.setetgrauprotecao(c.getString(c.getColumnIndex(KEY_ETGRAUPROTECAO)));
                animaisModel.setetdescricao(c.getString(c.getColumnIndex(KEY_ETDESCRICAO)));
                // adding to list
                animaisModelArrayList.add(animaisModel);
            } while (c.moveToNext());
        }
        return animaisModelArrayList;
    }

    public int updateAnimais(int id, String etlatitude, String etlongitude, String etfamilia, String etgenero,
                             String etespecie, String ettpobservacao, String etclassificacao, String etgrauprotecao,
                             String etdescricao) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        //values.put(KEY_ETLATITUDE, etlatitude);
        //values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETTPOBSERVACAO, ettpobservacao);
        values.put(KEY_ETCLASSIFICACAO, etclassificacao);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);
        values.put(KEY_ETDESCRICAO, etdescricao);
        // update row in table base on students.is value
        return db.update(TABLE_NAME, values, KEY_ID + " = ?",
                new String[]{String.valueOf(id)});
    }

    public void deleteTable(int id) {

        // delete row in table based on id
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, KEY_ID + " = ?",
                new String[]{String.valueOf(id)});
    }

}

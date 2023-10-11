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
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "animais";
    private static final String KEY_ID = "id";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETFAMILIA = "etfamilia";
    private static final String KEY_ETGENERO = "etgenero";
    private static final String KEY_ETESPECIE = "etespecie";
    private static final String KEY_ETTIPOOBSERVACAO = "ettipoobservacao";
    private static final String KEY_ETCLASSIFICACAO = "etclassificacao";
    private static final String KEY_ETGRAUPROTECAO = "etgrauprotecao";



    private static final String CREATE_TABLE_ANIMAIS = "CREATE TABLE IF NOT EXISTS "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETFAMILIA + " VARCHAR, "+
            KEY_ETGENERO + " VARCHAR, " +
            KEY_ETESPECIE + " VARCHAR, " +
            KEY_ETTIPOOBSERVACAO + " VARCHAR, " +
            KEY_ETCLASSIFICACAO + " VARCHAR, " +
            KEY_ETGRAUPROTECAO + " VARCHAR " +
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

    public long addAnimaisDetail(String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                      String etespecie, String ettipoobservacao, String etclassificacao, String etgrauprotecao) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETTIPOOBSERVACAO, ettipoobservacao);
        values.put(KEY_ETCLASSIFICACAO, etclassificacao);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);

        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    @SuppressLint("Range")
    public ArrayList<AnimaisModel> getAllAnimais() {
        ArrayList<AnimaisModel> AnimaisModelArrayList = new ArrayList<AnimaisModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                AnimaisModel AnimaisModel = new AnimaisModel();
                AnimaisModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                AnimaisModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                AnimaisModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                AnimaisModel.setetfamilia(c.getString(c.getColumnIndex(KEY_ETFAMILIA)));
                AnimaisModel.setetgenero(c.getString(c.getColumnIndex(KEY_ETGENERO)));
                AnimaisModel.setetespecie(c.getString(c.getColumnIndex(KEY_ETESPECIE)));
                AnimaisModel.setettipoobservacao(c.getString(c.getColumnIndex(KEY_ETTIPOOBSERVACAO)));
                AnimaisModel.setetclassificacao(c.getString(c.getColumnIndex(KEY_ETCLASSIFICACAO)));
                AnimaisModel.setetgrauprotecao(c.getString(c.getColumnIndex(KEY_ETGRAUPROTECAO)));

                // adding to list
                AnimaisModelArrayList.add(AnimaisModel);
            } while (c.moveToNext());
        }
        return AnimaisModelArrayList;
    }

    public int updateAnimais(int id, String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                  String etespecie, String ettipoobservacao, String etclassificacao, String etgrauprotecao) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETTIPOOBSERVACAO, ettipoobservacao);
        values.put(KEY_ETCLASSIFICACAO, etclassificacao);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);

        // update row in table base on students.is value
        return db.update(TABLE_NAME, values, KEY_ID + " = ?",
                new String[]{String.valueOf(id)});
    }

    public void deleteUSer(int id) {

        // delete row in table based on id
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, KEY_ID + " = ?",
                new String[]{String.valueOf(id)});
    }

}

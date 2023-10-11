package com.soma.data.arvoresvivas;

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

public class DatabaseHelperArvoresVivas extends SQLiteOpenHelper {

    public static String DATABASE_NAME = "campo_data";
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "arvoresvivas";
    private static final String KEY_ID = "id";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETFAMILIA = "etfamilia";
    private static final String KEY_ETGENERO = "etgenero";
    private static final String KEY_ETESPECIE = "etespecie";
    private static final String KEY_ETBIOMASSA = "etbiomassa";
    private static final String KEY_ETIDENTIFICADO = "etidentificado";
    private static final String KEY_ETGRAUPROTECAO = "etgrauprotecao";
    private static final String KEY_ETCIRCUNFERENCIA = "etcircunferencia";
    private static final String KEY_ETALTURA = "etaltura";
    private static final String KEY_ETALTURATOTAL = "etalturatotal";
    private static final String KEY_ETALTURAFUSTE = "etalturafuste";
    private static final String KEY_ETALTURACOPA = "etalturacopa";
    private static final String KEY_ETISOLADA = "etisolada";
    private static final String KEY_ETFLORACAOFRUTIFICACAO = "etfloracaofrutificacao";


    private static final String CREATE_TABLE_ARVORES_VIVAS = "CREATE TABLE IF NOT EXISTS "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETFAMILIA + " VARCHAR, "+
            KEY_ETGENERO + " VARCHAR, " +
            KEY_ETESPECIE + " VARCHAR, " +
            KEY_ETBIOMASSA + " VARCHAR, " +
            KEY_ETIDENTIFICADO + " VARCHAR, " +
            KEY_ETGRAUPROTECAO + " VARCHAR, " +
            KEY_ETCIRCUNFERENCIA + " VARCHAR, " +
            KEY_ETALTURA + " VARCHAR, " +
            KEY_ETALTURATOTAL + " VARCHAR, " +
            KEY_ETALTURAFUSTE + " VARCHAR, " +
            KEY_ETALTURACOPA + " VARCHAR, " +
            KEY_ETISOLADA + " VARCHAR, " +
            KEY_ETFLORACAOFRUTIFICACAO + " VARCHAR " +
            "); ";

    public DatabaseHelperArvoresVivas(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);

        Log.d("table", CREATE_TABLE_ARVORES_VIVAS);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE_ARVORES_VIVAS);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS '" + TABLE_NAME + "'");
        onCreate(db);
    }

    public long addArvoresVivasDetail(String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                      String etespecie, String etbiomassa, String etidentificado, String etgrauprotecao,
                                      String etcircunferencia, String etaltura, String etalturatotal, String etalturafuste,
                                      String etalturacopa, String etisolada, String etfloracaofrutificacao) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETBIOMASSA, etbiomassa);
        values.put(KEY_ETIDENTIFICADO, etidentificado);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);
        values.put(KEY_ETCIRCUNFERENCIA, etcircunferencia);
        values.put(KEY_ETALTURA, etaltura);
        values.put(KEY_ETALTURATOTAL, etalturatotal);
        values.put(KEY_ETALTURAFUSTE, etalturafuste);
        values.put(KEY_ETALTURACOPA, etalturacopa);
        values.put(KEY_ETISOLADA, etisolada);
        values.put(KEY_ETFLORACAOFRUTIFICACAO, etfloracaofrutificacao);
        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    @SuppressLint("Range")
    public ArrayList<ArvoresVivasModel> getAllArvoresVivas() {
        ArrayList<ArvoresVivasModel> arvoresVivasModelArrayList = new ArrayList<ArvoresVivasModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                ArvoresVivasModel arvoresVivasModel = new ArvoresVivasModel();
                arvoresVivasModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                arvoresVivasModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                arvoresVivasModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                arvoresVivasModel.setetfamilia(c.getString(c.getColumnIndex(KEY_ETFAMILIA)));
                arvoresVivasModel.setetgenero(c.getString(c.getColumnIndex(KEY_ETGENERO)));
                arvoresVivasModel.setetespecie(c.getString(c.getColumnIndex(KEY_ETESPECIE)));
                arvoresVivasModel.setetbiomassa(c.getString(c.getColumnIndex(KEY_ETBIOMASSA)));
                arvoresVivasModel.setetidentificado(c.getString(c.getColumnIndex(KEY_ETIDENTIFICADO)));
                arvoresVivasModel.setetcircunferencia(c.getString(c.getColumnIndex(KEY_ETCIRCUNFERENCIA)));
				arvoresVivasModel.setetgrauprotecao(c.getString(c.getColumnIndex(KEY_ETGRAUPROTECAO)));
                arvoresVivasModel.setetaltura(c.getString(c.getColumnIndex(KEY_ETALTURA)));
                arvoresVivasModel.setetalturatotal(c.getString(c.getColumnIndex(KEY_ETALTURATOTAL)));
                arvoresVivasModel.setetalturafuste(c.getString(c.getColumnIndex(KEY_ETALTURAFUSTE)));
                arvoresVivasModel.setetalturacopa(c.getString(c.getColumnIndex(KEY_ETALTURACOPA)));
                arvoresVivasModel.setetisolada(c.getString(c.getColumnIndex(KEY_ETISOLADA)));
                arvoresVivasModel.setetfloracaofrutificacao(c.getString(c.getColumnIndex(KEY_ETFLORACAOFRUTIFICACAO)));
                // adding to list
                arvoresVivasModelArrayList.add(arvoresVivasModel);
            } while (c.moveToNext());
        }
        return arvoresVivasModelArrayList;
    }

    public int updateArvoresVivas(int id, String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                  String etespecie, String etbiomassa, String etidentificado, String etgrauprotecao,
                                  String etcircunferencia, String etaltura, String etalturatotal, String etalturafuste,
                                  String etalturacopa, String etisolada, String etfloracaofrutificacao) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);
        values.put(KEY_ETBIOMASSA, etbiomassa);
        values.put(KEY_ETIDENTIFICADO, etidentificado);
        values.put(KEY_ETGRAUPROTECAO, etgrauprotecao);
        values.put(KEY_ETCIRCUNFERENCIA, etcircunferencia);
        values.put(KEY_ETALTURA, etaltura);
        values.put(KEY_ETALTURATOTAL, etalturatotal);
        values.put(KEY_ETALTURAFUSTE, etalturafuste);
        values.put(KEY_ETALTURACOPA, etalturacopa);
        values.put(KEY_ETISOLADA, etisolada);
        values.put(KEY_ETFLORACAOFRUTIFICACAO, etfloracaofrutificacao);
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

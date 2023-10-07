package com.soma.data.Epifitas;

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

public class DatabaseHelperEpifitas extends SQLiteOpenHelper {

    public static String DATABASE_NAME = "campo_data";
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "Epifitas";
    private static final String KEY_ID = "id";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETFAMILIA = "etfamilia";
    private static final String KEY_ETGENERO = "etgenero";
    private static final String KEY_ETESPECIE = "etespecie";



    private static final String CREATE_TABLE_Epifitas = "CREATE TABLE "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETFAMILIA + " VARCHAR, "+
            KEY_ETGENERO + " VARCHAR, " +
            KEY_ETESPECIE + " VARCHAR, " +
            "); ";

    public DatabaseHelperEpifitas(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);

        Log.d("table", CREATE_TABLE_Epifitas);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE_Epifitas);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS '" + TABLE_NAME + "'");
        onCreate(db);
    }

    public long addEpifitasDetail(String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                      String etespecie) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);

        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    public ArrayList<EpifitasModel> getAllEpifitas() {
        ArrayList<EpifitasModel> EpifitasModelArrayList = new ArrayList<EpifitasModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                EpifitasModel EpifitasModel = new EpifitasModel();
                EpifitasModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                EpifitasModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                EpifitasModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                EpifitasModel.setetfamilia(c.getString(c.getColumnIndex(KEY_ETFAMILIA)));
                EpifitasModel.setetgenero(c.getString(c.getColumnIndex(KEY_ETGENERO)));
                EpifitasModel.setetespecie(c.getString(c.getColumnIndex(KEY_ETESPECIE)));

                // adding to list
                EpifitasModelArrayList.add(EpifitasModel);
            } while (c.moveToNext());
        }
        return EpifitasModelArrayList;
    }

    public int updateEpifitas(int id, String etlatitude, String etlongitude, String etfamilia, String etgenero,
                                  String etespecie) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETFAMILIA, etfamilia);
        values.put(KEY_ETGENERO, etgenero);
        values.put(KEY_ETESPECIE, etespecie);

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

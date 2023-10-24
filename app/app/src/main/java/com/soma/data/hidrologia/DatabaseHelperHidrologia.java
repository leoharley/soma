package com.soma.data.hidrologia;

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

public class DatabaseHelperHidrologia extends SQLiteOpenHelper {

    public static String DATABASE_NAME = "campo_data";
    private static final int DATABASE_VERSION = 10;
    private static final String TABLE_NAME = "hidrologia";
    private static final String KEY_ID = "id";
    private static final String KEY_ETIDPARCELA = "etidparcela";
    private static final String KEY_ETIDCONTROLE = "etidcontrole";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETDESCRICAO = "etdescricao";

    private static final String CREATE_TABLE_HIDROLOGIA = "CREATE TABLE IF NOT EXISTS "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETIDPARCELA + " VARCHAR NOT NULL, "+
            KEY_ETIDCONTROLE + " VARCHAR NOT NULL, "+
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETDESCRICAO + " VARCHAR "+
            "); ";

    public DatabaseHelperHidrologia(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);

        Log.d("table", CREATE_TABLE_HIDROLOGIA);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE_HIDROLOGIA);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS '" + TABLE_NAME + "'");
        onCreate(db);
    }

    public long addHidrologiaDetail(String etidparcela, String etidcontrole, String etlatitude, String etlongitude, String etdescricao) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETIDPARCELA, etidparcela);
        values.put(KEY_ETIDCONTROLE, etidcontrole);
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETDESCRICAO, etdescricao);
        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    @SuppressLint("Range")
    public ArrayList<HidrologiaModel> getAllHidrologia() {
        ArrayList<HidrologiaModel> hidrologiaModelArrayList = new ArrayList<HidrologiaModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                HidrologiaModel hidrologiaModel = new HidrologiaModel();
                hidrologiaModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                hidrologiaModel.setetidparcela(c.getString(c.getColumnIndex(KEY_ETIDPARCELA)));
                hidrologiaModel.setetidcontrole(c.getString(c.getColumnIndex(KEY_ETIDCONTROLE)));
                hidrologiaModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                hidrologiaModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                hidrologiaModel.setetdescricao(c.getString(c.getColumnIndex(KEY_ETDESCRICAO)));
                // adding to list
                hidrologiaModelArrayList.add(hidrologiaModel);
            } while (c.moveToNext());
        }
        return hidrologiaModelArrayList;
    }

    public int updateHidrologia(int id, String etlatitude, String etlongitude, String etdescricao) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        //values.put(KEY_ETLATITUDE, etlatitude);
        //values.put(KEY_ETLONGITUDE, etlongitude);
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

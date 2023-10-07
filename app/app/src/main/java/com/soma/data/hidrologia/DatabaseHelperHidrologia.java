package com.soma.data.Hidrologia;

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
    private static final int DATABASE_VERSION = 1;
    private static final String TABLE_NAME = "Hidrologia";
    private static final String KEY_ID = "id";
    private static final String KEY_ETLATITUDE = "etlatitude";
    private static final String KEY_ETLONGITUDE = "etlongitude";
    private static final String KEY_ETFAMILIA = "etdescricao";



    private static final String CREATE_TABLE_Hidrologia = "CREATE TABLE "
            + TABLE_NAME + "(" + KEY_ID
            + " INTEGER PRIMARY KEY AUTOINCREMENT," +
            KEY_ETLATITUDE + " TEXT NOT NULL, "+
            KEY_ETLONGITUDE + " TEXT NOT NULL, "+
            KEY_ETDESCRICAO + " VARCHAR, "+
            "); ";

    public DatabaseHelperHidrologia(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);

        Log.d("table", CREATE_TABLE_Hidrologia);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE_Hidrologia);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS '" + TABLE_NAME + "'");
        onCreate(db);
    }

    public long addHidrologiaDetail(String etlatitude, String etlongitude, String etdescricao) {
        SQLiteDatabase db = this.getWritableDatabase();
        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETDESCRICAO, etdescricao);

        //insert row in table
        long insert = db.insert(TABLE_NAME, null, values);

        return insert;
    }

    public ArrayList<HidrologiaModel> getAllHidrologia() {
        ArrayList<HidrologiaModel> HidrologiaModelArrayList = new ArrayList<HidrologiaModel>();

        String selectQuery = "SELECT  * FROM " + TABLE_NAME;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor c = db.rawQuery(selectQuery, null);
        // looping through all rows and adding to list
        if (c.moveToFirst()) {
            do {
                HidrologiaModel HidrologiaModel = new HidrologiaModel();
                HidrologiaModel.setId(c.getInt(c.getColumnIndex(KEY_ID)));
                HidrologiaModel.setetlatitude(c.getString(c.getColumnIndex(KEY_ETLATITUDE)));
                HidrologiaModel.setetlongitude(c.getString(c.getColumnIndex(KEY_ETLONGITUDE)));
                HidrologiaModel.setetdescricao(c.getString(c.getColumnIndex(KEY_ETDESCRICAO)));

                // adding to list
                HidrologiaModelArrayList.add(HidrologiaModel);
            } while (c.moveToNext());
        }
        return HidrologiaModelArrayList;
    }

    public int updateHidrologia(int id, String etlatitude, String etlongitude, String etfamilia) {
        SQLiteDatabase db = this.getWritableDatabase();

        // Creating content values
        ContentValues values = new ContentValues();
        values.put(KEY_ETLATITUDE, etlatitude);
        values.put(KEY_ETLONGITUDE, etlongitude);
        values.put(KEY_ETDESCRICAO, etdescricao);

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

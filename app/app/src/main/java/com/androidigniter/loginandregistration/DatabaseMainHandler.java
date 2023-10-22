package com.androidigniter.loginandregistration;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.List;

import java.util.ArrayList;

/**
 * Created by Sayem on 12/5/2017.
 */

public class DatabaseMainHandler extends SQLiteOpenHelper {

    private static final int DATABASE_VERSION = 6;
    private static final String DATABASE_NAME = "painel_data";
    private static final String TABLE_PARCELA_NAME = "parcelas";
    private static final String TABLE_FAMILIA_NAME = "familias";
    private static final String COLUMN_ID = "id";
    private static final String KEY_IDPARCELA = "etidparcela";
    private static final String KEY_NOPROPRIEDADE = "etnopropriedade";
    private static final String KEY_IDFAMILIA = "etidfamilia";
    private static final String KEY_NOFAMILIA = "etnofamilia";

    public DatabaseMainHandler(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }
    // Creating Tables
    @Override
    public void onCreate(SQLiteDatabase db) {
        // Category table create query
        String CREATE_PARCELA_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_PARCELA_NAME + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDPARCELA + " VARCHAR, "+
                KEY_NOPROPRIEDADE + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_PARCELA_TABLE);

        String CREATE_FAMILIA_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FAMILIA_NAME + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FAMILIA_TABLE);
    }

    // Upgrading database
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_PARCELA_NAME);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FAMILIA_NAME);
        // Create tables again
        onCreate(db);
    }

    public void apagaTabelaParcela(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_PARCELA_NAME, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFamilia(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FAMILIA_NAME, null, null);
        db.close(); // Closing database connection
    }

    public void insertParcela(String idparcela, String nopropriedade){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDPARCELA, idparcela);//column name, column value
        values.put(KEY_NOPROPRIEDADE, nopropriedade);//column name, column value

        // Inserting Row
        db.insert(TABLE_PARCELA_NAME, null, values);//tableName, nullColumnHack, CotentValues
        db.close(); // Closing database connection
    }

    public void insertFamilia(String idfamilia, String nofamilia){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value

        // Inserting Row
        db.insert(TABLE_FAMILIA_NAME, null, values);//tableName, nullColumnHack, CotentValues
        db.close(); // Closing database connection
    }

    public List<String> getAllParcelas(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_PARCELA_NAME;

        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            do {
                list.add("ID: "+cursor.getString(1)+"- Prop: "+cursor.getString(2));//adding 2nd column data
            } while (cursor.moveToNext());
        }
        // closing connection
        cursor.close();
        db.close();
        return list;
    }

    public List<String> getAllFamilias(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FAMILIA_NAME;

        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            do {
                list.add(cursor.getString(1)+" - "+cursor.getString(2));//adding 2nd column data
            } while (cursor.moveToNext());
        }
        // closing connection
        cursor.close();
        db.close();
        return list;
    }
}

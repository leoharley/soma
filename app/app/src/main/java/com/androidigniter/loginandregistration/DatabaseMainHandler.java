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

    private static final int DATABASE_VERSION = 10;
    private static final String DATABASE_NAME = "painel_data";
    private static final String TABLE_PARCELA_NAME = "tb_parcelas";
    private static final String TABLE_FAUNA_FAMILIA = "tb_fauna_familia";
    private static final String TABLE_FAUNA_GENERO = "tb_fauna_genero";
    private static final String TABLE_FAUNA_ESPECIE = "tb_fauna_especie";
    private static final String TABLE_FLORA_FAMILIA = "tb_flora_familia";
    private static final String TABLE_FLORA_GENERO = "tb_flora_genero";
    private static final String TABLE_FLORA_ESPECIE = "tb_flora_especie";
    private static final String COLUMN_ID = "id";
    private static final String KEY_IDPARCELA = "etidparcela";
    private static final String KEY_NOPROPRIEDADE = "etnopropriedade";
    private static final String KEY_IDFAMILIA = "etidfamilia";
    private static final String KEY_NOFAMILIA = "etnofamilia";
    private static final String KEY_NOPOPULAR = "etnopopular";

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

        String CREATE_FAUNA_FAMILIA_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FAUNA_FAMILIA + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FAUNA_FAMILIA_TABLE);

        String CREATE_FAUNA_GENERO_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FAUNA_GENERO + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FAUNA_GENERO_TABLE);

        String CREATE_FAUNA_ESPECIE_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FAUNA_ESPECIE + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR, " +
                KEY_NOPOPULAR + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FAUNA_ESPECIE_TABLE);

        String CREATE_FLORA_FAMILIA_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FLORA_FAMILIA + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FLORA_FAMILIA_TABLE);

        String CREATE_FLORA_GENERO_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FLORA_GENERO + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FLORA_GENERO_TABLE);

        String CREATE_FLORA_ESPECIE_TABLE = "CREATE TABLE IF NOT EXISTS "
                + TABLE_FLORA_ESPECIE + "(" + COLUMN_ID
                + " INTEGER PRIMARY KEY AUTOINCREMENT," +
                KEY_IDFAMILIA + " VARCHAR, "+
                KEY_NOFAMILIA + " VARCHAR, " +
                KEY_NOPOPULAR + " VARCHAR " +
                "); ";
        db.execSQL(CREATE_FLORA_ESPECIE_TABLE);
    }

    // Upgrading database
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_PARCELA_NAME);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FAUNA_FAMILIA);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FAUNA_GENERO);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FAUNA_ESPECIE);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FLORA_FAMILIA);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FLORA_GENERO);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_FLORA_ESPECIE);
        // Create tables again
        onCreate(db);
    }

    public void apagaTabelaParcela(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_PARCELA_NAME, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFaunaFamilia(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FAUNA_FAMILIA, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFaunaGenero(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FAUNA_GENERO, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFaunaEspecie(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FAUNA_ESPECIE, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFloraFamilia(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FLORA_FAMILIA, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFloraGenero(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FLORA_GENERO, null, null);
        db.close(); // Closing database connection
    }

    public void apagaTabelaFloraEspecie(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_FLORA_ESPECIE, null, null);
        db.close(); // Closing database connection
    }

    public void insertParcela(String idparcela, String nopropriedade){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDPARCELA, idparcela);//column name, column value
        values.put(KEY_NOPROPRIEDADE, nopropriedade);//column name, column value

        // Inserting Row
        db.insert(TABLE_PARCELA_NAME, null, values);//tableName, nullColumnHack, CotentValues
    //    db.close();
    }

    public void insertFaunaFamilia(String idfamilia, String nofamilia){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value

        // Inserting Row
        db.insert(TABLE_FAUNA_FAMILIA, null, values);//tableName, nullColumnHack, CotentValues
         // Closing database connection
    }

    public void insertFaunaGenero(String idfamilia, String nofamilia){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value

        // Inserting Row
        db.insert(TABLE_FAUNA_GENERO, null, values);//tableName, nullColumnHack, CotentValues
    }

    public void insertFaunaEspecie(String idfamilia, String nofamilia, String nopopular){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value
        values.put(KEY_NOPOPULAR, nopopular);//column name, column value

        // Inserting Row
        db.insert(TABLE_FAUNA_ESPECIE, null, values);//tableName, nullColumnHack, CotentValues
        db.close(); // Closing database connection
    }

    public void insertFloraFamilia(String idfamilia, String nofamilia){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value

        // Inserting Row
        db.insert(TABLE_FLORA_FAMILIA, null, values);//tableName, nullColumnHack, CotentValues
        db.close(); // Closing database connection
    }

    public void insertFloraGenero(String idfamilia, String nofamilia){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value

        // Inserting Row
        db.insert(TABLE_FLORA_GENERO, null, values);//tableName, nullColumnHack, CotentValues
        db.close(); // Closing database connection
    }

    public void insertFloraEspecie(String idfamilia, String nofamilia, String nopopular){
        SQLiteDatabase db = this.getWritableDatabase();

        ContentValues values = new ContentValues();
        values.put(KEY_IDFAMILIA, idfamilia);//column name, column value
        values.put(KEY_NOFAMILIA, nofamilia);//column name, column value
        values.put(KEY_NOPOPULAR, nopopular);//column name, column value

        // Inserting Row
        db.insert(TABLE_FLORA_ESPECIE, null, values);//tableName, nullColumnHack, CotentValues
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

    public int CountFaunaFamilias(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FAUNA_FAMILIA;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public int CountFaunaGeneros(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FAUNA_GENERO;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public int CountFaunaEspecies(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FAUNA_ESPECIE;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public int CountFloraFamilias(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FLORA_FAMILIA;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public int CountFloraGeneros(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FLORA_GENERO;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public int CountFloraEspecies(){
        String selectQuery = "SELECT COUNT(*) FROM " + TABLE_FLORA_ESPECIE;
        int contador = 0;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            contador = cursor.getInt(0);
        }
        cursor.close();
        db.close();
        return contador;
    }

    public List<String> getAllFaunaFamilias(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FAUNA_FAMILIA;

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

    public List<String> getAllFaunaGeneros(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FAUNA_GENERO;

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

    public List<String> getAllFaunaEspecies(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FAUNA_ESPECIE;

        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            do {
                if (!cursor.getString(3).isEmpty()) {
                    list.add(cursor.getString(1) + " - " + cursor.getString(2) + " (" + cursor.getString(3) + ")");//adding 2nd column data
                } else {
                    list.add(cursor.getString(1) + " - " + cursor.getString(2));
                }
            } while (cursor.moveToNext());
        }
        // closing connection
        cursor.close();
        db.close();
        return list;
    }

    public List<String> getAllFloraFamilias(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FLORA_FAMILIA;

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

    public List<String> getAllFloraGeneros(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FLORA_GENERO;

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

    public List<String> getAllFloraEspecies(){
        List<String> list = new ArrayList<String>();

        String selectQuery = "SELECT * FROM " + TABLE_FLORA_ESPECIE;

        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.rawQuery(selectQuery, null);//selectQuery,selectedArguments

        if (cursor.moveToFirst()) {
            do {
                if (!cursor.getString(3).isEmpty()) {
                    list.add(cursor.getString(1)+" - "+cursor.getString(2)+" ("+cursor.getString(3)+")");//adding 2nd column data
                } else {
                    list.add(cursor.getString(1)+" - "+cursor.getString(2));
                }
            } while (cursor.moveToNext());
        }
        // closing connection
        cursor.close();
        db.close();
        return list;
    }

}

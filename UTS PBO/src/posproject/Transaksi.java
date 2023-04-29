/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import static posproject.DBConnector.connection;
import java.sql.*;
import java.util.Random;


/**
 *
 * @author Lenovo
 */
public class Transaksi {
    
    public float totalBelanja;
    public float totalBayar;
    public float kembalian;
    public int transactionID;
    
    public int generateRandomTransactionID(){
        Random rand = new Random();
        int randomNum = rand.nextInt(000) + 1;
        return randomNum;
    }
    
    public void insertDataTransaksi(){
        try{
            
            String sql = "INSERT INTO TRANSAKSI (id_transaksi,total_harga,total_bayar,kembalian) VALUES (?,?,?,?);";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, transactionID);
            statement.setFloat(2, totalBelanja);
            statement.setFloat(3,totalBayar);
            statement.setFloat(4, kembalian);
            
            int rowInserted = statement.executeUpdate();
            if(rowInserted > 0){
                System.out.println("Transaksi Ditambahkan");
            }
            
            statement.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
}

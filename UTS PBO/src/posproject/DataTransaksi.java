/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import static posproject.DBConnector.connection;

/**
 *
 * @author Lenovo
 */
public class DataTransaksi {
    
    // daftar id barang yang dibeli
    // daftar jumlah barang yang dibeli
    
    public int transactionID;
    
    public ArrayList<Integer> daftarIdBarang = new ArrayList();
    public ArrayList<Integer> daftarJumlahBarang = new ArrayList();
    public ArrayList<Float> daftarHargaBarang = new ArrayList();
    
    public void insertDataTransaksi(){
        try{
            
            String sql = "INSERT INTO datatransaksi (id_transaksi,id_item,kuantitas,harga) VALUES (?,?,?,?);";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            for( int i = 0;i<daftarIdBarang.size();i++){
                
                statement.setInt(1, transactionID);
                statement.setFloat(2, daftarIdBarang.get(i));
                statement.setFloat(3,daftarJumlahBarang.get(i));
                statement.setFloat(4, daftarHargaBarang.get(i));
            
                int rowInserted = statement.executeUpdate();
                
                if(rowInserted > 0){
                    System.out.println("Data telah ditambah");
                }
            }
            
            statement.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dbutil;

import java.sql.DriverManager;

/**
 *
 * @author Shivansh
 */
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.SQLException;

public class DBConnection {
    private static Connection conn;
    static {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            System.out.println("Driver Successfully loaded");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@//DESKTOP-53UV125:1521/xe","e_voting_db","evoting");
            
        }
        catch(Exception ex) {
            System.out.println("Exception in Opening Connection");
        }
    }
    public static Connection getConnection() {
        return conn;
    }
    public static void closeConnection() {
        try{
            conn.close();
        }
        catch(Exception ex) {
            System.out.println("Exception in closing connection"+ex);
        }
    }
}

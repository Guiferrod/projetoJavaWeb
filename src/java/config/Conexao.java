/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.*;

/**
 *
 * @author guilh
 */
public class Conexao {
    
    public Connection conectar() throws SQLException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost/javaweb?user=root&password=");
        } catch(ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    
}

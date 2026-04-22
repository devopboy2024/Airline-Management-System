package com.web.project.helper;
import com.web.project.entities.UserLogin;
import java.sql.*;
public class ConnectionProvider {
   private static Connection con;
 public static Connection getconnection(){
 try{
     if(con==null){
       Class.forName("com.mysql.cj.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/connection","root","system");            

     }
 }
     catch(Exception e){
     e.printStackTrace();
    }
     return con;
 }
   
//public static void main(String args[]){
//    ConnectionProvider connection=new ConnectionProvider();
//   System.out.print( connection.getconnection());     
//   UserLogin val=new UserLogin();//object  create of UserLogin.java then fetch into user.dao
//    System.out.print(val.GetUsername());
//}
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

//the object is created in registerServlet
package com.web.project.entities;
import java.sql.*;

public class User {
    private int id;
    private String name;
    private String username;
    private String email;
    private String phoneno;
    private Timestamp r_datetime;
    private String password;
    private String repassword;
    private String profile;
    private String address;
    
    public User(int id,String name,String username,String email,Timestamp r_datetime,String phoneno,String password,String repassword){
    this.id=id;
    this.name=name;
    this.username=username;
    this.email=email;
    this.phoneno=phoneno;
    this.r_datetime=r_datetime;
    this.password=password;
    this.repassword=repassword;
  
    
    }
    public User(){
        
    }
      
   public User(String name,String username,String email,String phoneno,String password,String repassword){
    this.name=name;
    this.username=username;
    this.email=email;
    this.phoneno=phoneno;
    this.password=password;
    this.repassword=repassword;
    }
      // getter and setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
//        int val=Integer.parseInt(name);
//        String name=String.valueOf(val);
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public Timestamp getR_datetime() {
        return r_datetime;
    }

    public void setR_datetime(Timestamp r_datetime) {
        this.r_datetime = r_datetime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }
   
   public void setProfile(String profile){
       this.profile=profile;
   }
   public String getProfile(){
       return profile;
   }
   public void setaddress(String address){
       this.address=address;
   }
   public String getaddress(){
       return address;
   }
}


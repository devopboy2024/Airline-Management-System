
package com.web.project.entities;

public class UserLogin {
    private  String username;
    private String password;
    public  UserLogin(String username,String password){
        this.username=username;
        this.password=password;
    }
       public UserLogin(){//default constructor
        
    }
    public void SetUsername(String username){
        this.username=username;
    }
     public void SetPassword(String password){
        this.password=password;
    }
     public String GetUsername(){
         return username;
     }
     public String GetPassword(){
         return password;
     }
}

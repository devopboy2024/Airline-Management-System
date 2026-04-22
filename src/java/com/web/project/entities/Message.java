/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.web.project.entities;

/**
 *
 * @author hp
 */
public class Message {
    
    private String content;
    private String type;
    private String cssClass;
    
    public Message(String content,String type,String cssClass){
        this.content=content;
         this.type=type;
        this.cssClass=cssClass;
      
    }
//    getters and setters
    public void setcontent(String content){
        this.content=content;
    }
    public void setcssclass(String cssClass){
        this.cssClass=cssClass;
    }
    public void settype(String type){
        this.type=type;
    }
    public String gettype(){
        return type;
    }
    public String getcssclass(){
        return cssClass;
    }
    public String getcontent(){
        return content;
    }
}

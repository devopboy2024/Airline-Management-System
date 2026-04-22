/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.web.project.entities;

import java.time.LocalDate;
//import java.security.Timestamp;
public class AddFlight {
    private int id;
    private LocalDate Depature_date;
    private String Depature_time;
    private LocalDate Arrival_date;
    private String Arrival_time;
    private String from;
    private String to;
    private String Duration;
    private int price;
    private  String Select_airline;
    private int seat_no;
    private String Flightclass;
    private String Flightid;
    public  AddFlight(){
        
    }
    public AddFlight(LocalDate Depature_date,String Depature_time,LocalDate Arrival_date,String Arrival_time,String from,String to,String Duration ,int price,String Select_airline,int seat_no){
        this.Arrival_date=Arrival_date;
        this.Arrival_time=Arrival_time;
        this.Depature_date=Depature_date;
        this.Depature_time=Depature_time;
        this.from=from;
        this.to=to;
        this.price=price;
        this.Select_airline=Select_airline;
        this.Duration=Duration;
        this.seat_no=seat_no; 
    }
    public void setArrival_date(LocalDate Arrival_date){
        this.Arrival_date=Arrival_date;
    }
    public void setArrival_time(String Arrival_time){
        this.Arrival_time=Arrival_time;
    }
     public void setDepature_date(LocalDate Depature_date){
        this.Depature_date=Depature_date;
    }
     public void setDepature_time(String Depature_time){
        this.Depature_time=Depature_time;
    }
     public void setfrom(String from){
        this.from=from;
    }
     
     public void setTo(String to){
         this.to=to;
     }
     public void setprice(int price){
         this.price=price;
     }
     public void setSelect_airline(String Select_airline){
         this.Select_airline=Select_airline;
     }
     public void setDuration(String Duration){
         this.Duration=Duration;
     }
     public void setFlightclass(String Flightclass){
         this.Flightclass=Flightclass;
     }
     public void setSeat_no(int seat_no){
         this.seat_no=seat_no;
     }
//  getter
     public String getDuration(){
         return Duration;
     }
     public String getSelect_airline(){
         return Select_airline;
     }
     public int getprice(){
         return price;
     }
     public String getTo(){
         return to;
     }
     public String getFrom(){
         return from;
     }
     public String getDepaturetime(){
         return Depature_time;
     }
     public LocalDate getDepaturedate(){
         return  Depature_date;
     }
     public LocalDate getArrivaldate(){
         return Arrival_date;
     }
     public String getArrivaltime(){
         return Arrival_time;
     }   
     public int getSeatno(){
         return seat_no;
     }
     public void setid(int id){
         this.id=id;
     }
     public int getid(){
         return id;
     }
     public String getFlightclass(){
         return Flightclass;
     }
     public void setflightid(String flightid){
         Flightid=flightid;
     }
     public String getflightid(){
         return Flightid;
     }
}

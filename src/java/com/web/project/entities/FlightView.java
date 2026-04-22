/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.web.project.entities;


/**
 *
 * @author hp
 */
public class FlightView {
    private int flightid;
    
    public FlightView(int flightid){
        this.flightid=flightid;   
    }
    public int getFlight(){
        return flightid;
    }
    public FlightView(){
        
    }
    public void setflight(int flightid){
       this.flightid=flightid;
    }
//    public static void main(String args[]){
////        FlightView flightview=new FlightView();
////        flightview.setflight(183);
////        System.out.print(flightview.getFlight());
//      
//    }
}

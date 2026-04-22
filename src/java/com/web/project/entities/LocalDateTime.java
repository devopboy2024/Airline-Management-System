/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.web.project.entities;

/**
 *
 * @author hp
 */
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
 public class LocalDateTime {

    
public static void main(String[] args) {
    LocalDate dt=LocalDate.now();
    System.out.println(dt);


   
    DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyyy");
//    DateTimeFormatter df2=DateTimeFormatter.ISO_DATE_TIME;
    String myDate=dt.format(df);
    System.out.print(myDate);
    System.out.print("hii");   
}
}


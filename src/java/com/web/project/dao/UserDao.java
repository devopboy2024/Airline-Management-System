
package com.web.project.dao;
import com.web.project.entities.FlightView;
import com.web.project.entities.AddFlight;
import java.io.IOException;
import com.web.project.entities.User;
import com.web.project.entities.UserLogin;
import com.web.project.helper.ConnectionProvider;
import java.time.format.DateTimeFormatter;
import java.sql.*;
import java.time.LocalDate;
import javax.swing.text.DateFormatter;
public class UserDao {
    private static Connection con;
    public UserDao(Connection con){//connection constructor
        this.con=con;
    }
     
    // the data fetch through User object
     public boolean savedata(User user){ 
         boolean f=false;
         try{
           String query = "INSERT INTO register(name,username,email,phoneno,password,repassword)VALUES(?,?,?,?,?,?)";
           PreparedStatement pstmt=con.prepareStatement(query);
           pstmt.setString(1,user.getName());
           pstmt.setString(2,user.getUsername());
           pstmt.setString(3,user.getEmail());
           pstmt.setString(4,user.getPhoneno());
           pstmt.setString(5,user.getPassword());
           pstmt.setString(6,user.getRepassword());
           pstmt.executeUpdate();
           f=true;
  
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return f;
     }
     public User loginusers(String username, String password){
         
         User data=null;
         try{
             
            String query="select * from register where username=? AND password=?";//create dynamic query for  later fill and match with logindata 
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            
            ResultSet set=pstmt.executeQuery();//we can store in Resultset datatype for matching record in db
            if(set.next()){// match qowwise in database
                 data=new User();
                String uname=set.getString("name");//fetch data from database it is predefined method
                String userName=set.getString("username");
                String uemail=set.getString("email");
                String uphone=set.getString("phoneno");
                String uprofile=set.getString("profile");
                Integer uid=set.getInt("id");
                String upass=set.getString("password");
//                Timestamp r_datetime=set.getTimestamp("rdate");
                

               
                
                //here we store the information for later fetch data
                data.setName(uname);
                data.setUsername(userName);
                data.setEmail(uemail);
                data.setPhoneno(uphone);
                data.setProfile(uprofile);
                data.setId(uid);
                data.setR_datetime(set.getTimestamp("rdate"));
                data.setPassword(upass);
            }

         
     }
         catch(Exception e){
         e.printStackTrace();
         }
         return data;
     }
     
     public boolean AdminLogin(String username,String password){
        boolean data=false;
         try{
         String query="select * from login  where username=? AND pass=? ";
         PreparedStatement pstmt=con.prepareStatement(query);
        pstmt.setString(1,username);
        pstmt.setString(2,password);
        ResultSet set=pstmt.executeQuery();
        if(set.next()){
           data=true;
        }
         }
          catch(Exception e){ 
             e.printStackTrace();
         } 
         
        return data;
               
     }
     
         public boolean UserAddFlight(AddFlight addflight){
             boolean data=false;
             
               DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyyy");
                try{
                 String query="insert into addflight(dep,deptime,des,destime,depfrom,desto,duration,price,selctairline,seatno)VALUES(?,?,?,?,?,?,?,?,?,?);";
                   PreparedStatement pstmt=con.prepareStatement(query);
                   String l=df.format(addflight.getDepaturedate());
                   String m=df.format(addflight.getArrivaldate());
                     pstmt.setString(1,l);
                     pstmt.setString(2,addflight.getDepaturetime());
                     pstmt.setString(3,m);
                     pstmt.setString(4, addflight.getArrivaltime());
                     pstmt.setString(5, addflight.getFrom());
                     pstmt.setString(6,addflight.getTo());
                     pstmt.setString(7,addflight.getDuration());
                     pstmt.setInt(8,addflight.getprice());
                     pstmt.setString(9,addflight.getSelect_airline());
                     pstmt.setInt(10,addflight.getSeatno());
                     pstmt.executeUpdate();
                    data=true;
                 
}
          catch(Exception e){
         e.printStackTrace();
}
return data;
}
         public AddFlight EditFlight(int searchid){
            AddFlight data=null;
             try{ 
//                      AddFlight addflightt=new AddFlight();
                      String queryy="select * from addflight where id=?";
                      PreparedStatement psmt=con.prepareStatement(queryy);
                      psmt.setInt(1,searchid);
                      ResultSet set=psmt.executeQuery();
                      if(set.next()){
                       int id=set.getInt("id");
                       String depaturedate=set.getString("dep");
                       String depaturetime=set.getString("deptime");
                       String destinationdate=set.getString("des");
                       String destinationtime=set.getString("destime");
                       String from=set.getString("depfrom");
                       String to=set.getString("desto");
                       String durationn=set.getString("duration");
                       int pricee=set.getInt("price");
                       String selectairline=set.getString("selctairline");
                       int seatnoo=set.getInt("seatno");
                         data = new AddFlight();
                       data.setid(id);
//                       LocalDate ll=LocalDate.parse(destinationdate);
//                       data.setArrival_date(ll);
//                       LocalDate mm=LocalDate.parse(depaturedate);
//                       data.setDepature_date(mm);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate departureLocalDate = LocalDate.parse(depaturedate, formatter);
            LocalDate arrivalLocalDate = LocalDate.parse(destinationdate, formatter);
                       data.setDepature_date(departureLocalDate);
                       data.setArrival_date(arrivalLocalDate);
                       data.setArrival_time(destinationtime);
                       data.setDepature_time(depaturetime);
                       data.setfrom(from);
                       data.setTo(to);
                       data.setprice(pricee);
                       data.setDuration(durationn);
                       data.setSeat_no(seatnoo);
                       data.setSelect_airline(selectairline);
                      
                      }
                     
                     
             }
             
             catch(SQLException e){
        e.printStackTrace();
   }
      return data;      
         }
       
      //
         public boolean UpdateUser(User user){
             boolean f=false;
             try{
               String query="update register set name=? , username=? , phoneno=? , password=? , email=?, profile=? where id=?"; 
               PreparedStatement pstmt=con.prepareStatement(query);
               pstmt.setString(1,user.getName());
               pstmt.setString(2,user.getUsername());
               pstmt.setString(3,user.getPhoneno());
               pstmt.setString(4,user.getPassword());
               pstmt.setString(5,user.getEmail());
               pstmt.setString(6,user.getProfile());
               pstmt.setInt(7,user.getId());
              
               
               pstmt.executeUpdate();
               f=true;
             }
             catch(Exception e){
                 e.printStackTrace();
             }
             return f;
         }
         
         
         public boolean UpdateFlight(AddFlight edit){
             boolean f=false;
          DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyyy");

             try{
                 String query="update addflight set depfrom=?,desto=?,selctairline=?,dep=?,deptime=?,destime=?,seatno=?,price=?";
                 PreparedStatement pstmt=con.prepareStatement(query);
                 String l=df.format(edit.getDepaturedate());
                 
                 pstmt.setString(1,edit.getFrom());
                 pstmt.setString(2,edit.getTo());
                 pstmt.setString(3,edit.getSelect_airline());
                 pstmt.setString(4,l);
                 pstmt.setString(5,edit.getArrivaltime());
                 pstmt.setInt(6,edit.getSeatno());
                 pstmt.setInt(7,edit.getprice());
                 
                 pstmt.executeUpdate();
                 f=true;
             }
             catch(Exception e){
                 e.printStackTrace();
             }
             return f;
         }
        public AddFlight TicketBooking(String flightclass,int id){
           AddFlight booking=null; 
           try{
             
             String queryy="select * from addflight where id=?";
                      PreparedStatement psmt=con.prepareStatement(queryy);
                      psmt.setInt(1,id);
                      ResultSet set=psmt.executeQuery();
                      if(set.next()){
                       int flightid=set.getInt("id");
                       String depaturedate=set.getString("dep");
                       String depaturetime=set.getString("deptime");
                       String destinationdate=set.getString("des");
                       String destinationtime=set.getString("destime");
                       String from=set.getString("depfrom");
                       String to=set.getString("desto");
                       String durationn=set.getString("duration");
                       int pricee=set.getInt("price");
                       String selectairline=set.getString("selctairline");
                       int seatnoo=set.getInt("seatno");
                       booking=new AddFlight();
                       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate departureLocalDate = LocalDate.parse(depaturedate, formatter);
            LocalDate arrivalLocalDate = LocalDate.parse(destinationdate, formatter);
                       booking.setDepature_date(departureLocalDate);
                       booking.setArrival_date(arrivalLocalDate);
                       booking.setArrival_time(destinationtime);
                       booking.setDepature_time(depaturetime);
                       booking.setfrom(from);
                       booking.setTo(to);
                       booking.setprice(pricee);
                       booking.setDuration(durationn);
                       booking.setSeat_no(seatnoo);
                       booking.setSelect_airline(selectairline);
                       booking.setid(flightid);
                       booking.setFlightclass(flightclass);
                      }
                      
           }
           catch(Exception e){
               e.printStackTrace();
           }
            return booking; 
         }
       
        public User ProfileDisplay(User uss,AddFlight book){
            User dd=new User();
          DateTimeFormatter df=DateTimeFormatter.ofPattern("dd/MM/yyyy");

            try{
                String query="INSERT INTO FlightProfile (uname, email, mobile, address, flightname, flightclass, flightid, ufrom, uto, depaturedate,depaturetime,arrivaltime, money, totalseat)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setString(1,uss.getName());
                pstmt.setString(2,uss.getEmail());
                pstmt.setString(3,uss.getPhoneno());
                pstmt.setString(4,uss.getaddress());
                pstmt.setString(5,book.getSelect_airline());
                pstmt.setString(6,book.getFlightclass());
                pstmt.setString(7,book.getflightid());
                pstmt.setString(8,book.getFrom());
                pstmt.setString(9,book.getTo());
                String depaturedate=df.format(book.getDepaturedate());
                pstmt.setString(10,depaturedate);
               pstmt.setString(11,book.getDepaturetime());
               pstmt.setString(12,book.getArrivaltime());
               pstmt.setInt(13,book.getprice());
               String seatno=String.valueOf(book.getSeatno());
               pstmt.setString(14,seatno);
               pstmt.executeUpdate();
               dd.setId(uss.getId());
               dd.setEmail(uss.getEmail());
               dd.setPhoneno(uss.getPhoneno());
               dd.setaddress(uss.getaddress());
            }catch(Exception e){
                e.printStackTrace();
            }
            return dd;
        }
        public boolean payment(String name,String registrationid,String userid,String address,int flightid,String flightname,String transcation){
            boolean dd=false;
            try{
                String query="INSERT INTO payment(address,uname,registerationid,userid,flightid,flightname,transcation)VALUES(?,?,?,?,?,?,?)";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setString(1,address);
                pstmt.setString(2,name);
                pstmt.setString(3,registrationid);
                pstmt.setString(4,userid);
                pstmt.setInt(5,flightid );
                pstmt.setString(6,flightname );
                pstmt.setString(7,transcation);               
                pstmt.executeUpdate();
                dd=true;
                
            }catch(Exception e){
                e.printStackTrace();
            }
            return dd;
        }
        public boolean Flightdelete(int id,String name){
            boolean f=false;
            try{
                String query="Delete from flightprofile where id=? and uname=?";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setInt(1,id);
                pstmt.setString(2,name);
                int rowaffected=pstmt.executeUpdate();
                if(rowaffected >0){
                    f=true;
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return f;
        }
          public boolean Flightconform(int id,String name){
            boolean f=false;
            try{
                String query="update  flightprofile set flightstatus='confirmed' where id=? and uname=?";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setInt(1,id);
                pstmt.setString(2,name);
                int rowaffected=pstmt.executeUpdate();
                if(rowaffected >0){
                    f=true;
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            return f;
        }

}

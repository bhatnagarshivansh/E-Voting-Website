/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.CandidateDto;
import evoting.dto.DeleteUser;
import evoting.dto.ShowUserDto;
import evoting.dto.UserDTO;
import evoting.dto.UserDetails;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author Shivansh
 */
public class UserDAO {
    private static PreparedStatement ps,ps2,ps3,ps4,ps6,ps7,ps8,ps9,ps10,ps11,ps12;
    private static Statement st,st2;
    static {
        try {
            Connection conn=DBConnection.getConnection();
            ps=conn.prepareStatement("select * from user_details where adhar_no=? and password=?");
            ps2=conn.prepareStatement("select candidate_id,username,party,symbol from candidate,user_details where candidate.user_id=user_details.adhar_no and candidate.city=(select city from user_details where adhar_no=?) and candidate.status='y'");
            st=conn.createStatement();
            st2=conn.createStatement();
            
            ps11=DBConnection.getConnection().prepareStatement("delete from voting where voter_id=?");
            ps12=DBConnection.getConnection().prepareStatement("update candidate set status='n' where user_id=?");
            ps3=conn.prepareStatement("select adhar_no,username,address,city,email,mobile_no from user_details where adhar_no=? and status='y'");
            ps4=conn.prepareStatement("update user_details set status='n' where adhar_no=?");
            ps6=DBConnection.getConnection().prepareStatement("select * from user_details where adhar_no=?");
            ps7=DBConnection.getConnection().prepareStatement("select candidate_id from candidate where user_id=?");
            ps8=DBConnection.getConnection().prepareStatement("delete from voting where candidate_id=?");
            ps9= DBConnection.getConnection().prepareStatement("update user_details set password=?,username=?,address=?,city=?,email=?,mobile_no=? where adhar_no=?");
            ps10 = DBConnection.getConnection().prepareStatement("select * from user_details where adhar_no=? and status='y'");
        }
        catch(Exception ex) {
            System.out.println("Error in DB conn:"+ex);
        }
    }
    public static String validateUser(UserDTO user) throws SQLException {
          ps.setString(1,user.getUserid());
          ps.setString(2,user.getPassword());
          ResultSet rs=ps.executeQuery();
          if(rs.next()) {
              return rs.getString(8);
          }
          else {
              return null;
          }
    }
    public static ArrayList<CandidateDto> viewCandidate(String userid) throws SQLException,IOException {
        ArrayList<CandidateDto> candidate =new ArrayList<>();
        ps2.setString(1, userid);
        ResultSet rs=ps2.executeQuery();
        Blob blob;
        byte[] imageBytes;
        String base64Image;
        while(rs.next()) {
            blob=rs.getBlob(4);
            imageBytes=blob.getBytes(1l, (int)blob.length());
            base64Image=Base64.getEncoder().encodeToString(imageBytes);
            candidate.add(new CandidateDto(rs.getString(1),rs.getString(2),rs.getString(3),base64Image));
           
        }
        return candidate;
    }
    public static ArrayList<ShowUserDto> showallvoters() throws SQLException,IOException {
        ArrayList<ShowUserDto> users=new ArrayList<>();
        
        ResultSet rs=st.executeQuery("select adhar_no,username,address,city,email,mobile_no from user_details where status='y'");
        while(rs.next()) {
            ShowUserDto show=new ShowUserDto();
            show.setUserid(rs.getString(1));
            show.setUsername(rs.getString(2));
            show.setAddress(rs.getString(3));
            show.setCity(rs.getString(4));
            show.setEmail(rs.getString(5));
            show.setMobile(rs.getLong(6));
            users.add(show);
            
        }
         System.out.println(users);
        return users;
    }
    public static ArrayList<String> getUserId() throws SQLException {
        ResultSet rs=st2.executeQuery("select adhar_no from user_details where status='y'");
         ArrayList<String> users=new ArrayList<>();
        while(rs.next()) {
           
           users.add(rs.getString(1));
        }
        return users;
    }
    public static ShowUserDto getUserDetails(String userid) throws SQLException {
        ps3.setString(1,userid);
        ResultSet rs=ps3.executeQuery();
        ShowUserDto user=new ShowUserDto();
        if(rs.next()) {
            
            user.setUserid(userid);
            user.setUsername(rs.getString(2));
            user.setAddress(rs.getString(3));
            user.setCity(rs.getString(4));
            user.setEmail(rs.getString(5));
            user.setMobile(rs.getLong(6));
        }
        return user;
    }
    public static boolean deleteUser(String userid) throws SQLException {
        ps4.setString(1, userid);
        int res=ps4.executeUpdate();
        return res!=0;
    }
//    public static boolean deleteUser(String uid)throws SQLException
//       {
//           ps2.setString(1,uid);
//           return (ps2.executeUpdate()!=0);
//       }
    public static int delVoteAsDelUser(String uid)throws SQLException
        {
          ps11.setString(1,uid);
          int result=ps11.executeUpdate();
          return result;
        }
    public static boolean delCandAsDelUser(String uid)throws SQLException
    {
        ps12.setString(1,uid);
        return (ps12.executeUpdate()!=0);
        
    }
    public static DeleteUser getDetailsByUserId(String uid)throws SQLException
    {
        ps6.setString(1,uid);
        ResultSet rs=ps6.executeQuery();
        DeleteUser user=new DeleteUser();
        if(rs.next())
        {
            user.setUsername(rs.getString(3));
            user.setEmail(rs.getString(6));
            user.setMobile(rs.getLong(7));
            user.setAddress(rs.getString(4));
            user.setCity(rs.getString(5));
            
        }
        return user;
    }
   
    public static ArrayList<UserDetails> showUsers() throws SQLException
    {
        ArrayList<UserDetails> user=new ArrayList<>();
        ResultSet rs=st2.executeQuery("select * from user_details where status='y'");
        while(rs.next())
        {
            UserDetails u=new UserDetails(rs.getString(3),rs.getString(1),rs.getString(6),rs.getString(4),rs.getLong(7),rs.getString(5),rs.getString(2));
            user.add(u);
        }
        return user;
    }
      public static String getCandidateId(String userid)throws SQLException
    {
        ps7.setString(1,userid);
        ResultSet rs=ps7.executeQuery();
        if(rs.next())
        {
            return rs.getString(1);
        }
        return null;
    }
     public static int delVoteByCid(String cid)throws SQLException
        {
          ps8.setString(1,cid);
          int result=ps8.executeUpdate();
          return result;
        }
     public static boolean updateUser(UserDetails user, String uid) throws SQLException{
         ps9.setString(1, user.getPassword());
         ps9.setString(2, user.getUsername());
         ps9.setString(3, user.getAddress());
         ps9.setString(4, user.getCity());
         ps9.setString(5, user.getEmail());
         ps9.setLong(6, user.getMobile());
         ps9.setString(7, uid);
         return (ps9.executeUpdate()!=0);
     }
     public static UserDetails getDetailsById(String uid) throws SQLException {
        ps10.setString(1, uid);
        ResultSet rs=ps10.executeQuery();
        UserDetails user =new UserDetails();
        
        if(rs.next()){
            user.setUsername(rs.getString(3));
            user.setAddress(rs.getString(4));
            user.setCity(rs.getString(5));
            user.setEmail(rs.getString(6));
            user.setMobile(rs.getLong(7));
            user.setPassword(rs.getString(2));
        }
        return user;
    }
}

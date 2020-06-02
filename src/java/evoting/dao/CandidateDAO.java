/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.AddCandidateDto;
import evoting.dto.CandidateDetails;
import evoting.dto.UpdateCandidateDto;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import javax.servlet.RequestDispatcher;
import javax.websocket.Decoder.BinaryStream;

/**
 *
 * @author Shivansh
 */
public class CandidateDAO {
    private static Statement st,st2,st3;
    private static PreparedStatement ps,ps2,ps3,ps4,ps5,ps6,ps7;
    static {
        try {
            st=DBConnection.getConnection().createStatement();
            st2=DBConnection.getConnection().createStatement();
            ps=DBConnection.getConnection().prepareStatement("select username from user_details where adhar_no=?");
            ps2=DBConnection.getConnection().prepareStatement("insert into candidate values(?,?,?,?,?,?)");
            st3=DBConnection.getConnection().createStatement();
            ps3=DBConnection.getConnection().prepareStatement("select * from candidate where candidate_id=? and status='y'");
            ps4=DBConnection.getConnection().prepareStatement("update candidate set status='n' where candidate_id=?");
            ps6=DBConnection.getConnection().prepareStatement("update candidate set party=?,city=? where candidate_id=?");
           ps5=DBConnection.getConnection().prepareStatement("update user_details set username=? where adhar_no=?");
           
            ps7=DBConnection.getConnection().prepareStatement("update candidate set symbol=? where candidate_id=?");
        }
        catch(SQLException ex) {
            ex.printStackTrace();
        }
    }
    public static String getNewCandidateId() throws SQLException {
        ResultSet rs=st.executeQuery("select count(*) from candidate");
        if(rs.next())
            return "C"+(100+(rs.getInt(1)+1));
        else
            return "C101";
}
    public static String getUsernameById(String uid) throws SQLException {
        ps.setString(1,uid);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
            return rs.getString(1);
        return null;   
    }
    public static ArrayList<String> getCity() throws SQLException {
           ResultSet rs=st.executeQuery("select distinct city from user_details");
           ArrayList<String> city=new ArrayList<>();
           while(rs.next())
               city.add(rs.getString(1));
           return city;          
    }
    public static boolean addcandidate(AddCandidateDto candidate) throws Exception {
            
            ps2.setString(1,candidate.getCandidateId());
            ps2.setString(2,candidate.getParty());
            ps2.setString(3,candidate.getUserId());
            ps2.setBinaryStream(4,candidate.getSymbol(),candidate.getSymbol().available());
            ps2.setString(5,candidate.getCity());
            ps2.setString(6,"y");
            return (ps2.executeUpdate()!=0);
    }
//    public static boolean showcandidate(AddCandidateDto candidate) throws Exception {
//    }
    public static ArrayList<String> getCandidateId() throws SQLException {
        ResultSet rs=st3.executeQuery("select candidate_id from candidate where status='y'");
        ArrayList<String> cand=new ArrayList<>();
        while(rs.next()) {
           cand.add(rs.getString(1));
        }
        return cand;
}
    public static CandidateDetails getCandidatedetails(String cid) throws SQLException {
            CandidateDetails candidate=new CandidateDetails();
            ps3.setString(1, cid);
            ResultSet rs=ps3.executeQuery();
            Blob blob;
            byte[] imageBytes;
            String base64Image;
            if(rs.next()) {
                blob=rs.getBlob(4);
                imageBytes=blob.getBytes(1l,(int)blob.length());
                Encoder ec=Base64.getEncoder();
                base64Image=ec.encodeToString(imageBytes);
                candidate.setSymbol(base64Image);
                candidate.setCandidateId(cid);
                candidate.setCity(rs.getString(5));
                candidate.setParty(rs.getString(2));
                candidate.setUserid(rs.getString(3));
                
                
            }
            return candidate;
    }
    public static boolean deletecandidate(String cid) throws SQLException {
        ps4.setString(1, cid);
        int res=ps4.executeUpdate();
        return (res!=0);
    }
    public static boolean updateCandidate(UpdateCandidateDto candidate,String uid)throws SQLException{
   ps5.setString(1, candidate.getCname());
   ps5.setString(2, uid);
   int res1 = ps5.executeUpdate();
   ps6.setString(1, candidate.getParty());
   ps6.setString(2, candidate.getCity());
   ps6.setString(3, candidate.getCid());
   int res2 = ps6.executeUpdate();
   
   return (res1>0&&res2>0);
 }
  public static boolean updateSymbol(InputStream img,String cid)throws Exception{
 
  ps7.setBinaryStream(1,img,img.available());
  ps7.setString(2, cid);
  int res = ps7.executeUpdate();
  return res>0;
 }
 }
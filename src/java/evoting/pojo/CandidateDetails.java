/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dto;

/**
 *
 * @author Shivansh
 */
public class CandidateDetails {
    private String candidateId;
    private String userid;
    private String candidateName;
    private String party;
    private String symbol;
    private String city;

    public String getCandidateId() {
        return candidateId;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "CandidateDetails{" + "candidateId=" + candidateId + ", userid=" + userid + ", candidat  eName=" + candidateName + ", party=" + party + ", symbol=" + symbol + ", city=" + city + '}';
    }
    
    
}

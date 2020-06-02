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
public class UpdateCandidateDto {
     @Override
    public String toString() {
        return "UpdateCandidateDto{" + "cname=" + cname + ", city=" + city + ", party=" + party + ", cid=" + cid + '}';
    }

    public UpdateCandidateDto(String cname, String city, String party, String cid) {
        this.cname = cname;
        this.city = city;
        this.party = party;
        this.cid = cid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public UpdateCandidateDto() {
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }
    private String cname;
    private String city;
    private String party;
    private String cid;

}

package org.kdy.domain;

public class ReplyDTO {
    
    private int rno;
    private int bno;
    private String reply;
    private String replyer;
    private String password;

    @Override
    public String toString() {
        return "{" +
            " rno='" + getRno() + "'" +
            ", bno='" + getBno() + "'" +
            ", reply='" + getReply() + "'" +
            ", replyer='" + getReplyer() + "'" +
            ", password='" + getPassword() + "'" +
            "}";
    }

    public int getRno() {
        return this.rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getBno() {
        return this.bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getReply() {
        return this.reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyer() {
        return this.replyer;
    }

    public void setReplyer(String replyer) {
        this.replyer = replyer;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}

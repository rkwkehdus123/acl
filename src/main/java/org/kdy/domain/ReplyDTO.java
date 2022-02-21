package org.kdy.domain;

public class ReplyDTO {
    
    private int rno;
    private int bno;
    private String reply;
    private String replyer;
    
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	
	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", bno=" + bno + ", reply=" + reply + ", replyer=" + replyer + "]";
	}

	
}

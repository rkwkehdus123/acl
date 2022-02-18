package org.kdy.domain;

public class BoardDTO {
	private int bno;
	private String nickname;
	private String category;
	private String title;
    private String content;
    private String regdate;
    private int cnt;
    private int good;

	@Override
	public String toString() {
		return "{" +
			" bno='" + getBno() + "'" +
			", nickname='" + getNickname() + "'" +
			", category='" + getCategory() + "'" +
			", title='" + getTitle() + "'" +
			", content='" + getContent() + "'" +
			", regdate='" + getRegdate() + "'" +
			", cnt='" + getCnt() + "'" +
			", good='" + getGood() + "'" +
			"}";
	}
 
    public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getNickname() {
		return this.nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCategory() {
		return this.category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	
	
}

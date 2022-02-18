package org.kdy.domain;

public class Criteria {
	
	private int pageNum;

    private int amount;

    private int skip;

    private String keyword;

    private String type;

    private String[] typeArr;

    @Override
    public String toString() {
        return "{" +
            " pageNum='" + getPageNum() + "'" +
            ", amount='" + getAmount() + "'" +
            ", skip='" + getSkip() + "'" +
            ", keyword='" + getKeyword() + "'" +
            ", type='" + getType() + "'" +
            ", typeArr='" + getTypeArr() + "'" +
            "}";
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
        this.typeArr = type.split("");
    }

    public String[] getTypeArr() {
        return this.typeArr;
    }

    public void setTypeArr(String[] typeArr) {
        this.typeArr = typeArr;
    }

    public String getKeyword() {
        return this.keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getPageNum() {
        return this.pageNum;
    }

    public void setPageNum(int pageNum) {

        this.skip = (pageNum-1)*amount;

        this.pageNum = pageNum;
    }

    public int getAmount() {
        return this.amount;
    }

    public void setAmount(int amount) {

        this.skip = (pageNum-1)*amount;

        this.amount = amount;
    }

    public int getSkip() {
        return this.skip;
    }

    public void setSkip(int skip) {
        this.skip = skip;
    }

    public Criteria(){
        this(1,10);
        this.skip=0;
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }



}

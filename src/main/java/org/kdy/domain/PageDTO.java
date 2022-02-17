package org.kdy.domain;

public class PageDTO {

    private int startPage;

    private int endPage;

    private boolean prev, next;

    private int total;

    private Criteria cri;

    @Override
    public String toString() {
        return "{" +
            " startPage='" + getStartPage() + "'" +
            ", endPage='" + getEndPage() + "'" +
            ", prev='" + isPrev() + "'" +
            ", next='" + isNext() + "'" +
            ", total='" + getTotal() + "'" +
            ", cri='" + getCri() + "'" +
            "}";
    }

    public int getStartPage() {
        return this.startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return this.endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return this.prev;
    }

    public boolean getPrev() {
        return this.prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return this.next;
    }

    public boolean getNext() {
        return this.next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getTotal() {
        return this.total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Criteria getCri() {
        return this.cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    public PageDTO(Criteria cri, int total) {

        this.cri = cri;
        this.total = total;

        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        this.startPage = this.endPage - 9;

        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;

    }
}

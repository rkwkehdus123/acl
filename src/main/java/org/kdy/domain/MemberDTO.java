package org.kdy.domain;

public class MemberDTO {
    
    private String nickname;
    private String id;
    private String password;

    @Override
    public String toString() {
        return "{" +
            " nickname='" + getNickname() + "'" +
            ", id='" + getId() + "'" +
            ", password='" + getPassword() + "'" +
            "}";
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}

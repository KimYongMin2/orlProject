package com.bitcamp.orl.member.domain;

public class MemberVo {

    private int memberIdx;
    private String memberNickName;

    public MemberVo(int memberIdx, String memberNickName) {
        this.memberIdx = memberIdx;
        this.memberNickName = memberNickName;
    }

    public int getMemberIdx() {
        return memberIdx;
    }

    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }

    public String getMemberNickName() {
        return memberNickName;
    }

    public void setMemberNickName(String memberNickName) {
        this.memberNickName = memberNickName;
    }

    @Override
    public String toString() {
        return "MemberVo{" +
                "memberIdx=" + memberIdx +
                ", memberNickName='" + memberNickName + '\'' +
                '}';
    }
}

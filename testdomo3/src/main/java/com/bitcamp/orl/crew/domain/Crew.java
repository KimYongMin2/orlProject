package com.bitcamp.orl.crew.domain;

import java.sql.Timestamp;

public class Crew {
	private int crewIdx;
	private String crewName;
	private String crewPhoto;
	private String crewDiscription;
	private Timestamp crewCreatedate;
	private String crewTag;
	private int memberIdx;
	
	public Crew() {}
	
	public Crew(int crewIdx, String crewName, String crewPhoto, String crewDiscription, Timestamp crewCreatedate,
			String crewTag, int memberIdx) {
		this.crewIdx = crewIdx;
		this.crewName = crewName;
		this.crewPhoto = crewPhoto;
		this.crewDiscription = crewDiscription;
		this.crewCreatedate = crewCreatedate;
		this.crewTag = crewTag;
		this.memberIdx = memberIdx;
	}
	
	public int getCrewIdx() {
		return crewIdx;
	}
	public void setCrewIdx(int crewIdx) {
		this.crewIdx = crewIdx;
	}
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public String getCrewPhoto() {
		return crewPhoto;
	}
	public void setCrewPhoto(String crewPhoto) {
		this.crewPhoto = crewPhoto;
	}
	public String getCrewDiscription() {
		return crewDiscription;
	}
	public void setCrewDiscription(String crewDiscription) {
		this.crewDiscription = crewDiscription;
	}
	public Timestamp getCrewCreatedate() {
		return crewCreatedate;
	}
	public void setCrewCreatedate(Timestamp crewCreatedate) {
		this.crewCreatedate = crewCreatedate;
	}
	public String getCrewTag() {
		return crewTag;
	}
	public void setCrewTag(String crewTag) {
		this.crewTag = crewTag;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	@Override
	public String toString() {
		return "Crew [crewIdx=" + crewIdx + ", crewName=" + crewName + ", crewPhoto=" + crewPhoto + ", crewDiscription="
				+ crewDiscription + ", crewCreatedate=" + crewCreatedate + ", crewTag=" + crewTag + ", memberIdx="
				+ memberIdx + "]";
	}
	
}

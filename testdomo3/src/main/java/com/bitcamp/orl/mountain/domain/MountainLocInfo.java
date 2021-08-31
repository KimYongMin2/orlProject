package com.bitcamp.orl.mountain.domain;

public class MountainLocInfo {
    private String mountainName;
    private String mountainAddress;
    private String mountainInfo;
    private double latitude;
    private double longitude;
    private String img;

    public MountainLocInfo(String mountainName, String mountainAddress, String mountainInfo, double latitude, double longitude, String img) {
        this.mountainName = mountainName;
        this.mountainAddress = mountainAddress;
        this.mountainInfo = mountainInfo;
        this.latitude = latitude;
        this.longitude = longitude;
        this.img = img;
    }

    public String getMountainName() {
        return mountainName;
    }

    public void setMountainName(String mountainName) {
        this.mountainName = mountainName;
    }

    public String getMountainAddress() {
        return mountainAddress;
    }

    public void setMountainAddress(String mountainAddress) {
        this.mountainAddress = mountainAddress;
    }

    public String getMountainInfo() {
        return mountainInfo;
    }

    public void setMountainInfo(String mountainInfo) {
        this.mountainInfo = mountainInfo;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "MountainLocInfo{" +
                "mountainName='" + mountainName + '\'' +
                ", mountainAddress='" + mountainAddress + '\'' +
                ", mountainInfo='" + mountainInfo + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", img='" + img + '\'' +
                '}';
    }
}

package com.bitcamp.orl.mountain.domain;

public class GeoWgs80 {
    public double x;
    public double y;

    public GeoWgs80(double x, double y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public String toString() {
        return "GeoWgs80{" +
                "x=" + x +
                ", y=" + y +
                '}';
    }
}

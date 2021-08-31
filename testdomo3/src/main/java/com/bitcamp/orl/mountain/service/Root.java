package com.bitcamp.orl.mountain.service;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

// import com.fasterxml.jackson.databind.ObjectMapper; // version 2.11.1
// import com.fasterxml.jackson.annotation.JsonProperty; // version 2.11.1
/* ObjectMapper om = new ObjectMapper();
Root root = om.readValue(myJsonString), Root.class); */
class FieldAliases{
    @JsonProperty("FID")
    public String fID;
    @JsonProperty("PMNTN_SN")
    public String pMNTN_SN;
    @JsonProperty("MNTN_CODE")
    public String mNTN_CODE;
    @JsonProperty("MNTN_NM")
    public String mNTN_NM;
    @JsonProperty("PMNTN_NM")
    public String pMNTN_NM;
    @JsonProperty("PMNTN_MAIN")
    public String pMNTN_MAIN;
    @JsonProperty("PMNTN_LT")
    public String pMNTN_LT;
    @JsonProperty("PMNTN_DFFL")
    public String pMNTN_DFFL;
    @JsonProperty("PMNTN_UPPL")
    public String pMNTN_UPPL;
    @JsonProperty("PMNTN_GODN")
    public String pMNTN_GODN;
    @JsonProperty("PMNTN_MTRQ")
    public String pMNTN_MTRQ;
    @JsonProperty("PMNTN_CNRL")
    public String pMNTN_CNRL;
    @JsonProperty("PMNTN_CLS_")
    public String pMNTN_CLS_;
    @JsonProperty("PMNTN_RISK")
    public String pMNTN_RISK;
    @JsonProperty("PMNTN_RECO")
    public String pMNTN_RECO;
    @JsonProperty("DATA_STDR_")
    public String dATA_STDR_;
    @JsonProperty("MNTN_ID")
    public String mNTN_ID;
}

class SpatialReference{
    public String wkt;
}

class Field{
    public String name;
    public String type;
    public String alias;
    public int length;
}

class Attributes{
    @JsonProperty("FID")
    public int fID;
    @JsonProperty("PMNTN_SN")
    public int pMNTN_SN;
    @JsonProperty("MNTN_CODE")
    public String mNTN_CODE;
    @JsonProperty("MNTN_NM")
    public String mNTN_NM;
    @JsonProperty("PMNTN_NM")
    public String pMNTN_NM;
    @JsonProperty("PMNTN_MAIN")
    public String pMNTN_MAIN;
    @JsonProperty("PMNTN_LT")
    public double pMNTN_LT;
    @JsonProperty("PMNTN_DFFL")
    public String pMNTN_DFFL;
    @JsonProperty("PMNTN_UPPL")
    public int pMNTN_UPPL;
    @JsonProperty("PMNTN_GODN")
    public int pMNTN_GODN;
    @JsonProperty("PMNTN_MTRQ")
    public String pMNTN_MTRQ;
    @JsonProperty("PMNTN_CNRL")
    public String pMNTN_CNRL;
    @JsonProperty("PMNTN_CLS_")
    public String pMNTN_CLS_;
    @JsonProperty("PMNTN_RISK")
    public String pMNTN_RISK;
    @JsonProperty("PMNTN_RECO")
    public String pMNTN_RECO;
    @JsonProperty("DATA_STDR_")
    public String dATA_STDR_;
    @JsonProperty("MNTN_ID")
    public String mNTN_ID;
}

class Geometry{
    public List<List<List<Double>>> paths;
}

class Feature{
    public Attributes attributes;
    public Geometry geometry;
}

public class Root{
    public String displayFieldName;
    public FieldAliases fieldAliases;
    public String geometryType;
    public SpatialReference spatialReference;
    public List<Field> fields;
    public List<Feature> features;
}


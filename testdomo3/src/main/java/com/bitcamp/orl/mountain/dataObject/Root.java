package com.bitcamp.orl.mountain.dataObject;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

// import com.fasterxml.jackson.databind.ObjectMapper; // version 2.11.1
// import com.fasterxml.jackson.annotation.JsonProperty; // version 2.11.1
/* ObjectMapper om = new ObjectMapper();
Root root = om.readValue(myJsonString), Root.class); */
public class Root{
    public String displayFieldName;
    public FieldAliases fieldAliases;
    public String geometryType;
    public SpatialReference spatialReference;
    public List<Field> fields;
    public List<Feature> features;
}


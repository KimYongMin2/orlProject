package com.bitcamp.orl.mountain.test;


import com.bitcamp.orl.mountain.dataObject.MountainGeo.Geo;
import com.bitcamp.orl.mountain.domain.GeoWgs80;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        Main main = new Main();
        main.getAddress_DAUM("538479.73674210347","198458.0324834222");
    }
    public GeoWgs80 getAddress_DAUM(String lati, String longi) {
        GeoWgs80 geoWgs80 = null;
        try {
            final String API_URL = "https://dapi.kakao.com/v2/local/geo/transcoord.json?x="+longi+"&y="+lati+"&input_coord=TM&output_coord=WGS84";

            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "KakaoAK 1592ee7d3a05af32d80ef5c4b70c2f49");

            MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
            parameters.add("x" , longi);
            parameters.add("y" , lati);
            parameters.add("input_coord","TM");
            parameters.add("output_coord","WGS84");

            RestTemplate restTemplate = new RestTemplate();
            ResponseEntity<String> result = restTemplate.exchange(API_URL, HttpMethod.GET, new HttpEntity(headers), String.class);

            Geo geo = null;
            ObjectMapper objectMapper = new ObjectMapper();

            try {
                geo = objectMapper.readValue(result.getBody(), Geo.class);
            } catch (
                    IOException e) {
                e.printStackTrace();
            }
            geoWgs80 = new GeoWgs80(geo.documents.get(0).y,geo.documents.get(0).x);
            System.out.println(geoWgs80.toString());

        }catch (Exception e){
            e.printStackTrace();
        }
        return geoWgs80;
    }
}
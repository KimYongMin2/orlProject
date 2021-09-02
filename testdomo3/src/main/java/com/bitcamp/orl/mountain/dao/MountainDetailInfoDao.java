package com.bitcamp.orl.mountain.dao;

import com.bitcamp.orl.mountain.dataObject.MountainDetailInfo.MountainDetailInfoData;
import com.bitcamp.orl.mountain.domain.GeoWgs80;
import com.bitcamp.orl.mountain.domain.MountainDetailInfo;
import com.bitcamp.orl.mountain.test.Main;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MountainDetailInfoDao {
    public MountainDetailInfo dataToMountainDetailInfo(String mountainCode) {
        MountainDetailInfo mountainDetailInfo = null;
        ObjectMapper objectMapper = new ObjectMapper();
        MountainDetailInfoData mountainData = null;
        try {
            mountainData = objectMapper.readValue(new File("C:\\Users\\kym96\\Desktop\\mountain\\json_file\\" + mountainCode + ".json"), MountainDetailInfoData.class);
        } catch (
                IOException e) {
            e.printStackTrace();
        }
        System.out.println(mountainData);
        if (mountainData != null) {
            for (int i = 0; i < mountainData.features.size(); i++) {
                mountainDetailInfo = new MountainDetailInfo(mountainData.features.get(i).geometry.paths);
            }
        }
        return mountainDetailInfo;
    }

    public List<GeoWgs80> getGeo(MountainDetailInfo mountainDetailInfo) {
        Main main = new Main();
        List<GeoWgs80> geoWgs80List = new ArrayList<>();
        System.out.println(mountainDetailInfo);
        for (int i = 0; i < mountainDetailInfo.paths.get(0).size(); i++) {
            geoWgs80List.add(main.getAddress_DAUM(Double.toString(mountainDetailInfo.paths.get(0).get(i).get(0)),Double.toString(mountainDetailInfo.paths.get(0).get(i).get(1))));
        }
        return geoWgs80List;
    }
}

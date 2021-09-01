package com.bitcamp.orl.mountain.dao;

import com.bitcamp.orl.mountain.dataObject.Root;
import com.bitcamp.orl.mountain.domain.MountainDetailInfo;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;

public class MountainDetailInfoDao {
    public MountainDetailInfo dataToMountainDetailInfo(String mountainCode) {
        MountainDetailInfo mountainDetailInfo = null;
        ObjectMapper objectMapper = new ObjectMapper();
        Root mountainData = null;
        try {
            mountainData = objectMapper.readValue(new File("C:\\Users\\kym96\\Desktop\\mountain\\json_file\\" + mountainCode + ".json"), Root.class);
        } catch (
                IOException e) {
            e.printStackTrace();
        }
        System.out.println(mountainData);
        if (mountainData != null) {
            for (int i = 0; i < mountainData.features.size(); i++) {
                mountainDetailInfo = new MountainDetailInfo(mountainData.features.get(i).geometry.paths);
            }
            System.out.println(mountainDetailInfo);
        }
        return mountainDetailInfo;
    }
}

package com.bitcamp.orl.mountain.service;

import com.bitcamp.orl.mountain.dao.Dao;
import com.bitcamp.orl.mountain.domain.MountainDetailInfo;
import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MountainDetailInfoViewService {

    private Dao dao;

    @Autowired
    private SqlSessionTemplate template;

    public MountainDetailInfo getMountainDetailInfo(String mountainCode) {
        MountainDetailInfo mountainDetailInfo = null;
        ObjectMapper objectMapper = new ObjectMapper();
        Root mountainData = null;
        try {
            mountainData = objectMapper.readValue(new File("C:\\Users\\kym96\\Desktop\\mountain\\json_file\\" + mountainCode + ".json"), Root.class);
        } catch (IOException e) {
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

    public MountainLocInfo getMountainLocInfo(String mountainName) {
        MountainLocInfo mountainLocInfo = null;
        if (mountainName != null) {
            dao = template.getMapper(Dao.class);
            mountainLocInfo = dao.selectByName(mountainName);

        }
        return mountainLocInfo;
    }


}

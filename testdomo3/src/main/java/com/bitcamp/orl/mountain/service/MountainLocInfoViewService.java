package com.bitcamp.orl.mountain.service;

import com.bitcamp.orl.mountain.dao.Dao;

import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MountainLocInfoViewService {

    private Dao dao;

    @Autowired
    private SqlSessionTemplate template;

    public List<MountainLocInfo> getMountainLocInfo(String loc) {
        List<MountainLocInfo> mountainLocInfoList = null;
        if (loc != null) {
            dao = template.getMapper(Dao.class);
            if (loc.equals("서울경기")) {
                mountainLocInfoList = dao.selectByLocNameSeoul();
            } else {
                mountainLocInfoList = dao.selectByLocName(loc);
            }
        }
        return mountainLocInfoList;
    }


}

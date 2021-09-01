package com.bitcamp.orl.mountain.service;

import com.bitcamp.orl.mountain.dao.Dao;
import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MountainRestService {
    private Dao dao;
    @Autowired
    private SqlSessionTemplate template;

    public MountainRestService() {
    }

    public List<MountainLocInfo> getSortingHeight(String loc) {
        List<MountainLocInfo> mountainLocInfoList = null;
        this.dao = (Dao) this.template.getMapper(Dao.class);
        if(loc.equals("서울경기")){
            mountainLocInfoList = this.dao.selectByLocNameSeoul2();
        }else {
            mountainLocInfoList = this.dao.selectByLocName2(loc);
        }
        return mountainLocInfoList;
    }

    public List<MountainLocInfo> getSortingHeight2(String loc) {
        List<MountainLocInfo> mountainLocInfoList = null;
        this.dao = (Dao) this.template.getMapper(Dao.class);
        if(loc.equals("서울경기")){
            mountainLocInfoList = this.dao.selectByLocNameSeoul();
        }else {
            mountainLocInfoList = this.dao.selectByLocName(loc);
        }
        return mountainLocInfoList;
    }
}

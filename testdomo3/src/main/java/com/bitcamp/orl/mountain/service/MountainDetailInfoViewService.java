package com.bitcamp.orl.mountain.service;

import com.bitcamp.orl.mountain.dao.Dao;
import com.bitcamp.orl.mountain.dao.MountainDetailInfoDao;
import com.bitcamp.orl.mountain.domain.GeoWgs80;
import com.bitcamp.orl.mountain.domain.MountainDetailInfo;
import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MountainDetailInfoViewService {

    private Dao dao;
    private MountainDetailInfoDao detailInfoDao;

    @Autowired
    private SqlSessionTemplate template;

    public MountainDetailInfo getMountainDetailInfo(String mountainCode) {
        MountainDetailInfo mountainDetailInfo = null;
        if (mountainCode != null) {
            System.out.println(mountainCode);
            detailInfoDao = new MountainDetailInfoDao();
            mountainDetailInfo = detailInfoDao.dataToMountainDetailInfo(mountainCode);
        }
        return mountainDetailInfo;
    }
    public List<GeoWgs80> getGeoList(MountainDetailInfo mountainDetailInfo) {
        List<GeoWgs80> geoWgs80List = null;
        if (mountainDetailInfo != null) {
            detailInfoDao = new MountainDetailInfoDao();
            geoWgs80List = detailInfoDao.getGeo(mountainDetailInfo);
        }
        return geoWgs80List;
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

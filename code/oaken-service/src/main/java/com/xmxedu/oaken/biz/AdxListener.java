package com.xmxedu.oaken.biz;

import com.xmxedu.oaken.cache.LocalCache;
import com.xmxedu.oaken.dao.bll.AdInfoBLL;
import com.xmxedu.oaken.model.AdBasicData;
import com.xmxedu.oaken.sql.AdInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 定时任务，定时的将数据库中的数据加载到Cache中
 * @version 1.0.0
 */
@Service
public class AdxListener {

    @Autowired
    private LocalCache localCache;

    @Autowired
    private AdInfoBLL adInfoBLL;

    @Autowired
    private AdBasicDataCollect adBasicDataCollect;

    public void loadSQLIntoCacheAtFixedTime(){

        // get all adid in mysql
        List<AdInfo> allAdInfo = this.adInfoBLL.getAllAdInfo();
        if (allAdInfo.isEmpty()){
            // logger warn it
            return;
        }
        for (AdInfo ai : allAdInfo){
            String showId = ai.getShowId();
            AdBasicData abd = this.adBasicDataCollect.getAdBasicDataByShowId(showId);
            localCache.putAdDataByAdid(showId,abd);
        }
    }
}

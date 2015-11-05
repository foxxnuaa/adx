package com.xmxedu.oaken.dao.impl;

import com.xmxedu.oaken.dao.AppInfoRepository;
import com.xmxedu.oaken.dao.BasicDataSource;
import com.xmxedu.oaken.model.AppInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 对数据库中媒体信息的名称的表提供DAO相关操作，将接口与实现进行分离
 *
 * @version 1.0.1
 */

@Service
public class JdbcAppInfoRepository implements AppInfoRepository {

    private final static Logger logger = LoggerFactory.getLogger(JdbcAppInfoRepository.class);
    private NamedParameterJdbcTemplate nPJT;

    @Autowired
    public JdbcAppInfoRepository(BasicDataSource basicDataSource) {
        this.nPJT = new NamedParameterJdbcTemplate(basicDataSource);
    }

    public AppInfo getAppInfoByAppId(String appId) {
        String selectAppInfoByAppId = "SELECT `id`,`name`,`showid`,`ostypeid`,`categoryid`,`pkgn`,`note`,`status`,`checkinfo`,`createtime`,`checktime` FROM `oaken`.`appinfo` where appid = :appid";
        SqlParameterSource namedParameters = new MapSqlParameterSource("appid", appId);

        try {
            AppInfo appInfo = (AppInfo) this.nPJT.queryForObject(selectAppInfoByAppId, namedParameters, new RowMapper() {
                public AppInfo mapRow(ResultSet rs, int i) throws SQLException {
                    AppInfo ai = new AppInfo();

                    ai.setId(rs.getInt("id"));
                    ai.setName(rs.getString("name"));
                    ai.setShowId(rs.getString("showid"));
                    ai.setOsTypeId(rs.getInt("ostypeid"));
                    ai.setCategoryId(rs.getInt("categoryid"));
                    ai.setPkgn(rs.getString("pkg"));
                    ai.setNote(rs.getString("note"));
                    ai.setStatus(rs.getInt("status"));
                    ai.setCheckInfo(rs.getString("checkinfo"));
                    ai.setCreateTime(rs.getLong("createtime"));
                    ai.setCheckTime(rs.getLong("checktime"));

                    return ai;
                }
            });
            return appInfo;
        } catch (DataAccessException e) {
            logger.error("get appinfo by appid encounter an error: " + e.getMessage());
        }
        return null;
    }

    public AppInfo getAppInfoByAppName(String appName) {
        return null;
    }
}

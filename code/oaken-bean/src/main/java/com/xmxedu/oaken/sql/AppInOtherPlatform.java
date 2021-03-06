package com.xmxedu.oaken.sql;

/**
 * 媒体在第三方平台的相关属性，会与本地的媒体进行映射
 * @version 1.0.0
 */
public class AppInOtherPlatform {

    public final static String TABLE_NAME = " `adx`.`tb_app_in_thirdparty` ";
    public final static String ALL_COLUMN_NAME = " `id`,`appname`,`platformid`,`appid`,`adid`,`showtype`,`incometype` ";

    public final static String COLUMN_ID = "id";
    public final static String COLUMN_APP_NAME = "appname";
    public final static String COLUMN_PLATFORM_ID = "platformid";
    public final static String COLUMN_APP_ID = "appid";
    public final static String COLUMN_AD_ID = "adid";
    public final static String COLUMN_SHOW_TYPE = "showtype";
    public final static String COLUMN_INCOME_TYPE = "incometype";

    // 数据库自增id
    private int id;
    // 媒体名称
    private String appName;
    // 第三方平台id
    private int thirdPlatformId;
    // 媒体id
    private int appId;
    // 广告位id
    private int adId;
    // 广告位展示类型
    private int showType;
    // 第三方平台的收入类型CPM，CPC，CPA等
    private int incomeType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public int getThirdPlatformId() {
        return thirdPlatformId;
    }

    public void setThirdPlatformId(int thirdPlatformId) {
        this.thirdPlatformId = thirdPlatformId;
    }

    public int getAppId() {
        return appId;
    }

    public void setAppId(int appId) {
        this.appId = appId;
    }

    public int getAdId() {
        return adId;
    }

    public void setAdId(int adId) {
        this.adId = adId;
    }

    public int getShowType() {
        return showType;
    }

    public void setShowType(int showType) {
        this.showType = showType;
    }

    public int getIncomeType() {
        return incomeType;
    }

    public void setIncomeType(int incomeType) {
        this.incomeType = incomeType;
    }
}

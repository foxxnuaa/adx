package com.xmxedu.oaken.sql;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

/**
 * 媒体信息，包括所属用户和分类，此类需要经过数据库加载后进行使用，spring中注意AppInfo的作用域范围
 * 
 * @author xmzheng
 * @version 1.0.1
 */

@Repository
@Scope(value = "singleton")
public class AppInfo {

    // 数据库表名和全列表名称
    public final static String TABLE_NAME = " `adx`.`tb_app_info` ";
    public final static String ALL_COLUMN_NAME = " `id`,`name`,`showid`,`ostypeid`,`categoryid`,`pkgn`,`note`,`status`,`checkinfo`,`createtime`,`checktime` ";

    //数据库中的列名称
    public final static String COLUMN_ID = "id";
    public final static String COLUMN_NAME = "name";
    public final static String COLUMN_SHOWID = "showid";
    public final static String COLUMN_OSTYPEID = "ostypeid";
    public final static String COLUMN_CATEGORYID = "categoryid";
    public final static String COLUMN_PKGN = "pkgn";
    public final static String COLUMN_NOTE = "note";
    public final static String COLUMN_CONTENT = "content";
    public final static String COLUMN_STATUS = "status";
    public final static String COLUMN_CHECKINFO = "checkinfo";
    public final static String COLUMN_CREATETIME = "createtime";
    public final static String COLUMN_CHECKTIME = "checktime";

    //  自增id
    private int id;

    // app的名称
    private String name;

    // app的对外展示的id
    private String showId;

    // 外键对应媒体的操作系统Android，iOS
    private int osTypeId;

    // 外键对应媒体的具体分类，如理财投资，角色游戏
    private int categoryId;

    // app对应的包名称,如com.hdcp.shipu
    private String pkgn;

    // app的简介说明，这个媒体是干嘛的
    private String note;

    // app的具体上传包
    private byte[] content;

    // app的审核状态
    private int status;

    // app的审核信息，不符合的因素
    private String checkInfo;

    // app的创建时间
    private long createTime;

    // app的审核时间
    private long checkTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShowId() {
        return showId;
    }

    public void setShowId(String showId) {
        this.showId = showId;
    }

    public int getOsTypeId() {
        return osTypeId;
    }

    public void setOsTypeId(int osTypeId) {
        this.osTypeId = osTypeId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getPkgn() {
        return pkgn;
    }

    public void setPkgn(String pkgn) {
        this.pkgn = pkgn;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCheckInfo() {
        return checkInfo;
    }

    public void setCheckInfo(String checkInfo) {
        this.checkInfo = checkInfo;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public long getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(long checkTime) {
        this.checkTime = checkTime;
    }
}

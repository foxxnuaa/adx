package com.xmxedu.oaken.mysql;


import com.xmxedu.oaken.dao.bll.AppCategoryBLL;
import com.xmxedu.oaken.sql.AppCategory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.BootstrapWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@BootstrapWith
@ContextConfiguration(locations = {"classpath:applicationContext-service.xml"})
public class AppCategoryJdbcTemplateTest {

    @Autowired
    private AppCategoryBLL appCategoryBLL;

    @Test
    public void GetAppCategoryById(){
        AppCategory appCategory = appCategoryBLL.getAppCategoryById(3);
        if (null == appCategory){
            return;
        }

        System.out.println(appCategory.getName());
    }
}

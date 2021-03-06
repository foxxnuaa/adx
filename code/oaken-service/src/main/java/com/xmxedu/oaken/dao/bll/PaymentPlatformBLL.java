package com.xmxedu.oaken.dao.bll;

import com.xmxedu.oaken.dao.dal.PaymentPlatformDAL;
import com.xmxedu.oaken.sql.PaymentPlatform;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 第三方支付平台的DAO相关操作
 * @version 1.0.0
 */
@Service
public class PaymentPlatformBLL {

    private final static Logger logger = LoggerFactory.getLogger(PaymentPlatformBLL.class);

    @Autowired
    private PaymentPlatformDAL paymentPlatformDAL;

    public PaymentPlatform getPaymentPlatformById(int id){
        if (id < 0){
            logger.error("invalid id,suck it~");
            return null;
        }

        PaymentPlatform paymentPlatform = this.paymentPlatformDAL.getPaymentPlatformByWhereClause(PaymentPlatform.COLUMN_ID,String.valueOf(id));
        return paymentPlatform;
    }

    public PaymentPlatform getPaymentPlatformByName(String name){
        if (StringUtils.isBlank(name)){
            logger.error("empty name,suck it~");
            return null;
        }

        PaymentPlatform paymentPlatform = this.paymentPlatformDAL.getPaymentPlatformByWhereClause(PaymentPlatform.COLUMN_ID,name);
        return paymentPlatform;
    }
}

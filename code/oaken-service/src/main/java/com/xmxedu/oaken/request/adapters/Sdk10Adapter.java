package com.xmxedu.oaken.request.adapters;

import com.google.gson.JsonObject;
import com.xmxedu.oaken.request.Adapter;
import com.xmxedu.oaken.request.SpecialRequest;

/**
 * sdk 1.0 协议中将其数据转化成内部统一的对象
 * @version 1.0
 */
public class Sdk10Adapter implements Adapter {
    public SpecialRequest convert(JsonObject jsonObject) {
        return null;
    }
}

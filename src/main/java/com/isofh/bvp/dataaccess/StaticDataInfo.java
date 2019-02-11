package com.isofh.bvp.dataaccess;

import java.util.HashMap;

public class StaticDataInfo {
    static HashMap<String, Object> data;

    public static HashMap<String, Object> getDataStatic() {
        if (data == null)
            data = new HashMap<>();
        return data;
    }

    public enum CONSTANT_DATA_STATIC {
        DATA_HOTEST_TAG(12),
        DATA_TAG(11),
        DATA_DEPARTMENT(10),
        DATA_COUNTRY(13),
        DATA_PROVINCES(14),
        DATA_DISTRICT(15),
        DATA_SERVICE_AT_HOSPITAL(16),
        DATA_BOOKING_DOCTOR(17),
        DATA_BOOKING_ROOM(18),
        DATA_MENU(19),
        DATA_MENU_BY_GROUP(8),
        DATA_USER_ACCESS(3);
        int value;

        CONSTANT_DATA_STATIC(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    public synchronized static boolean setData(CONSTANT_DATA_STATIC key, String key2, Object value) {
        try {
            HashMap<String, Object> hashMap = getDataStatic();
            hashMap.put(key.getValue() + key2, value);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public synchronized static boolean setData(CONSTANT_DATA_STATIC key, Object value) {
        try {
            return setData(key, "", value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static <T> T getData(CONSTANT_DATA_STATIC key, String key2, T defaultValue) {
        try {
            HashMap<String, Object> hashMap = getDataStatic();
            if (hashMap.containsKey(key.getValue() + key2))
                return (T) hashMap.get(key.getValue() + key2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static <T> T getData(CONSTANT_DATA_STATIC key, T defaultValue) {
        try {
            return getData(key, "", defaultValue);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static <T> T getData(CONSTANT_DATA_STATIC key) {

        return getData(key, null);
    }
}

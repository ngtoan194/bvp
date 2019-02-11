package com.isofh.bvp.listener;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.dataaccess.DataDictionaryInfo;
import com.isofh.utils.ConvertUtils;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@WebListener
public class SessionCounter {
    private static HashMap<String, Counter> sessions = new HashMap<>();
    private static int totalAccess = 0;
    public static final String COUNTER = "session-counter";

    public static JsonObject getDataOnline() {
        JsonObject jsonObject = new JsonObject();
        try {
            int count_online = 0;
            int count_access = 0;
            long currentDate = new Date().getTime();
            for (String st : sessions.keySet()) {
                Counter counter = sessions.get(st);
                long l1 = 30L * 60 * 1000;
                if (currentDate - counter.date > l1) {
                    counter.setDesktroy(true);
                }
                if (!counter.isDesktroy) {
                    count_online++;
                }
                long l = 30L * 24 * 60 * 60 * 1000;
                if (currentDate - counter.date <= l) {
                    count_access++;
                } else {
                    sessions.remove(st);
                }
            }
            jsonObject.addProperty("online", count_online);
            jsonObject.addProperty("access", count_access);
            jsonObject.addProperty("total", totalAccess);
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.addProperty("online", 1);
            jsonObject.addProperty("access", 1);
            jsonObject.addProperty("total", 1);
        }
        return jsonObject;
    }

    static void getFromServer() throws UnknownHostException, SocketTimeoutException {
        JsonObject jsonObject = new DataDictionaryInfo().get(DataDictionaryInfo.DataDictionary.DATA_WEBSITE_COUNTER);
        if (jsonObject != null) {
            totalAccess = ConvertUtils.toInt(jsonObject.get("totalAccess"));
            String sessionData = ConvertUtils.toString(jsonObject.get("sessions"));
            sessions = ConvertUtils.toObject(sessionData, new TypeToken<HashMap<String, Counter>>() {
            }.getType());
            if (sessions == null)
                sessions = new HashMap<>();
            Iterator<HashMap.Entry<String, Counter>> iterator = sessions.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry<String, Counter> views = iterator.next();
                Counter counter = views.getValue();
                counter.setDesktroy(true);
            }
        }
    }

    public static void count(HttpServletRequest req) {
        HttpSession session = req.getSession();
        try {
            long sessionTime = session != null ? ConvertUtils.toLong(session.getAttribute("COUNT_TIME")) : 0;
            long currentTime = new Date().getTime();
            if (session == null || 30L * 60 * 1000 < (currentTime - sessionTime)) {
                if (totalAccess == 0 || sessions.size() == 0) {
                    getFromServer();
                }
                totalAccess++;
                if (session != null) {
                    session.setAttribute("COUNT_TIME", currentTime);
                    sessions.put(session.getId() + currentTime, new Counter(false, new Date().getTime()));
                }
                if (totalAccess < sessions.size())
                    totalAccess = sessions.size();
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("totalAccess", totalAccess);
                jsonObject.addProperty("sessions", ConvertUtils.toJson(sessions));
                new DataDictionaryInfo().save(DataDictionaryInfo.DataDictionary.DATA_WEBSITE_COUNTER, jsonObject);
            }
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (Exception e) {

        }
    }

    static class Counter {
        boolean isDesktroy;
        long date;

        public boolean isDesktroy() {
            return isDesktroy;
        }

        public void setDesktroy(boolean desktroy) {
            isDesktroy = desktroy;
        }

        public double getDate() {
            return date;
        }

        public void setDate(long date) {
            this.date = date;
        }

        public Counter(boolean isDesktroy, long date) {
            this.isDesktroy = isDesktroy;
            this.date = date;
        }
    }
}
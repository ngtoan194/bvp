package com.isofh.library;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.isofh.bvp.constants.ServerConstants;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.utils.ConvertUtils;
import okhttp3.*;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.concurrent.TimeUnit;

/**
 * Created by MaiNam on 11/15/2017.
 */

public class ClientInfo {
    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    static String serverUrl;
    static String serverMediaUrl;
    static String webUrl;
    static String serverImage;

    public static String getServerLink() {
        return serverUrl;
    }

    public static void setServerLink(String serverLink) {
        ClientInfo.serverUrl = serverLink;
    }

    public static String getServerMediaUrl() {
        return serverMediaUrl;
    }

    public static void setServerMediaUrl(String serverMediaLink) {
        ClientInfo.serverMediaUrl = serverMediaLink;
    }

    public static String getWebUrl() {
        return webUrl;
    }

    public static void setWebUrl(String webUrl) {
        ClientInfo.webUrl = webUrl;
    }

    public static String getServerImage() {
        return serverImage;
    }

    public static void setServerImage(String serverImage) {
        ClientInfo.serverImage = serverImage;
    }

    static Gson gson;

    public static Gson getGson() {
        if (gson == null)
            gson = new Gson();
        return gson;
    }

    static JsonParser jsonParser;

    public static JsonParser getJsonParser() {
        if (jsonParser == null)
            jsonParser = new JsonParser();
        return jsonParser;
    }


    public enum MethodType {
        PUT,
        POST,
        GET,
        DELETE
    }

    private static OkHttpClient client;
    private static int timeOut = 100;

    private static OkHttpClient getClient() {
        if (client == null)
            client = new OkHttpClient.Builder()
                    .connectTimeout(timeOut, TimeUnit.SECONDS)
                    .readTimeout(timeOut, TimeUnit.SECONDS)
                    .writeTimeout(timeOut, TimeUnit.SECONDS)
                    .build();
        return client;
    }

    public InputStream downloadFile(String url) throws IOException {
        Request.Builder request = getRequestBuilder(url);
        Response response = getClient().newCall(request.build()).execute();
        return response.body().byteStream();
    }


    private Request.Builder getRequestBuilder(String url) {
        return new Request.Builder().addHeader("Authorization", UserInfo.getAuthorization()).addHeader("Accept-Encoding", "charset=UTF-8").url(url);
    }

    public DataResponse requestApi(MethodType methodType, String api, String filename, byte[] file) throws IOException {
        MediaType MEDIA_TYPE_PNG = MediaType.parse("image/png");
        MultipartBody multipartBody = new MultipartBody.Builder().setType(MultipartBody.FORM).addFormDataPart("file", filename, RequestBody.create(MEDIA_TYPE_PNG, file)).build();
        return requestApi(methodType, serverUrl, api, multipartBody, timeOut);
    }

    public DataResponse requestApi(MethodType methodType, String api, JsonObject dataBody) throws UnknownHostException, SocketTimeoutException {
        RequestBody requestBody = RequestBody.create(JSON, ConvertUtils.toJson(dataBody));
        return requestApi(methodType, serverUrl, api, requestBody, timeOut);
    }

    public <T> DataResponse requestApi(MethodType methodType, String api) throws UnknownHostException, SocketTimeoutException {
        return requestApi(methodType, serverUrl, api);
    }

    public <T> DataResponse requestApi(MethodType methodType, String server, String api) throws UnknownHostException, SocketTimeoutException {
        return requestApi(methodType, server, api, new JsonObject(), 1000);
    }

    public <T> DataResponse requestApi(MethodType methodType, String api, JsonObject dataBody, int timeOut) throws UnknownHostException, SocketTimeoutException {
        RequestBody requestBody = RequestBody.create(JSON, ConvertUtils.toJson(dataBody));
        return requestApi(methodType, serverUrl, api, requestBody, timeOut);
    }

    public <T> DataResponse requestApi(MethodType methodType, String server, String api, JsonObject dataBody, int timeOut) throws UnknownHostException, SocketTimeoutException {
        RequestBody requestBody = RequestBody.create(JSON, ConvertUtils.toJson(dataBody));
        return requestApi(methodType, server, api, requestBody, timeOut);
    }

    public <T> DataResponse requestApi(MethodType methodType, String server, String api, RequestBody requestBody, int timeOut) throws UnknownHostException, SocketTimeoutException {
        return requestApi(methodType, server + api, requestBody, timeOut);
    }

    public <T> DataResponse requestApi(MethodType methodType, String url, RequestBody requestBody, int timeOut) throws UnknownHostException, SocketTimeoutException {
        Request.Builder builder = getRequestBuilder(url);
        if (requestBody != null) {
            switch (methodType) {
                case POST:
                    builder.post(requestBody);
                    break;
                case PUT:
                    builder.put(requestBody);
                    break;
                case DELETE:
                    builder.delete(requestBody);
                    break;
            }
        }
        Request request = builder.build();
        return execute(request, timeOut);
    }

    <T> DataResponse execute(Request request, int timeOut) throws SocketTimeoutException, UnknownHostException {
        try {
            OkHttpClient client = null;
            if (timeOut != 0) {
                client = new OkHttpClient.Builder()
                        .connectTimeout(timeOut, TimeUnit.SECONDS)
                        .readTimeout(timeOut, TimeUnit.SECONDS)
                        .writeTimeout(timeOut, TimeUnit.SECONDS)
                        .build();
            } else {
                client = getClient();
            }
            client = HttpClient.trustAllSslClient(client);
            Response response = client.newCall(request).execute();
            String bodyString = response.body().string();//getFromStream(response.body().byteStream(),"UTF-16");
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
            throw e;
        } catch (UnknownHostException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(500, "{Message: Internal server error}");
    }

    public static class DataResponse {
        private int status;
        private String body;

        public <T> T getData(Type type) {
            T t = ConvertUtils.toObject(body, type);
            return t;
        }

        public <T> T getData(Class<T> c) {
            T t = ConvertUtils.toObject(body, c);
            return t;
        }

        public boolean isOK() {
            return status == ServerConstants.RESPONSE_OK;
        }

        public boolean isTimeOut() {
            return status == ServerConstants.REQUEST_TIMEOUT_ERROR;
        }

        public DataResponse(int status, String body) {
            this.status = status;
            this.body = body;
        }

        public DataResponse(Response response) {
            this.status = response.code();
            try {
                this.body = response.body().string();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }
    }
}

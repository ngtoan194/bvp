package com.isofh.utils;

import com.google.gson.JsonObject;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.text.MessageFormat;

public class FacebookUtils {
    String ConsumerKey;
    String ConsumerSecret;
    String CALLBACK_URL;

    public final String AUTHORIZE = "https://graph.facebook.com/oauth/authorize";
    public final String ACCESS_TOKEN = "https://graph.facebook.com/oauth/access_token";

    private String _consumerKey = "";
    private String _consumerSecret = "";
    private String _token = "";


    public FacebookUtils(String consumerKey, String consumerSecret, String CALLBACK_URL) {
        ConsumerKey = consumerKey;
        ConsumerSecret = consumerSecret;
        this.CALLBACK_URL = CALLBACK_URL;
    }

    public String getConsumerKey() {
        return ConsumerKey;
    }

    public void setConsumerKey(String consumerKey) {
        ConsumerKey = consumerKey;
    }

    public String getConsumerSecret() {
        return ConsumerSecret;
    }

    public void setConsumerSecret(String consumerSecret) {
        ConsumerSecret = consumerSecret;
    }

    public String get_token() {
        return _token;
    }

    public void set_token(String _token) {
        this._token = _token;
    }

    public String authorizationLinkGet()
    {
        return AUTHORIZE+"?client_id="+getConsumerKey()+"&redirect_uri="+CALLBACK_URL+"&scope=email";
    }

    public void accessTokenGet(String authToken) throws SocketTimeoutException, UnknownHostException {
        MessageFormat fmt = new MessageFormat("{0}?client_id={1}&redirect_uri={2}&client_secret={3}&code={4}");
        Object[] args = {ACCESS_TOKEN, this.ConsumerKey,CALLBACK_URL,this.ConsumerSecret, authToken};
        fmt.format(args);

        String accessTokenUrl = fmt.format(args);
        ClientInfo.DataResponse dataResponse = new ClientInfo().requestApi(ClientInfo.MethodType.GET,"", accessTokenUrl);
        JsonObject result = dataResponse.getData(JsonObject.class);
        this._token = ConvertUtils.toString(result.get("access_token"));
    }
}

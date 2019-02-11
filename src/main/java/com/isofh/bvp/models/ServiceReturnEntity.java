package com.isofh.bvp.models;

public class ServiceReturnEntity<T> {
    int code;
    T data;
    String message;

    public int getCode() {
        return code;
    }

    public void setCode(int Code) {
        code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T Data) {
        data = Data;
    }
    public String getMessage() {
        return message;
    }

    public void setMessage(String Message) {
        message = Message;
    }

    public ServiceReturnEntity() {
        code=1;
    }
    public ServiceReturnEntity(int Code, T Data, String Message) {
        code = Code;
        data = Data;
        message = Message;
    }
}

package com.bcsd.entity;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ResponseData {
    public static final String DEFAULT_SUCCESS_MESSAGE = "请求成功";
    public static final String DEFAULT_ERROR_MESSAGE = "网络异常";
    public static final Integer DEFAULT_SUCCESS_CODE = 200;
    public static final Integer DEFAULT_ERROR_CODE = 500;
    private Boolean success;
    private Integer code;
    private String message;
    private Object data;

    public static String getDefaultSuccessMessage() {
        return DEFAULT_SUCCESS_MESSAGE;
    }

    public static String getDefaultErrorMessage() {
        return DEFAULT_ERROR_MESSAGE;
    }

    public static Integer getDefaultSuccessCode() {
        return DEFAULT_SUCCESS_CODE;
    }

    public static Integer getDefaultErrorCode() {
        return DEFAULT_ERROR_CODE;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public ResponseData(Boolean success, Integer code, String message, Object data) {
        this.success = success;
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ResponseData() {
    }
}

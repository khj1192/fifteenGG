package com.kh.fifteenGG.common.apiKey;

public class ApiKey {

    private String key = "RGAPI-a9f3a4c6-6197-455c-a78d-0a06eec70ee0";
                // RGAPI-b0f1c9f8-bc6b-48c9-bd2d-e303c45548ff 영구키
    public ApiKey() {
    }

    public ApiKey(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}

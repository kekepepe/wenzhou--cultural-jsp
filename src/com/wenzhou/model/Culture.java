package com.wenzhou.model;

import java.io.Serializable;

public class Culture implements Serializable {
    private Integer id;
    private String cultureName;
    private String type;
    private String history;
    private String significance;
    private String description;
    private String imgUrl;

    public Culture() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCultureName() {
        return cultureName;
    }

    public void setCultureName(String cultureName) {
        this.cultureName = cultureName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getSignificance() {
        return significance;
    }

    public void setSignificance(String significance) {
        this.significance = significance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}

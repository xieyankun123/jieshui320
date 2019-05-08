package com.xyk.model;

import java.util.List;

public class WatertotalModel {
    private gyModel gyModel;
    private List<waterrModel> type1;
    private List<waterrModel> type2;
    private List<waterrModel> type3;

    public WatertotalModel(com.xyk.model.gyModel gyModel, List<waterrModel> type1, List<waterrModel> type2, List<waterrModel> type3) {
        this.gyModel = gyModel;
        this.type1 = type1;
        this.type2 = type2;
        this.type3 = type3;
    }

    public com.xyk.model.gyModel getGyModel() {
        return gyModel;
    }

    public void setGyModel(com.xyk.model.gyModel gyModel) {
        this.gyModel = gyModel;
    }

    public List<waterrModel> getType1() {
        return type1;
    }

    public void setType1(List<waterrModel> type1) {
        this.type1 = type1;
    }

    public List<waterrModel> getType2() {
        return type2;
    }

    public void setType2(List<waterrModel> type2) {
        this.type2 = type2;
    }

    public List<waterrModel> getType3() {
        return type3;
    }

    public void setType3(List<waterrModel> type3) {
        this.type3 = type3;
    }
}

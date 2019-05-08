package com.xyk.model;

public class waterrModel {
        private int id;
        private String WID_out;
        private String user_id;
        private String time;
        private Double value;
        private String picture;
        private String factory;
        private String jiaozhun;
        private String jiaozhuntime;
        private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getJiaozhun() {
        return jiaozhun;
    }

    public void setJiaozhun(String jiaozhun) {
        this.jiaozhun = jiaozhun;
    }

    public String getJiaozhuntime() {
        return jiaozhuntime;
    }

    public void setJiaozhuntime(String jiaozhuntime) {
        this.jiaozhuntime = jiaozhuntime;
    }

    public String getZzvalue() {
        return zzvalue;
    }

    public void setZzvalue(String zzvalue) {
        this.zzvalue = zzvalue;
    }

    private String zzvalue;
    public String getFactory() {
            return factory;
        }

        public void setFactory(String factory) {
            this.factory = factory;
        }
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getWID_out() {
            return WID_out;
        }

        public void setWID_out(String WID_out) {
            this.WID_out = WID_out;
        }

        public String getUser_id() {
            return user_id;
        }

        public void setUser_id(String user_id) {
            this.user_id = user_id;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public Double getValue() {
            return value;
        }

    @Override
    public String toString() {
        return "waterrModel{" +
                "id=" + id +
                ", WID_out='" + WID_out + '\'' +
                ", user_id='" + user_id + '\'' +
                ", time='" + time + '\'' +
                ", value=" + value +
                ", picture='" + picture + '\'' +
                ", factory='" + factory + '\'' +
                '}';
    }

    public void setValue(Double value) {
            this.value = value;
        }

        public String getPicture() {
            return picture;
        }

        public void setPicture(String picture) {
            this.picture = picture;
        }
}

package com.xyk.model;

import java.io.Serializable;

public class managerModel implements Serializable {
    private String manager_telephone;
    private String password;
    private String manager_nicheng;
    private String manager_name;
    private String manager_IDcard;
    private String headpic;
    private String role;
    private String nativeplace;
    private String factory;
    public managerModel() {}

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getManager_telephone() {
        return manager_telephone;
    }

    public void setManager_telephone(String manager_telephone) {
        this.manager_telephone = manager_telephone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getManager_nicheng() {
        return manager_nicheng;
    }

    public void setManager_nicheng(String manager_nicheng) {
        this.manager_nicheng = manager_nicheng;
    }

    public String getManager_name() {
        return manager_name;
    }

    public void setManager_name(String manager_name) {
        this.manager_name = manager_name;
    }

    public String getManager_IDcard() {
        return manager_IDcard;
    }

    public void setManager_IDcard(String manager_IDcard) {
        this.manager_IDcard = manager_IDcard;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNativeplace() {
        return nativeplace;
    }

    public void setNativeplace(String nativeplace) {
        this.nativeplace = nativeplace;
    }

    public managerModel(String c) {
        String[] split = c.split(",");
        this.manager_telephone = split[0];
        this.password = split[1];
        this.manager_nicheng = split[2];
        this.manager_name = split[3];
        this.manager_IDcard = split[4];
        this.headpic = split[5];
        this.role = split[6];
        this.nativeplace = split[7];
        this.factory = split[8];
    }

    @Override
    public String toString() {
        return  manager_telephone+","+password+","+manager_nicheng+","+manager_name+","+manager_IDcard+","+headpic+","+role+","+nativeplace+","+factory;
    }
}

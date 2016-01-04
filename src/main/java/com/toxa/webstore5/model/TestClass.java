package com.toxa.webstore5.model;


import java.io.Serializable;

public class TestClass implements Serializable {

    String name;
    String staffName[];

    public TestClass() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getStaffName() {
        return staffName;
    }

    public void setStaffName(String[] staffName) {
        this.staffName = staffName;
    }
}

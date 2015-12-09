package com.toxa.webstore5.model;

public enum UserProfileType {

    ADMIN("ADMIN"),
    USER("USER");

    private String userProfileType;


    public String getUserProfileType() {
        return userProfileType;
    }

    private UserProfileType(String userProfileType) {
        this.userProfileType = userProfileType;
    }
}

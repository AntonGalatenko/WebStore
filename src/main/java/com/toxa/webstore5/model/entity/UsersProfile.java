package com.toxa.webstore5.model.entity;

import com.toxa.webstore5.model.UserProfileType;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table (name = "users_profile")
public class UsersProfile {

    private int id;
    private String type = UserProfileType.USER.getUserProfileType();
    private Set<Users> usersSet = new HashSet<Users>();

    public UsersProfile() {
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @OneToMany (mappedBy = "usersProfile")
    public Set<Users> getUsersSet() {
        return usersSet;
    }

    public void setUsersSet(Set<Users> usersSet) {
        this.usersSet = usersSet;
    }
}

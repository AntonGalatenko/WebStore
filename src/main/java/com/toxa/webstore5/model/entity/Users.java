package com.toxa.webstore5.model.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Users implements Serializable{

    private int id;
    private String firstName;
    private String lastName;
    private int age;
    private String email;
    private String password;
    private Set<Items> items = new HashSet<Items>();
    private UsersProfile usersProfile;

    public Users() {
    }

    public Users(String firstName, String lastName, int age, String email, String password, UsersProfile usersProfile) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.email = email;
        this.password = password;
        this.usersProfile = usersProfile;
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "first_name")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "last_name")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Column
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @ManyToMany(mappedBy = "users", fetch = FetchType.EAGER)
    public Set<Items> getItems() {
        return items;
    }

    public void setItems(Set<Items> items) {
        this.items = items;
    }

    @Column
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "profile_id")
    public UsersProfile getUsersProfile() {
        return usersProfile;
    }

    public void setUsersProfile(UsersProfile usersProfile) {
        this.usersProfile = usersProfile;
    }

    @Override
    public String toString(){
        return ("User: " + firstName + " " + lastName + ", " + email);
    }
}

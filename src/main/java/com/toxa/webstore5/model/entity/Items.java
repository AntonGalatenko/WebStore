package com.toxa.webstore5.model.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Items {

    private int id;
    private String product;
    private String description;
    private int count;
    private int price;
    private Set<Users> users = new HashSet<Users>();

    public Items() {
    }

    public Items(String product, String description, int count, int price) {
        this.product = product;
        this.description = description;
        this.count = count;
        this.price = price;
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
    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    @Column
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Column
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @ManyToMany(mappedBy = "items", fetch = FetchType.EAGER)
    public Set<Users> getUsers() {
        return users;
    }

    public void setUsers(Set<Users> users) {
        this.users = users;
    }
}

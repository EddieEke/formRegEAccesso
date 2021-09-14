package com.silicondev.formRegEAccesso.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name="user_authentication", schema="user_access")
public class UserAuthentication {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id")
    private int id;

    @Column(name= "username")
    private String username;

    @Column(name= "email")
    private String email;

    @Column(name= "password")
    private String password;

    @Column(name= "telephone")
    private String telephone;

    @Column(name= "subscription1")
    private boolean subscription1;

    @Column(name= "subscription2")
    private boolean subscription2;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name="user_id", nullable=false)
    private User user;

    public UserAuthentication() {}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public boolean getSubscription1() {
        return subscription1;
    }

    public void setSubscription1(boolean subscription1) {
        this.subscription1 = subscription1;
    }

    public boolean getSubscription2() {
        return subscription2;
    }

    public void setSubscription2(boolean subscription2) {
        this.subscription2 = subscription2;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

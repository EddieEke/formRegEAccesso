package com.silicondev.formRegEAccesso.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table (name = "user", schema = "user_access")
public class User {

    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "fiscal_Code")
    private String fiscalCode;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "country_of_birth")
    private String countryOfBirth;

    @Column(name = "city_of_birth")
    private String cityOfBirth;

    @Column(name = "gender")
    private String gender;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval=true)
    public List<UserAuthentication> userAuthenticationList;

    public User() {
    }

    public User(int id, String name, String surname, String fiscalCode) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.fiscalCode = fiscalCode;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCountryOfBirth() {
        return countryOfBirth;
    }

    public void setCountryOfBirth(String countryOfBirth) {
        this.countryOfBirth = countryOfBirth;
    }

    public String getCityOfBirth() {
        return cityOfBirth;
    }

    public void setCityOfBirth(String cityOfBirth) {
        this.cityOfBirth = cityOfBirth;
    }

    public List<UserAuthentication> getUserAuthenticationList() {
        return userAuthenticationList;
    }

    public void setUserAuthenticationList(List<UserAuthentication> userAuthenticationList) {
        this.userAuthenticationList = userAuthenticationList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFiscalCode() {
        return fiscalCode;
    }

    public void setFiscalCode(String fiscalCode) {
        this.fiscalCode = fiscalCode;
    }
}

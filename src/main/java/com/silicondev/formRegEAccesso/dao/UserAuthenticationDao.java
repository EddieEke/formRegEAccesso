package com.silicondev.formRegEAccesso.dao;

import com.silicondev.formRegEAccesso.model.User;
import com.silicondev.formRegEAccesso.model.UserAuthentication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserAuthenticationDao extends JpaRepository<UserAuthentication, Integer> {
    UserAuthentication findByEmail(String email);
    UserAuthentication findByUsername(String email);
    void deleteById(int id);

}

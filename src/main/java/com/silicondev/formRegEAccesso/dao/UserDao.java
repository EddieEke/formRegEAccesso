package com.silicondev.formRegEAccesso.dao;

import com.silicondev.formRegEAccesso.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {

    User findByFiscalCode(String fiscalCode);


}

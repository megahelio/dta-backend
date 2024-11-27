package com.balanced.isbalanced.repository;

import com.balanced.isbalanced.entity.Atc;
import com.balanced.isbalanced.entity.AtcId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AtcRepository extends JpaRepository<Atc, AtcId> {

    List<Atc> findByAtcCode(String atcCode);

    @Query("select distinct a.atcCode from Atc a ")
    List<String> getAllAtcCodes();

    @Query("select distinct a.locale from Atc a ")
    List<String> getAvailableLanguages();
}

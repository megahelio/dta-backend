package com.balanced.isbalanced.repository;

import com.balanced.isbalanced.entity.DrugLanguage;
import com.balanced.isbalanced.entity.DrugLanguageId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.Set;

@Repository
public interface DrugLanguageRepository extends JpaRepository<DrugLanguage, DrugLanguageId> {

    @Query(value = "select distinct name from drug", nativeQuery = true)
    Set<String> findDistinctNames();


    @Query("select a from DrugLanguage a where a.id.locale = :locale")
    List<DrugLanguage> findAllByLocale(@Param("locale") Locale locale);


    @Query("SELECT a from DrugLanguage a where a.name like :name")
    List<DrugLanguage> getAllIdByName(String name);


    @Query(value = "select a from DrugLanguage a where a.id.drug.drugId = :id and a.id.locale = :locale ")
    DrugLanguage findByIdAndLocale(@Param("id") long id, @Param("locale") Locale locale);

    @Query(nativeQuery = true, value = "SELECT * FROM DrugLanguage d WHERE d.drugId = :drugId")
    List<DrugLanguage> findByDrugId(@Param("drugId") Long drugId);

    @Query("select a from DrugLanguage a where a.name like %:name% and a.id.locale = :locale")
    Optional<DrugLanguage> getByNameAndLocale(@Param("name") String name, @Param("locale") Locale locale);

    @Query("select distinct a.id.locale from DrugLanguage a ")
    List<String> getAvailableLanguages();
}
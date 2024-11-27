package com.balanced.isbalanced.repository;

import com.balanced.isbalanced.entity.SanitaryAlert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SanitaryAlertRepository extends JpaRepository<SanitaryAlert, Long> {
}

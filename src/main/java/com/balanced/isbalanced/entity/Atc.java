package com.balanced.isbalanced.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.io.Serializable;
import java.util.Locale;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@IdClass(AtcId.class)
public class Atc implements Serializable {

    @Id
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private String atcCode;

    @Id
    private Locale locale;

    private String atcDescription;

}

package com.balanced.isbalanced.entity;


import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

/**
 * Entity {@link DrugLanguage}
 */
@Entity
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DrugLanguage implements Serializable {
    @Serial
    private static final long serialVersionUID = 42L;

    @EmbeddedId
    private DrugLanguageId id;

    private String name;

    private String indication;

    @Column(columnDefinition = "TEXT")
    private String benefitsAvoid;

    @Column(columnDefinition = "TEXT")
    private String reasonWhyToAvoid;

    @Column(columnDefinition = "TEXT")
    private String alternativeProposalPrescribe;

}



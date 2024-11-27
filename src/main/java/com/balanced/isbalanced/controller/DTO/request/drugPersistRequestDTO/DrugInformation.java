package com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DrugInformation implements Serializable {
    @Serial
    private static final long serialVersionUID = 42L;

    private String name;

    private String indication;

    private String benefitsAvoid;

    private String reasonWhyToAvoid;

    private String alternativeProposalPrescribe;

    private String atcDescription;
}

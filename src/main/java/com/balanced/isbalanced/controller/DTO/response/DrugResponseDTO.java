package com.balanced.isbalanced.controller.DTO.response;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Data
public class DrugResponseDTO implements Serializable {

    @Serial
    private static final long serialVersionUID = 42L;

    private long drugId;

    private String name;

    private String indication;

    private String benefitsAvoid;

    private String reasonWhyToAvoid;

    private String alternativeProposalPrescribe;

    private String atcName;

    private String atcDescription;

    private List<String> sanitaryAlerts;
}

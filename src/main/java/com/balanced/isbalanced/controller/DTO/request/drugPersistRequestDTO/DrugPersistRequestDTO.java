package com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.util.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DrugPersistRequestDTO implements Serializable {
    @Serial
    private static final long serialVersionUID = 42L;

    private String atcName;

    private Map<Locale, DrugInformation> translations = new HashMap<>();

    private List<String> sanitaryAlerts = new ArrayList<>();

}

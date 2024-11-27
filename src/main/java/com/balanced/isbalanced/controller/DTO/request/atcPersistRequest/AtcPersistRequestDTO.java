package com.balanced.isbalanced.controller.DTO.request.atcPersistRequest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AtcPersistRequestDTO {
    private String atcCode;
    private Map<Locale, String> descriptions = new HashMap<>();
}

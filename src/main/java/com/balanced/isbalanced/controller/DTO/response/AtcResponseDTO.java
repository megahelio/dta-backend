package com.balanced.isbalanced.controller.DTO.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serial;
import java.util.Locale;
import java.util.Map;

@Data
@AllArgsConstructor
public class AtcResponseDTO {
    @Serial
    private static final long serialVersionUID = 42L;

    private String atcCode;

    private Map<Locale, String> descriptions;
}

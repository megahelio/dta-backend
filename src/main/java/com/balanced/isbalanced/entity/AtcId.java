package com.balanced.isbalanced.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Locale;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AtcId implements Serializable {
    private String atcCode;
    private Locale locale;
}

package com.balanced.isbalanced.controller.DTO.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ErrorResponse {
    private String message;
    private int code;
    private String moreInfo;
}

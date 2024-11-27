package com.balanced.isbalanced.controller.exception;

public class AtcNotFoundException extends RuntimeException {
    public AtcNotFoundException(String message) {
        super(message);
    }
}

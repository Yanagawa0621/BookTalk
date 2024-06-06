package com.user.model;

import java.util.HashMap;
import java.util.Map;

public class DuplicateFieldException extends Exception {
    private final Map<String, String> errorMessage;

    public DuplicateFieldException(String field, String message) {
        errorMessage = new HashMap<>();
        errorMessage.put(field, message);
    }

    public Map<String, String> getErrorMessage() {
        return errorMessage;
    }
}

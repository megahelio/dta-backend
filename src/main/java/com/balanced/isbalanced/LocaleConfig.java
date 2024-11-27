package com.balanced.isbalanced;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import java.util.Locale;

@Configuration
public class LocaleConfig {
    static public Locale DEFAULT_LOCALE;
    @Value("${default_locale_language}")
    private String DEFAULT_LANGUAGE;
    @Value("${default_locale_country}")
    private String DEFAULT_COUNTRY;

    public void setupDefaultLocale() {
        DEFAULT_LOCALE = new Locale(DEFAULT_LANGUAGE, DEFAULT_COUNTRY);
    }
}

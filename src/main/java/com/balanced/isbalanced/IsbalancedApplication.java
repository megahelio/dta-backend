package com.balanced.isbalanced;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class IsbalancedApplication implements CommandLineRunner {
    @Autowired
    private LocaleConfig localeConfig;

    public static void main(final String[] args) {
        SpringApplication.run(IsbalancedApplication.class, args);
    }

    @Override
    public void run(final String... args) {
        this.localeConfig.setupDefaultLocale();
    }
}

package com.balanced.isbalanced.entity;

import com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO.DrugInformation;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;


@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString()
public class Drug implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private long drugId;

    private String atcCode;

    @OneToMany(mappedBy = "id.drug", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    @Builder.Default
    @ToString.Exclude
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<DrugLanguage> drugLanguages = new ArrayList<>();

    @OneToMany(mappedBy = "drug", cascade = CascadeType.ALL)
    @JsonManagedReference
    @Builder.Default
    @ToString.Exclude
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private List<SanitaryAlert> sanitaryAlerts = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, targetEntity = Atc.class)
    @JoinColumn(name = "atcCode", referencedColumnName = "atcCode", updatable = false, insertable = false)
    @Builder.Default
    private List<Atc> atc = new ArrayList<>();

    public DrugLanguage getDrugLanguage(Locale locale, Locale fallback) {
        DrugLanguage drugLanguage;
        try {
            drugLanguage = this.drugLanguages.stream().filter(language -> language.getId().getLocale().equals(locale)).findFirst().get();
        } catch (NoSuchElementException noSuchElementException) {
            drugLanguage = this.drugLanguages.stream().filter(language -> language.getId().getLocale().equals(fallback)).findFirst().orElse(null);
        }
        return drugLanguage;
    }

    public void addDrugLanguage(Locale locale, DrugInformation drugInformation) {
        this.drugLanguages.add(DrugLanguage.builder()
                .id(new DrugLanguageId(this, locale))
                .name(drugInformation.getName())
                .indication(drugInformation.getIndication())
                .benefitsAvoid(drugInformation.getBenefitsAvoid())
                .reasonWhyToAvoid(drugInformation.getReasonWhyToAvoid())
                .alternativeProposalPrescribe(drugInformation.getAlternativeProposalPrescribe())
                .build());
    }

    public void addDrugLanguages(Map<Locale, DrugInformation> drugLanguages) {
        drugLanguages.forEach((locale, drugInformation) -> this.addDrugLanguage(locale, drugInformation));
    }

    public String getAtcDescription(Locale locale, Locale fallback) {
        String description;
        try {
            description = this.atc.stream().filter(atc -> atc.getLocale().equals(locale)).findFirst().get().getAtcDescription();
        } catch (NoSuchElementException noSuchElementException) {
            description = this.atc.stream().filter(atc -> atc.getLocale().equals(fallback)).findFirst().orElse(new Atc()).getAtcDescription();
        }
        return description;
    }

    public void addAtc(Atc atc) {
        if (atc.getAtcCode().equals(this.atcCode)) {
            this.atc.add(atc);
        } else {
            throw new IllegalArgumentException("No coinciden los códigos atc");
        }
    }

    public List<String> getSanitaryAlertLinks() {
        return this.getSanitaryAlerts().stream().map(sanitaryAlert -> sanitaryAlert.getLink()).collect(Collectors.toList());
    }

    public void addSanitaryAlert(String sanitaryAlertLink) {
        this.sanitaryAlerts.add(SanitaryAlert.builder()
                .drug(this)
                .link(sanitaryAlertLink)
                .build());
    }

    public void addSanitaryAlerts(Iterable<String> sanitaryAlertLinks) {
        sanitaryAlertLinks.forEach(sanitaryAlertLink -> this.addSanitaryAlert(sanitaryAlertLink));
    }

}

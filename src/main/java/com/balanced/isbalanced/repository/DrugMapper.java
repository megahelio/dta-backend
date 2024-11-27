package com.balanced.isbalanced.repository;

import com.balanced.isbalanced.LocaleConfig;
import com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO.DrugInformation;
import com.balanced.isbalanced.controller.DTO.response.DrugResponseDTO;
import com.balanced.isbalanced.entity.Drug;
import com.balanced.isbalanced.entity.DrugLanguage;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Mapper(componentModel = "spring", imports = {LocaleContextHolder.class, LocaleConfig.class})
public interface DrugMapper {

    @Mapping(target = "drugId", source = "drugId")
    @Mapping(target = "atcName", expression = "java(drug.getAtcCode())")
    @Mapping(target = "atcDescription", expression = "java(drug.getAtcDescription(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE))")
    @Mapping(target = "name", expression = "java(drug.getDrugLanguage(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE).getName())")
    @Mapping(target = "indication", expression = "java(drug.getDrugLanguage(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE).getIndication())")
    @Mapping(target = "benefitsAvoid", expression = "java(drug.getDrugLanguage(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE).getBenefitsAvoid())")
    @Mapping(target = "reasonWhyToAvoid", expression = "java(drug.getDrugLanguage(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE).getReasonWhyToAvoid())")
    @Mapping(target = "alternativeProposalPrescribe", expression = "java(drug.getDrugLanguage(LocaleContextHolder.getLocale(), LocaleConfig.DEFAULT_LOCALE).getAlternativeProposalPrescribe())")
    @Mapping(target = "sanitaryAlerts", expression = "java(drug.getSanitaryAlertLinks())")
    DrugResponseDTO drugToDrugTranslateResponseDTO(Drug drug);

    List<DrugResponseDTO> drugToDrugTranslateResponseDTO(List<Drug> drugList);

    DrugInformation drugInformation(DrugLanguage drugLanguage, String atcDescription);


}

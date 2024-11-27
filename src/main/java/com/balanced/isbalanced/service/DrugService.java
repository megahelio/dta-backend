package com.balanced.isbalanced.service;

import com.balanced.isbalanced.LocaleConfig;
import com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO.DrugInformation;
import com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO.DrugPersistRequestDTO;
import com.balanced.isbalanced.controller.DTO.response.DrugResponseDTO;
import com.balanced.isbalanced.entity.Atc;
import com.balanced.isbalanced.entity.Drug;
import com.balanced.isbalanced.entity.DrugLanguage;
import com.balanced.isbalanced.entity.SanitaryAlert;
import com.balanced.isbalanced.repository.*;
import jakarta.transaction.Transactional;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DrugService {
    @Autowired
    private DrugLanguageRepository drugLanguageRepository;
    @Autowired
    private DrugRepository drugRepository;
    @Autowired
    private DrugMapper drugMapper;
    @Autowired
    private AtcRepository atcRepository;
    @Autowired
    private SanitaryAlertRepository sanitaryAlertRepository;

    /**
     * All information of all drugs
     *
     * @return
     */
    public List<DrugPersistRequestDTO> dump() {

        List<DrugLanguage> findAllList = this.drugLanguageRepository.findAll();
        Map<Long, DrugPersistRequestDTO> drugCreationRequestDTOHashMap = new HashMap<>();

        for (DrugLanguage drug : findAllList) {
            if (!drugCreationRequestDTOHashMap.containsKey(drug.getId().getDrug().getDrugId())) {
                Map<Locale, DrugInformation> translations = new HashMap<>();
                translations.put(drug.getId().getLocale(), drugMapper.drugInformation(drug, drug.getId().getDrug().getAtcDescription(drug.getId().getLocale(), null)));

                List<String> sanitaryAlertsLinks = new ArrayList<>();
                for (SanitaryAlert sanitaryAlert : drug.getId().getDrug().getSanitaryAlerts()) {
                    sanitaryAlertsLinks.add(sanitaryAlert.getLink());
                }
                drugCreationRequestDTOHashMap.put(drug.getId().getDrug().getDrugId(), DrugPersistRequestDTO.builder()
                        .atcName(drug.getId().getDrug().getAtcCode())
                        .translations(translations)
                        .sanitaryAlerts(sanitaryAlertsLinks)
                        .build());
            } else {
                //Adding other translation
                drugCreationRequestDTOHashMap.get(drug.getId().getDrug().getDrugId()).getTranslations()
                        .put(drug.getId().getLocale(), drugMapper.drugInformation(drug, drug.getId().getDrug().getAtcDescription(drug.getId().getLocale(), null)));
            }

        }
        return drugCreationRequestDTOHashMap.values().stream().toList();
    }

    /**
     * All translations of one drug
     *
     * @param id
     * @return
     */
    public DrugPersistRequestDTO dumpOne(long id) {//TODO rename method

        if (!this.drugRepository.existsById(id)) {
            throw new NoSuchElementException();
        }

        List<DrugLanguage> findAllList = this.drugLanguageRepository.findByDrugId(id);
        if (findAllList.isEmpty()) {
            return null;
        }
        DrugPersistRequestDTO drugPersistRequestDTO = new DrugPersistRequestDTO();
        drugPersistRequestDTO.setAtcName(findAllList.get(0).getId().getDrug().getAtcCode());
        Map<Locale, DrugInformation> translations = new HashMap<>();
        for (DrugLanguage drug : findAllList) {
            translations.put(drug.getId().getLocale(), drugMapper.drugInformation(drug, drug.getId().getDrug().getAtcDescription(drug.getId().getLocale(), null)));
            drugPersistRequestDTO.getTranslations().putAll(translations);
        }
        for (SanitaryAlert sanitaryAlert : findAllList.get(0).getId().getDrug().getSanitaryAlerts()) {
            drugPersistRequestDTO.getSanitaryAlerts().add(sanitaryAlert.getLink());
        }
        return drugPersistRequestDTO;
    }

    public List<DrugResponseDTO> getAll() {
        List<Drug> drugList = this.drugRepository.findAll();
        return this.drugMapper.drugToDrugTranslateResponseDTO(drugList);
    }

    public DrugResponseDTO findById(long id) {
        try {

            Drug drug = this.drugRepository.findById(id).orElseThrow();
            DrugLanguage drugLanguage = this.drugLanguageRepository.findByIdAndLocale(id, LocaleContextHolder.getLocale());
            if (drugLanguage == null) {
                drugLanguage = this.drugLanguageRepository.findByIdAndLocale(id, LocaleConfig.DEFAULT_LOCALE);
            }
            return this.drugMapper.drugToDrugTranslateResponseDTO(drug);
        } catch (NoSuchElementException noSuchElementException) {
            return null;
        }
    }

    public DrugResponseDTO findByName(String name) {

        DrugLanguage drugLanguage = this.drugLanguageRepository.getByNameAndLocale(name.toLowerCase(), LocaleContextHolder.getLocale())
                .orElseGet(() -> this.drugLanguageRepository.getByNameAndLocale(name.toLowerCase(), LocaleConfig.DEFAULT_LOCALE).orElse(null));

        if (drugLanguage == null) {
            return null;
        } else {
            return this.drugMapper.drugToDrugTranslateResponseDTO(drugLanguage.getId().getDrug());
        }
    }


    public Drug save(DrugPersistRequestDTO drugDTO) {

        //TODO validate drugDTO before save
        List<Atc> atcList = new ArrayList<>();
        Drug drug = Drug.builder()
                .atcCode(drugDTO.getAtcName())
                .build();
        //Creación Drug con las alertas sanitarias
        drug.addSanitaryAlerts(drugDTO.getSanitaryAlerts());

        //Creación Traducciones asociadas
        drug.addDrugLanguages(drugDTO.getTranslations());

        drugDTO.getTranslations().forEach((locale, drugInformation) -> {
            drug.addAtc(new Atc(drugDTO.getAtcName(), locale, drugInformation.getAtcDescription()));
            if (this.atcRepository.findByAtcCode(drugDTO.getAtcName()).isEmpty()) {//if Atc not created
                atcList.add(new Atc(drugDTO.getAtcName(), locale, drugInformation.getAtcDescription()));
            }
        });

        this.atcRepository.saveAll(atcList);
        return this.drugRepository.save(drug);
    }


    /**
     * Deletes a {@link Drug} with the given ID
     *
     * @param id Drug ID – must not null
     * @return true if an entity with the given ID exists after delete, false otherwise.
     */
    public boolean delete(long id) {
        this.drugRepository.deleteById(id);
        return !this.drugRepository.existsById(id);
    }

    @Transactional
    public Drug update(long id, DrugPersistRequestDTO drugPersistRequestDTO) throws BadRequestException {
        Optional<Drug> drugToSaveOptional = this.drugRepository.findById(id);
        if (drugToSaveOptional.isPresent()) {
            Drug drugToSave = drugToSaveOptional.get();
            //Update Atc
            if (!drugToSave.getAtcCode().equals(drugPersistRequestDTO.getAtcName())) {
                if (this.atcRepository.getAllAtcCodes().contains(drugPersistRequestDTO.getAtcName())) {
                    drugToSave.setAtcCode(drugPersistRequestDTO.getAtcName());
                    drugToSave.setAtc(this.atcRepository.findByAtcCode(drugPersistRequestDTO.getAtcName()));
                } else {
                    throw new BadRequestException("ATC name not found");
                }
            }
            //Update Transalations
            drugToSave.getDrugLanguages().clear();
            drugToSave.addDrugLanguages(drugPersistRequestDTO.getTranslations());
            //Update sanitaryAlerts
            if (!(drugToSave.getSanitaryAlertLinks().containsAll(drugPersistRequestDTO.getSanitaryAlerts()) && drugPersistRequestDTO.getSanitaryAlerts().containsAll(drugToSave.getSanitaryAlertLinks()))) {
                //TODO check link format
                this.sanitaryAlertRepository.deleteAll(drugToSave.getSanitaryAlerts());
                drugToSave.getSanitaryAlerts().clear();
                drugToSave.addSanitaryAlerts(drugPersistRequestDTO.getSanitaryAlerts());
            }

            this.drugRepository.save(drugToSave);
            return this.drugRepository.getReferenceById(id);
        } else {
            throw new NoSuchElementException("No element with ID provided");
        }
    }

    public List<String> getAvailableLanguages() {
        return this.drugLanguageRepository.getAvailableLanguages();
    }


}

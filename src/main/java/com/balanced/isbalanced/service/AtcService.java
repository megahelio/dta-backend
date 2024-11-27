package com.balanced.isbalanced.service;

import com.balanced.isbalanced.controller.DTO.request.atcPersistRequest.AtcPersistRequestDTO;
import com.balanced.isbalanced.controller.DTO.response.AtcResponseDTO;
import com.balanced.isbalanced.entity.Atc;
import com.balanced.isbalanced.repository.AtcRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AtcService {

    @Autowired
    private AtcRepository atcRepository;

    public List<String> getAll() {
        return this.atcRepository.getAllAtcCodes();
    }

    public AtcResponseDTO getAtc(String id) {
        Atc probe = Atc.builder().atcCode(id).build();
        List<Atc> atcList = this.atcRepository.findAll(Example.of(probe));
        AtcResponseDTO atcResponseDTO = new AtcResponseDTO("", new HashMap<>());
        if (!atcList.isEmpty()) {
            atcResponseDTO.setAtcCode(id);
            atcList.forEach((atc -> {
                atcResponseDTO.getDescriptions().put(atc.getLocale(), atc.getAtcDescription());
            }));
        }
        return atcResponseDTO;
    }

    public AtcResponseDTO save(AtcPersistRequestDTO atcPersistRequestDTO) {
        if (atcPersistRequestDTO.getAtcCode().isEmpty()) {
            throw new IllegalArgumentException("ATC empty");
        }
        if (!atcPersistRequestDTO.getDescriptions().containsKey(Locale.of("es", "ES"))) {
            throw new IllegalArgumentException("ATC does not include es_ES description");
        }
        if (!this.atcRepository.findByAtcCode(atcPersistRequestDTO.getAtcCode()).isEmpty()) {
            throw new DataIntegrityViolationException("ATC already exists: " + atcPersistRequestDTO.getAtcCode());
        }
        //TODO validate AtcPersistRequestDTO before save

        List<Atc> atcToSave = new ArrayList<>();
        atcPersistRequestDTO.getDescriptions().forEach((locale, atcDescription) -> {
            atcToSave.add(new Atc(atcPersistRequestDTO.getAtcCode(), locale, atcDescription));
        });

        List<Atc> savedAtc = this.atcRepository.saveAll(atcToSave);
        AtcResponseDTO atcResponseDTO = new AtcResponseDTO("", new HashMap<>());
        if (!savedAtc.isEmpty()) {
            atcResponseDTO.setAtcCode(savedAtc.get(0).getAtcCode());
            savedAtc.forEach((atc -> {
                atcResponseDTO.getDescriptions().put(atc.getLocale(), atc.getAtcDescription());
            }));
        }

        return atcResponseDTO;

    }

    public boolean delete(String id) {
        Atc probe = Atc.builder().atcCode(id).build();
        List<Atc> atcToDelete = this.atcRepository.findAll(Example.of(probe));
        if (atcToDelete.isEmpty()) {
            throw new NoSuchElementException("Not found any ATC: " + id);
        }

        this.atcRepository.deleteAll(atcToDelete);
        return this.atcRepository.findAll(Example.of(probe)).isEmpty();
    }

    @Transactional
    public List<Atc> update(String id, AtcPersistRequestDTO atcPersistRequestDTO) {
        Atc probe = Atc.builder().atcCode(id).build();
        Set<Atc> oldAtcSet = new HashSet<>(this.atcRepository.findAll(Example.of(probe)));
        if (oldAtcSet.isEmpty()) {
            throw new NoSuchElementException("Not found any ATC: " + id);
        }
        Set<Atc> atcPersistRequestDTOSet = new HashSet<>();
        atcPersistRequestDTO.getDescriptions().forEach((locale, description) -> {
            atcPersistRequestDTOSet.add(new Atc(id, locale, description));
        });
        //Diferencia de conjuntos para eliminar aquellas traducciones ATC que no vengan en la peticion
        oldAtcSet.removeAll(atcPersistRequestDTOSet);
        this.atcRepository.deleteAll(oldAtcSet);
        return this.atcRepository.saveAll(atcPersistRequestDTOSet);
    }

    public List<String> getAvailableLanguages() {
        return this.atcRepository.getAvailableLanguages();
    }
}

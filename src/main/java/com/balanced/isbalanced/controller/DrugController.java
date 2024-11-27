package com.balanced.isbalanced.controller;

import com.balanced.isbalanced.controller.DTO.request.drugPersistRequestDTO.DrugPersistRequestDTO;
import com.balanced.isbalanced.controller.DTO.response.DrugResponseDTO;
import com.balanced.isbalanced.controller.DTO.response.ErrorResponse;
import com.balanced.isbalanced.controller.exception.DrugNotFoundException;
import com.balanced.isbalanced.entity.Drug;
import com.balanced.isbalanced.entity.DrugLanguage;
import com.balanced.isbalanced.service.AtcService;
import com.balanced.isbalanced.service.DrugService;
import jakarta.transaction.Transactional;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

/**
 * Controlador para {@link DrugLanguage}
 */
@RestController
@RequestMapping(path = "/api", produces = APPLICATION_JSON_VALUE)
public class DrugController {

    @Autowired
    private DrugService drugService;
    @Autowired
    private AtcService atcService;


    /**
     * Obtener todos los elementos {@link  DrugLanguage} disponibles
     *
     * @return {@link List< DrugResponseDTO > }
     */
    @GetMapping(path = "/drugs", produces = "application/json")
    public ResponseEntity<List<DrugResponseDTO>> findAllByLocale() {
        return new ResponseEntity<>(this.drugService.getAll(), HttpStatus.OK);

    }

    /**
     * Obtener todos los elementos {@link  DrugLanguage} disponibles
     *
     * @return {@link List< DrugResponseDTO > }
     */
    @GetMapping(path = "/dump", produces = "application/json")
    public ResponseEntity<List<DrugPersistRequestDTO>> findAll() {//TODO rename method
        return new ResponseEntity<>(this.drugService.dump(), HttpStatus.OK);

    }

    /**
     * Obtener todos los elementos {@link  DrugLanguage} disponibles de una droga.
     *
     * @return {@link List< DrugResponseDTO > }
     */
    @GetMapping(path = "/drug/{id}/all", produces = "application/json")
    public ResponseEntity<DrugPersistRequestDTO> findByIdFull(@PathVariable(value = "id") long id) {//TODO rename method
        return new ResponseEntity<>(this.drugService.dumpOne(id), HttpStatus.OK);

    }

    /**
     * Obtiene un elemento {@link  DrugLanguage} según su id
     *
     * @param id identificador del medicamento
     * @return ResponseEntity<DrugResponseDTO> {@link DrugResponseDTO}
     */
    @GetMapping(path = "/drug/{id}", produces = "application/json")
    public ResponseEntity<DrugResponseDTO> findById(@PathVariable(value = "id") long id) {//BAD REQUEST controlado en la firma
        DrugResponseDTO drugResponseDTO = this.drugService.findById(id);
        if (drugResponseDTO == null) {
            throw new DrugNotFoundException("Drug not found");//NOT FOUND
        }
        return new ResponseEntity<>(drugResponseDTO, HttpStatus.OK);
    }

    /**
     * Obtiene un elemento {@link  DrugLanguage} según su nombre
     *
     * @param name nombre del medicamento
     * @return ResponseEntity<DrugResponseDTO> {@link DrugResponseDTO}
     */
    @GetMapping(path = "/drug", produces = "application/json")
    public ResponseEntity<DrugResponseDTO> findByNameAndLocale(@RequestParam(value = "name") String name) {
        DrugResponseDTO byName = this.drugService.findByName(name);
        if (byName == null)
            throw new DrugNotFoundException("Drug not found");
        return new ResponseEntity<>(byName, HttpStatus.OK);
    }

    @PostMapping(path = "/drug", produces = "application/json")
    @Transactional
    public ResponseEntity<Drug> createDrug(@RequestBody DrugPersistRequestDTO drugDTO) {
        System.out.println(drugDTO.getTranslations().toString());
        return new ResponseEntity<>(this.drugService.save(drugDTO), HttpStatus.CREATED);
    }

    @GetMapping(path = "/drug/available_languages")
    public ResponseEntity<List<String>> getAvailableDrugLanguages() {
        List<String> availableLanguages = this.drugService.getAvailableLanguages();
        return new ResponseEntity<>(availableLanguages, HttpStatus.OK);
    }

    @PutMapping(path = "/drug/{id}")
    @Transactional
    public ResponseEntity<Drug> updateDrug(@PathVariable(value = "id") long id, @RequestBody DrugPersistRequestDTO drugDTO) {
        try {
            Drug drug = this.drugService.update(id, drugDTO);
            return new ResponseEntity<>(drug, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            throw new DrugNotFoundException("Drug not found");
        } catch (BadRequestException e) {
            throw new DataIntegrityViolationException(e.getMessage());
        }
    }

    @DeleteMapping(path = "/drug/{id}")
    @Transactional
    public ResponseEntity<DrugResponseDTO> deleteById(@PathVariable(value = "id") long id) {//BAD REQUEST controlado en la firma
        if (this.drugService.delete(id)) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
        }
    }

    @ExceptionHandler({DrugNotFoundException.class})
    private ResponseEntity<ErrorResponse> notFound(DrugNotFoundException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 404, "The Drug not found"), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler({DataIntegrityViolationException.class})
    private ResponseEntity<ErrorResponse> dataIntegrityViolation(DataIntegrityViolationException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 409, ex.getMessage()), HttpStatus.CONFLICT);
    }
}

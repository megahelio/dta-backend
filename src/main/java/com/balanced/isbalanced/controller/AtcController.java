package com.balanced.isbalanced.controller;

import com.balanced.isbalanced.controller.DTO.request.atcPersistRequest.AtcPersistRequestDTO;
import com.balanced.isbalanced.controller.DTO.response.AtcResponseDTO;
import com.balanced.isbalanced.controller.DTO.response.ErrorResponse;
import com.balanced.isbalanced.controller.exception.AtcNotFoundException;
import com.balanced.isbalanced.entity.Atc;
import com.balanced.isbalanced.service.AtcService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@RestController
@RequestMapping(path = "/api", produces = APPLICATION_JSON_VALUE)
public class AtcController {
    @Autowired
    private AtcService atcService;

    @PostMapping(path = "/atc_code", produces = "application/json")
    @Transactional
    public ResponseEntity<AtcResponseDTO> create(@RequestBody AtcPersistRequestDTO atcCode) {
        return new ResponseEntity<>(this.atcService.save(atcCode), HttpStatus.CREATED);
    }

    @PutMapping(path = "/atc_code/{id}", produces = "application/json")
    @Transactional
    public ResponseEntity<List<Atc>> update(@PathVariable(value = "id") String id, @RequestBody AtcPersistRequestDTO atcCode) {

        return new ResponseEntity<>(this.atcService.update(id, atcCode), HttpStatus.CREATED);
    }

    @DeleteMapping(path = "/atc_code/{id}", produces = "application/json")
    @Transactional
    public ResponseEntity<List<Atc>> delete(@PathVariable(value = "id") String id) {
        try {
            if (this.atcService.delete(id)) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            } else {
                return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
            }

        } catch (NoSuchElementException e) {
            throw new AtcNotFoundException(e.getMessage());
        }
    }

    @GetMapping(path = "/atc_code/{id}")
    public ResponseEntity<AtcResponseDTO> get(@PathVariable(value = "id") String id) {
        return new ResponseEntity<>(this.atcService.getAtc(id), HttpStatus.OK);
    }

    @GetMapping(path = "/atc_codes")
    public ResponseEntity<List<String>> getAll() {
        return new ResponseEntity<>(this.atcService.getAll(), HttpStatus.OK);
    }

    @GetMapping(path = "/atc_code/available_languages")
    public ResponseEntity<List<String>> getAvailableDrugLanguages() {
        List<String> availableLanguages = this.atcService.getAvailableLanguages();
        return new ResponseEntity<>(availableLanguages, HttpStatus.OK);
    }

    @ExceptionHandler({AtcNotFoundException.class})
    private ResponseEntity<ErrorResponse> notFound(AtcNotFoundException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 404, "Atc not found"), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler({NoSuchElementException.class})
    private ResponseEntity<ErrorResponse> notFound(NoSuchElementException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 404, "Atc not found"), HttpStatus.NOT_FOUND);
    }


    @ExceptionHandler({DataIntegrityViolationException.class})
    private ResponseEntity<ErrorResponse> dataIntegrityViolation(DataIntegrityViolationException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 409, ex.getMessage()), HttpStatus.CONFLICT);
    }

    @ExceptionHandler({IllegalArgumentException.class})
    private ResponseEntity<ErrorResponse> illegalArgument(IllegalArgumentException ex) {
        return new ResponseEntity<ErrorResponse>(
                new ErrorResponse(ex.getMessage(), 400, ex.getMessage()), HttpStatus.BAD_REQUEST);
    }
}

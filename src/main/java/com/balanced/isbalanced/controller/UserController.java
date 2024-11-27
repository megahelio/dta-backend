package com.balanced.isbalanced.controller;

import com.balanced.isbalanced.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * Autentifica a un usuario
     * <p>
     * SecurityConfig debe autentificar y autorizar este método para devolver 200 OK,
     * en caso contrario se devolverá 401 desde la comprobación
     *
     * @return
     */
    @PostMapping(path = "/login")
    public ResponseEntity login() {
        return new ResponseEntity(HttpStatus.OK);
    }
}

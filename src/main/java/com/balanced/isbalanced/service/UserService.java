package com.balanced.isbalanced.service;

import com.balanced.isbalanced.entity.User;
import com.balanced.isbalanced.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;


    public boolean login(String login, String password) {
        if (login == null || password == null) {
            return false;
        }
        return this.userRepository.exists(new Example<User>() {
            @Override
            public User getProbe() {
                return new User(login, password);
            }

            @Override
            public ExampleMatcher getMatcher() {
                return ExampleMatcher.matchingAll();
            }
        });
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findById(username).orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado"));
        return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), new ArrayList<>());
    }
}


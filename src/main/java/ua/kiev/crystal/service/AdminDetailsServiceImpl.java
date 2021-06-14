package ua.kiev.crystal.service;

import ua.kiev.crystal.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class AdminDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AdminService adminService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Admin admin = adminService.findByLogin(login);
        if (admin == null)
            throw new UsernameNotFoundException(login + " not found");

        List<GrantedAuthority> roles = Arrays.asList(new SimpleGrantedAuthority(admin.getRole().toString()));

        return new User(admin.getLogin(), admin.getPassword(), roles);
    }
}
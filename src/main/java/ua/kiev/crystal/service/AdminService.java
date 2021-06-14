package ua.kiev.crystal.service;

import org.springframework.stereotype.Component;
import ua.kiev.crystal.configs.AppConfig;
import ua.kiev.crystal.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.crystal.other.Role;
import ua.kiev.crystal.repositories.AdminRepository;
import java.util.List;
import java.util.Optional;

@Component
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;

    @Transactional(readOnly = true)
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Admin findByLogin(String login) {
        return adminRepository.findByLogin(login);
    }

    @Transactional
    public void deleteAdmins(List<Long> ids) {
        ids.forEach(id -> {
            Optional<Admin> user = adminRepository.findById(id);
            user.ifPresent(u -> {
                if ( ! AppConfig.ADMIN.equals(u.getLogin())) {
                    adminRepository.deleteById(u.getId());
                }
            });
        });
    }

    @Transactional
    public boolean addAdmin(String login, String passHash,
                           Role role) {
        if (adminRepository.existsByLogin(login))
            return false;

        Admin user = new Admin(login, passHash, role);
        adminRepository.save(user);

        return true;
    }
}

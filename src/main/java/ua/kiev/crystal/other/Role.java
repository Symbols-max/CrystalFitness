package ua.kiev.crystal.other;

public enum Role {
    ADMIN;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }
}

package eshop.entity;

/**
 * @author Евгений
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String passwordCheck;
    private String email;
    private String firstname;
    private String lastname;
    private String address;
    private String chosenProducts;
    private String role;

    public User()
    {}

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public String getPasswordCheck() {
        return passwordCheck;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getChosenProducts() {
        return chosenProducts;
    }

    public void setChosenProducts(String chosenProducts) {
        this.chosenProducts = chosenProducts;
    }
}
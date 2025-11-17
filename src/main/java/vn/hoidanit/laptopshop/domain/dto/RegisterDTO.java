package vn.hoidanit.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import vn.hoidanit.laptopshop.service.validator.RegisterChecked;
import vn.hoidanit.laptopshop.service.validator.StrongPassword;

@RegisterChecked
public class RegisterDTO {
    @NotNull
    @Size(min=2,message = "firstname phải có tối thiểu 2 ký tự")
    private String firstName;
    private String lastName;
    @NotNull
    @Email(message = "Email không được để trống", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
    
    @StrongPassword(message = "password phải có 8 ký tự ")
    private String password;
    private String confirmPassword;
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmpassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    @Override
    public String toString() {
        return "RegisterDTO [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password="
                + password + ", confirmpassword=" + confirmPassword + "]";
    }

}

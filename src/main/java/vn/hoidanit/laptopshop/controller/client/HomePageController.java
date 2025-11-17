package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PutMapping;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
     private final PasswordEncoder PasswordEncoder;
    public HomePageController(ProductService productService,
    UserService userService,
    PasswordEncoder PasswordEncoder){
        this.productService = productService;
        this.userService = userService;
        this.PasswordEncoder = PasswordEncoder;
    }
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.fetchProduct();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }
    @PutMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable Long id) {

        return "redirect:/";
    }
    @GetMapping("/register")
    public String getRegister(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }
    @PostMapping("/register")
    public String handleRegister(
        @ModelAttribute("registerUser")
        @Valid RegisterDTO registerDTO,
        BindingResult bindingResult) {
             if (bindingResult.hasErrors()) {
        return "client/auth/register";
    }
        List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors ) {
            System.out.println (">>>>"+ error.getField() + " - " + error.getDefaultMessage());
            }
        User user = this.userService.registerDTOtoUser(registerDTO);

        String hashPassword =this.PasswordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }


}

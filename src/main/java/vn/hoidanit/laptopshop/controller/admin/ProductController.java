package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService,UploadService uploadService){
        this.productService = productService;
        this.uploadService = uploadService;
    }
    @GetMapping("/admin/product")
    public String getProductPage(Model model){
        List<Product> prs = this.productService.fetchProduct();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }
    @GetMapping("/admin/product/create")
     public String getCreateProduct(Model model){
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }
    @PostMapping("/admin/product/create")
        public String handleCreateProduct(
                @ModelAttribute("newProduct")@Valid Product pr,
                BindingResult newProductBindingResult,
                @RequestParam("hoidanitFile") MultipartFile file) {
                    List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
        System.out.println (">>>>"+ error.getField() + " - " + error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()){
            return "/admin/product/create";
        }
                String image = this.uploadService.handleSaveUploadFile(file,"product");
        pr.setImage(image);
        this.productService.saveProduct(pr);
        return "redirect:/admin/product";
    }
    @GetMapping("/admin/product/{id}")
    public String productDetail(Model model, @PathVariable long id) {
        Product pr  = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }
    @GetMapping("/admin/product/delete/{id}")
     public String deleteProduct(Model model, @PathVariable long id){
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "/admin/product/delete";
    }
    @PostMapping("/admin/product/delete")
    public String deleteProduct(Model model,@ModelAttribute("newProduct") Product pr ){
        this.productService.deleteProduct(pr.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String updateProduct(Model model, @PathVariable long id) {
        Optional<Product> currentProductOpt = this.productService.fetchProductById(id);

        if (currentProductOpt.isPresent()) {
            model.addAttribute("newProduct", currentProductOpt.get());
            return "admin/product/update";
        }

        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(
        @ModelAttribute("newProduct") @Valid Product product,
        BindingResult newProductBindingResult,
        @RequestParam("hoidanitFile") MultipartFile file) {
    if (newProductBindingResult.hasErrors()) {
        return "admin/product/update";
    }
    Optional<Product> currentProductOpt = this.productService.fetchProductById(product.getId());

    if (currentProductOpt.isEmpty()) {
        return "redirect:/admin/product";
    }
    Product currentProduct = currentProductOpt.get();
    if (!file.isEmpty()) {
        String img = this.uploadService.handleSaveUploadFile(file, "product");
        currentProduct.setImage(img);
    }
    currentProduct.setName(product.getName());
    currentProduct.setPrice(product.getPrice());
    currentProduct.setDetailDesc(product.getDetailDesc());
    currentProduct.setShortDesc(product.getShortDesc());
    currentProduct.setFactory(product.getFactory());
    currentProduct.setTarget(product.getTarget());

    this.productService.saveProduct(currentProduct);

    return "redirect:/admin/product";
    }
}

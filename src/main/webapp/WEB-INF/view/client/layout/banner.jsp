<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <!-- Hero Start -->
            <style>
                .carousel-control-prev-icon {
                    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='white' viewBox='0 0 16 16'%3e%3cpath d='M11 1L3 8l8 7'/%3e%3c/svg%3e") !important;
                }
                
                .carousel-control-next-icon {
                    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='white' viewBox='0 0 16 16'%3e%3cpath d='M5 1l8 7-8 7'/%3e%3c/svg%3e") !important;
                }
                
                .blurred-carousel-icon {
                    background-color: rgba(40, 192, 77, 0.7);
                    border-radius: 50%;
                    padding: 22px;
                    backdrop-filter: blur(5px);
                    -webkit-backdrop-filter: blur(5px);
                }
                
                .blurred-carousel-icon:hover {
                    background-color: rgba(40, 192, 77, 0.9);
                }
            </style>

            <div class="container-fluid py-5 mb-5 hero-header" style="background-image: linear-gradient(rgb(255, 255, 255,0.5), rgba(255, 255, 255, 0.5)),
                          url('/client/img/farytail.png');background-size:cover;background-position:left center;">
                <div class="container py-5">
                    <div class="row g-5 align-items-center">

                        <div class="col-lg-7">
                            <h4 class="mb-3" style="color:#ffa900;font-weight:600;">100% Sản Phẩm Chính Hãng</h4>
                            <h1 class="mb-5" style="color:#34c759;font-weight:900;font-size:58px;line-height:1.1;">
                                Hàng cao cấp<br>Rẻ vô địch
                            </h1>
                        </div>

                        <div class="col-lg-5">
                            <div id="heroSlide" class="carousel slide position-relative" data-bs-ride="carousel">
                                <div class="carousel-inner">

                                    <div class="carousel-item active">
                                        <img src="/client/img/laptop.png" class="d-block w-100 rounded" alt="">
                                        <a class="btn text-white px-4 py-2 hero-button">Laptop</a> </div>

                                    <div class="carousel-item">
                                        <img src="/client/img/phukien.png" class="d-block w-100 rounded" alt="">
                                        <a class="btn text-white px-4 py-2 hero-button">Phụ kiện</a> </div>
                                    <div class="carousel-item">
                                        <img src="/client/img/gm.png" class="d-block w-100 rounded" alt="">
                                        <a class="btn text-white px-4 py-2 hero-button">Gamming</a> </div>

                                </div>

                                <button class="carousel-control-prev" type="button" data-bs-target="#heroSlide" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon blurred-carousel-icon"
                              aria-hidden="true"></span>
                    </button>

                                <button class="carousel-control-next" type="button" data-bs-target="#heroSlide" data-bs-slide="next">
                        <span class="carousel-control-next-icon blurred-carousel-icon"
                              aria-hidden="true"></span>
                    </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Hero End -->
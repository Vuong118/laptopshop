<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />

                <title>Create Product</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const imageFile = $("#imageFile");
                        imageFile.change(function(e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({
                                "display": "block"
                            });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">

                                <h1 class="mt-4">Create a Product</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin/product">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>

                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-product-plus me-1"></i> Create a Product
                                    </div>
                                    <div class="card-body">

                                        <form:form method="post" action="/admin/product/create" modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                            <c:set var="quantityError">
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="nameError">
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="priceError">
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="detailDescError">
                                                <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                            </c:set>
                                            <c:set var="shortDescError">
                                                <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                            </c:set>
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Name</label>
                                                <form:input type="text" class="form-control ${not empty nameError? 'is-invalid':''}" path="name" /> ${nameError}
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Price</label>
                                                <form:input type="number" class="form-control ${not empty priceError? 'is-invalid':''}" path="price" /> ${priceError}
                                            </div>

                                            <div class="col-12">

                                                <label class="form-label">DetailDESC</label>
                                                <form:input type="textarea" class="form-control ${not empty detailDescError? 'is-invalid':''}" path="detailDesc" /> ${detailDescError}
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">ShortDESC</label>
                                                <form:input type="text" class="form-control ${not empty shortDescError? 'is-invalid':''}" path="shortDesc" /> ${shortDescError}
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Quantity</label>
                                                <form:input type="number" class="form-control ${not empty quantityError? 'is-invalid':''}" path="quantity" /> ${quantityError}
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Factory</label>
                                                <form:select class="form-select" name="factory" path="factory">
                                                    <form:option value="APPLE">APPLE</form:option>
                                                    <form:option value="ASUS">ASUS</form:option>
                                                    <form:option value="ACER">ACER</form:option>
                                                    <form:option value="Lenovo">Lenovo</form:option>
                                                    <form:option value="DELL">DELL</form:option>
                                                    <form:option value="MSI">MSI</form:option>
                                                    <form:option value="HP">HP</form:option>
                                                    <form:option value="Microsoft">Microsoft</form:option>
                                                    <form:option value="Samsung">Samsung</form:option>
                                                </form:select>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <label class="form-label">Target</label>
                                                <form:select class="form-select" name="target" path="target">
                                                    <form:option value="GAMING">Gamming</form:option>
                                                    <form:option value="VAN-PHONG">Văn Phòng</form:option>
                                                    <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                                    <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                    <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                </form:select>
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="imageFile" class="form-label">Image</label>
                                                <input class="form-control" type="file" id="imageFile" name="hoidanitFile" accept=".png, .jpg,.jpeg" />
                                            </div>

                                            <div class="col-12 mb-3">
                                                <img style="max-height:250px; display: none;" alt="image preview" id="imagePreview">
                                            </div>

                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary">Create</button>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

                <script>
                    const imageFileInput = document.getElementById('imageFile');
                    const imagePreview = document.getElementById('imagePreview');

                    if (imageFileInput) {
                        imageFileInput.onchange = evt => {
                            const [file] = imageFileInput.files;
                            if (file) {
                                imagePreview.src = URL.createObjectURL(file);
                                imagePreview.style.display = 'block';
                            } else {
                                imagePreview.style.display = 'none';
                            }
                        }
                    }
                </script>
            </body>

            </html>
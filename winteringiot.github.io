<!DOCTYPE html>
<html lang="es">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Implementacion de Internet de las cosas en invernadero">
  <meta name="keywords" content="IoT, invernadero, agricultura, produccion, internet of things, esp32">

  <title>WinteringIoT {{mode}}</title>

  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Main CSS & fonts -->
  <link rel="stylesheet" href="/static/style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@400;500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,700;1,800&family=Tajawal:wght@200;300;400;500;700;800;900&display=swap" rel="stylesheet">

</head>

<body id="body">
  <div id="contenido">
    <!-- BARRA DE NAVEGACION -->
    <nav class="navbar navbar-expand-md navbar-dark p-0 scrolling-active fixed-top shadow" style="background-color: rgba(22, 22, 22, 0.65); transition: background-color 0.5s">

      <div class="container-fluid">

        <a class="navbar-brand" href="/" id="logo"><span class="text-light nav-link fs-5 fw-bold">WinteringIoT</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">Comunidad</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Conócenos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Nuestros productos</a>
            </li>
          </ul>

          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">Ayuda</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">Iniciar Sesion</a>
            </li>
          </ul>
        </div>

      </div>

    </nav>

    <!-- ESLOGAN & START -->
    <header class="container-fluid px-2 text-light" id="eslogan_start">
      <div class="container-fluid d-flex justify-content-center text-center">
        <div class="col">
          <div class="row">
            <h1 class="display-4 pt-0">IoT y Producción Agrícola</h1>
          </div>
          <div class="row">
            <p class="fs-4 p-5 px-5">Automatice su sistema de cultivo bajo invernadero,
              monitorizando y controlando parámetros adecuados para la producción en ambientes
              microclimatizados de cultivo de frutas, flores y hortalizas.</p>
          </div>
        </div>
      </div>
      <div class="container-fluid d-flex justify-content-center">
        <a class="btn btn-outline-light px-4" href="#" role="button" id="start" data-bs-toggle="modal" data-bs-target="#exampleModalToggle2">Empieze ahora</a>
      </div>
    </header>

      <!-- INICIAR SESION -->
    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
      <div class="modal-dialog modal-sm">
        <div class="modal-content" style="border-radius: 10px; padding: 40px;">
            <h4 class="text-center">Iniciar sesión<a href="#" class="close" data-bs-dismiss="modal"></a></h4>
            <div class="form-text text-center">¿Aún no tienes cuenta? <a href="#" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">Entra aquí</a></div><br>
            <form action="/login" method="POST" class="needs-validation" novalidate>
              <div class="mb-3">
                <label for="user" class="form-label">Correo electrónico</label>
                <input id="user" name="user" type="email" class="form-control" pattern="[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+" maxlength="255" required>
                <div class="invalid-feedback">Ingresa un correo válido</div>
              </div>
              <div class="mb-3">
                <label for="password_user" class="form-label">Contraseña</label>
                <input id="password_user" name="password_user" type="password" class="form-control" pattern=".{8,16}" maxlength="16" required>
                <div class="invalid-feedback">Ingresa una contraseña válida</div>
                <div class="form-text">¿Olvidaste tu contraseña?</div>
              </div>
              <div class="d-flex justify-content-center">
                <button name="login" type="submit" class="btn btn-primary px-5">Entrar</button>
              </div>
            </form>
        </div>
    </div>
    <!-- REGISTRO -->
    </div>
    <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
      <div class="modal-dialog modal-md">
        <div class="modal-content" style="border-radius: 10px; padding: 40px;">
          <h4 class="text-center">Crea una cuenta nueva<a href="#" class="close" data-bs-dismiss="modal"></a></h4>
          <div class="form-text pb-2">Ingresa la siguiente información para registrarte:</div>
          <form action="/register" method="POST" class="needs-validation" id="form_register" onsubmit="verificarPasswords()" novalidate>
            <div class="row">
              <div class="col">
                <div class="mb-3">
                  <label for="name" class="form-label">Nombre</label>
                  <input id="name" name="name" type="text" class="form-control" pattern="[a-zA-ZÀ-ÿ]+" maxlength="32" required>
                  <div class="invalid-feedback">Nombre invalido</div>
                </div>
              </div>
              <div class="col">
                <div class="mb-3">
                  <label for="lastname" class="form-label">Apellido</label>
                  <input id="lastname" name="lastname" type="text" class="form-control" pattern="[a-zA-ZÀ-ÿ]+" maxlength="32" required>
                  <div class="invalid-feedback">Apellido invalido</div>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Correo electrónico</label>
              <input id="email" name="email"  type="email" class="form-control" pattern="[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+" maxlength="255" required>
              <div class="invalid-feedback">Correo electrónico inválido</div>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Contraseña (8-16 caracteres)</label>
              <input id="password" name="password" type="password" class="form-control" pattern=".{8,16}" maxlength="16" required>
            </div>
            <div class="mb-3">
              <!-- <label for="password_con" class="form-label">Confirmar contraseña</label> -->
              <!-- <input id="password_con" name="password_con" type="password" class="form-control" pattern=".{8,16}" maxlength="16" required> -->
            </div>
      
            <div class="mb-3 form-check">
              <input id="invalidCheck" type="checkbox" class="form-check-input" required>
              <label class="form-check-label" for="invalidCheck">Acepto los términos y condiciones</label>
              <div class="invalid-feedback"></div>
            </div>
      
            <div class="d-flex justify-content-center">
              <button id="register" type="submit" class="btn btn-primary px-5">Regístrate</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <footer>
        <div class="row justify-content-center mx-0 py-5" style="background-color: rgb(0, 0, 0);">
            <div class="col-11">
                <div class="row ">
                    <div class="col-xl-8 col-md-4 col-sm-4 col-12 my-auto mx-auto a">
                        <h3 class="text-muted mb-md-0 mb-5 bold-text">WinteringIoT</h3>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                        <h6 class="mb-3 mb-lg-4 text-muted bold-text "><b>Menu</b></h6>
                        <ul class="list-unstyled">
                            <li>Inicio</li>
                            <li>Comunidad</li>
                            <li>Contactanos</li>
                            <li>Nuestros productos</li>
                        </ul>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-4 col-12">
                        <h6 class="mb-3 mb-lg-4 text-muted bold-text mt-sm-0 mt-5"><b>Dirección</b></h6>
                        <p class="mb-1">Calle 127 #5-09</p>
                        <p>Bello horizonte</p>
                        <p>Santa Marta, Colombia</p>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-xl-8 col-md-4 col-sm-4 col-auto my-md-0 mt-5 order-sm-1 order-3 align-self-end">
                        <p class="social text-muted mb-0 pb-4 bold-text"> <span class="mx-2"><i class="fa fa-facebook" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-youtube-play" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-twitter" aria-hidden="true"></i></span> <span class="mx-2"><i class="fa fa-instagram" aria-hidden="true"></i></span> </p><small class="rights"><span>&#174;</span> WinteringIoT All Rights Reserved.</small>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-4 col-auto order-1 align-self-end ">
                        <h6 class="mt-55 mt-2 text-muted bold-text"><b>Contactos</b></h6><small> <span><i class="fa fa-envelope" aria-hidden="true"></i></span>jonatanfernand@gmail.com</small>
                    </div>
                    <div class="col-xl-2 col-md-4 col-sm-4 col-auto order-2 align-self-end mt-3 ">
                        <h6 class="text-muted bold-text"><b></b></h6><small><span><i class="fa fa-envelope" aria-hidden="true"></i></span>dafran17@gmail.com</small>
                    </div>
                </div>
            </div>
        </div>
    </footer>
  </div>
</body>

  <!-- Option 1: Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>

  <script src="/static/scripts.js"></script>

</html>

<!-- <p class="text-dark mb-0 p-1"> -->
<!-- Contactanos <a href="https://wa.me/+573013240891" class="text-decoration-none"><span class="text-dark mb-0 p-1 ">+57-(301)-324-0891</span></a> -->
<!-- </p> -->
<!-- #8FCB01;" id="font1"-->
<!-- style="background-color: #013F3E; -->

<!-- /////////////// ESLOGAN & COMIENZA AHORA //////////////// -->
<!-- <video class="video" src="clip.mp4" autoplay muted loop width="100%"></video> -->
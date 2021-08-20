window.addEventListener('scroll', function(){
    let navbar = document.querySelector('nav');
    let windowPosition = window.scrollY < 490;
    navbar.classList.toggle('scrolling-active', windowPosition);
})

// function toggle(){
//     var blur = document.getElementById('contenido');
//     blur.classList.toggle('blur-active');
//     var popuplogin = document.getElementById('popup-login');
//     popuplogin.classList.toggle('blur-active');
// }

// function signin(){
//     var popuplogin = document.getElementById('popup-login');
//     popuplogin.classList.toggle('blur-active');
//     var popupsignin = document.getElementById('popup-signin');
//     popupsignin.classList.toggle('blur-active');
// }

// function cerrar(){
//     var blur = document.getElementById('contenido');
//     blur.classList.toggle('blur-active');
//     var popupsignin = document.getElementById('popup-signin');
//     popupsignin.classList.toggle('blur-active');
// }

// function start(){
//     var blur = document.getElementById('contenido');
//     blur.classList.toggle('blur-active');
//     var popupsignin = document.getElementById('popup-signin');
//     popupsignin.classList.toggle('blur-active');
// }

//////////////////////////////////////////

// function verificarPasswords() {
//   var pass1 = document.getElementById('password');
//   var pass2 = document.getElementById('password_con');
//   if (pass1.value === "" || pass2.value === "") {
//     console.log("Rellene los campos");
//     pass1.classList.remove("is-valid");
//     pass2.classList.remove("is-valid");
//     pass1.classList.add("is-invalid");
//     pass2.classList.add("is-invalid");
//   }else if (pass1.value !== pass2.value) {
//     console.log("Las contraseñas no coinciden");
//     pass1.classList.remove("is-valid");
//     pass2.classList.remove("is-valid");
//     pass1.classList.add("is-invalid");
//     pass2.classList.add("is-invalid");
//   }else if (pass1.value.length < 8 || pass2.value.length < 8){
//     console.log("La contraseña debe tener entre 8 a 16 caracteres");
//     pass1.classList.remove("is-valid");
//     pass2.classList.remove("is-valid");
//     pass1.classList.add("is-invalid");
//     pass2.classList.add("is-invalid");
//   }else{
//     console.log("ok");
//     pass1.classList.remove("is-invalid");
//     pass2.classList.remove("is-invalid");
//     pass1.classList.add("is-valid");
//     pass2.classList.add("is-valid");
//   }
// }

// FETCH API ///////////////////////////////////////////


// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
          form.addEventListener('keypress', () =>{
            form.classList.remove('was-validated')
          })
        }

        form.classList.add('was-validated')
      }, false)
    })
})()

console.log("hola mundo")
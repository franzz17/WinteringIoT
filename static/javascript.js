window.addEventListener('scroll', function(){
    let navbar = document.querySelector('nav');
    let windowPosition = window.scrollY < 490;
    navbar.classList.toggle('scrolling-active', windowPosition);
})

function toggle(){
    var blur = document.getElementById('contenido');
    blur.classList.toggle('blur-active');
    var popuplogin = document.getElementById('popup-login');
    popuplogin.classList.toggle('blur-active');
}

function signin(){
    var popuplogin = document.getElementById('popup-login');
    popuplogin.classList.toggle('blur-active');
    var popupsignin = document.getElementById('popup-signin');
    popupsignin.classList.toggle('blur-active');
}

function cerrar(){
    var blur = document.getElementById('contenido');
    blur.classList.toggle('blur-active');
    var popupsignin = document.getElementById('popup-signin');
    popupsignin.classList.toggle('blur-active');
}
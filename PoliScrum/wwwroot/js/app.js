function validarCredenciales() {
    var formElement = document.getElementById("login");
    var request = new XMLHttpRequest();

    // Define what happens on successful data submission
    request.addEventListener('load', function (event) {
        if (request.status == 200) {
            mostrarMensaje("Sesión iniciada");
        } else {
            mostrarMensaje("Credenciales inválidas");
        }
    });

    // Define what happens in case of error
    request.addEventListener('error', function (event) {
        alert('Oops! Hubo un error inesperado');
    });

    // request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    request.open("POST", "https://localhost:5001/poliscrum/api/auth/token");
    request.send(new FormData(formElement));
}

function mostrarMensaje(respuesta) {
    document.getElementById("respuesta").innerText = respuesta;
    document.getElementById("mensaje").style.display = "block";
}

function ocultarMensaje() {
    document.getElementById("respuesta").innerText = "";
    document.getElementById("mensaje").style.display = "none";
}
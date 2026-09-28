<?php
// Configuración de cabeceras para responder en texto plano
header('Content-Type: text/plain');

// Definir las claves válidas y el código Lua a entregar
$claves_validas = array("MiClave123", "Nogais", "VIP_User");

// Obtener parámetros enviados por el script de GameGuardian
$action = isset($_POST['action']) ? $_POST['action'] : '';
$key    = isset($_POST['key']) ? $_POST['key'] : '';

// Comprobar la acción y validar la clave
if ($action === 'check' && in_array($key, $claves_validas)) {
    
    // AQUÍ PONES EL CÓDIGO FUENTE LUA REAL QUE QUIERES PROTEGER Y EJECUTAR
    echo '
        gg.alert("¡Conexión exitosa al servidor!");
        
        local menu = gg.choice({"Opción 1: Velocidad", "Opción 2: Salto", "Salir"}, nil, "Menú Remoto VIP")
        if menu == 1 then
            gg.toast("Función 1 activada")
        elseif menu == 2 then
            gg.toast("Función 2 activada")
        end
    ';

} else {
    // Si la clave no coincide o no existe
    echo "invalidUserError";
}
?>

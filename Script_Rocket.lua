-- Guardar directamente en el archivo Script_Rocket.lua dentro de GitHub

gg.alert("¡Conexión exitosa a GitHub!")

local menu = gg.choice({"Opción 1: Velocidad", "Opción 2: Salto", "Salir"}, nil, "Menú Remoto VIP")
if menu == 1 then
    gg.toast("Función 1 activada")
elseif menu == 2 then
    gg.toast("Función 2 activada")
end

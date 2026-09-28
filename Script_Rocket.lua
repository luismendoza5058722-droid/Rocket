-- Este código va dentro de tu archivo Script_Rocket.lua en GitHub

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        
        local menu = gg.choice({
            "Opción 1: Velocidad",
            "Opción 2: Salto",
            "❌ Salir"
        }, nil, "Menú Remoto VIP")

        if menu == 1 then
            -- Aquí pones tus trucos/funciones de GameGuardian
            gg.toast("Función 1 activada")

        elseif menu == 2 then
            -- Aquí pones tus trucos/funciones de GameGuardian
            gg.toast("Función 2 activada")

        elseif menu == 3 then
            -- Único método para cerrar el script por completo
            gg.toast("Saliendo...")
            os.exit()
        end
        -- Si presiona Cancelar (menu == nil), el menú se oculta y el bucle sigue activo
    end
    gg.sleep(100)
end

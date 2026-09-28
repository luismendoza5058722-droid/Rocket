local url = "https://raw.githubusercontent.com/luismendoza5058722-droid/Rocket/refs/heads/main/Script_Rocket.lua"

local response = gg.makeRequest(url)

if response and response.content then
    local func, err = load(response.content)
    if func then
        -- Cargar el contenido descargado
        func()
    else
        gg.alert("Error de compilación en el servidor.")
        os.exit()
    end
else
    gg.alert("No se obtuvo respuesta del servidor.")
    os.exit()
end

-- Bucle principal para mantener el script activo con GameGuardian
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        
        -- Menú principal
        local menu = gg.choice({
            "Opción 1: Ejemplo 1",
            "Opción 2: Ejemplo 2",
            "❌ Salir"
        }, nil, "Menú Principal")

        if menu == 1 then
            -- Coloca aquí tu función 1
            gg.toast("Opción 1 ejecutada")
            
        elseif menu == 2 then
            -- Coloca aquí tu función 2
            gg.toast("Opción 2 ejecutada")
            
        elseif menu == 3 then
            -- Único punto de salida definitivo
            gg.toast("Saliendo...")
            os.exit()
        end
        -- Si presiona Cancelar (menu == nil), simplemente no hace nada y vuelve a esperar
    end
    gg.sleep(100)
end

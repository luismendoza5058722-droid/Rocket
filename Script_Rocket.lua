local urlUsuarios = "https://raw.githubusercontent.com/luismendoza5058722-droid/Rocket/refs/heads/main/usuarios.json"
local pathData    = gg.EXT_STORAGE .. "/datos_login.txt"

local user, pass = "", ""

-- 1. Intentar leer credenciales desde el almacenamiento local
local file = io.open(pathData, "r")
if file then
    user = file:read("*line") or ""
    pass = file:read("*line") or ""
    file:close()
end

-- 2. Si no hay datos, desplegar el formulario de entrada
if user == "" or pass == "" then
    local input = gg.prompt(
        {"Usuario:", "Contraseña:"},
        {[1] = "", [2] = ""},
        {[1] = "text", [2] = "text"}
    )
    
    if not input or input[1] == "" or input[2] == "" then
        gg.alert("Debes ingresar credenciales válidas.")
        os.exit()
    end
    
    user = input[1]
    pass = input[2]
end

-- 3. Descargar y comprobar contra la lista de usuarios en GitHub
local resUsers = gg.makeRequest(urlUsuarios)

if resUsers and resUsers.content then
    local searchPattern = '"' .. user .. '"%s*:%s*"' .. pass .. '"'
    
    if string.find(resUsers.content, searchPattern) then
        -- Guardar credenciales si la verificación es exitosa
        local saveFile = io.open(pathData, "w")
        if saveFile then
            saveFile:write(user .. "\n" .. pass)
            saveFile:close()
        end
    else
        gg.alert("Error: Credenciales incorrectas o revocadas.")
        os.remove(pathData)
        os.exit()
    end
else
    gg.alert("Error al conectar con el servidor de licencias.")
    os.exit()
end

-- 4. Bucle principal del menú (Se ejecuta únicamente si pasa la validación)
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        
        local menu = gg.choice({
            "Opción 1: Velocidad",
            "Opción 2: Salto",
            "❌ Salir"
        }, nil, "Menú VIP Remoto")

        if menu == 1 then
            gg.toast("Función 1 activada")
        elseif menu == 2 then
            gg.toast("Función 2 activada")
        elseif menu == 3 then
            gg.toast("Saliendo...")
            os.exit()
        end
    end
    gg.sleep(100)
end

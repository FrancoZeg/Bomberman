function love.load()

    -- Configuración música
    backgroundMusic = love.audio.newSource("archivos/musica.mp3", "stream")
    backgroundMusic:setLooping(true)
    backgroundMusic:play()

    --Configuración sprites
    muro_indestructible = love.graphics.newImage('archivos/muro_indestructible.png')
    muro_destructible = love.graphics.newImage('archivos/muro_destructible.png')

    --Configuración efectos 
    sonidobomba = love.audio.newSource("archivos/explotar.ogg", "static")
    time = 0
    tiempoSonido = 2

    -- Configuración de la ventana
    love.window.setMode(840, 680, {
        resizable = true,
        vsync = true
    })

    -- Inicialización del personaje
    personaje = {
        x = 0,  
        y = 0,
        ancho = 30,
        alto = 30,
        velocidad = 200
    }

    -- Inicialización de las bombas
    bombas = {}
    explosiones = {}
    tiempoBomba = 2  -- La bomba explota después de 2 segundos
    tiempoExplosion = 0.5  -- La explosión dura 0.5 segundos
    rangoExplosion = 40  -- Rango de la explosión

    -- Inicialización de los muros
    muros = {
        -- Cada muro tiene: x, y, ancho, alto
        --{x = 40, y = 0, ancho = 40, alto = 40}, 
        {x = 80, y = 0, ancho = 40, alto = 40}, 
        {x = 120, y = 0, ancho = 40, alto = 40},
        {x = 160, y = 0, ancho = 40, alto = 40},
        {x = 200, y = 0, ancho = 40, alto = 40},
        {x = 240, y = 0, ancho = 40, alto = 40},
        {x = 280, y = 0, ancho = 40, alto = 40},
        {x = 320, y = 0, ancho = 40, alto = 40},
        {x = 360, y = 0, ancho = 40, alto = 40},
        {x = 400, y = 0, ancho = 40, alto = 40},
        {x = 440, y = 0, ancho = 40, alto = 40},
        {x = 480, y = 0, ancho = 40, alto = 40},
        {x = 520, y = 0, ancho = 40, alto = 40},
        {x = 560, y = 0, ancho = 40, alto = 40},
        {x = 600, y = 0, ancho = 40, alto = 40},
        {x = 640, y = 0, ancho = 40, alto = 40},
        {x = 680, y = 0, ancho = 40, alto = 40},
        {x = 720, y = 0, ancho = 40, alto = 40},
        {x = 760, y = 0, ancho = 40, alto = 40},
        {x = 800, y = 0, ancho = 40, alto = 40},

        {x = 40, y = 40, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 40, ancho = 40, alto = 40}, 
        {x = 120, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 40, ancho = 40, alto = 40},
        {x = 200, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 40, ancho = 40, alto = 40},
        {x = 280, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 40, ancho = 40, alto = 40},
        {x = 360, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 40, ancho = 40, alto = 40},
        {x = 440, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 40, ancho = 40, alto = 40},
        {x = 520, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 40, ancho = 40, alto = 40},
        {x = 600, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 40, ancho = 40, alto = 40},
        {x = 680, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 40, ancho = 40, alto = 40},
        {x = 760, y = 40, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 40, ancho = 40, alto = 40},

        {x = 0, y = 80, ancho = 40, alto = 40},
        {x = 40, y = 80, ancho = 40, alto = 40}, 
        {x = 80, y = 80, ancho = 40, alto = 40}, 
        {x = 120, y = 80, ancho = 40, alto = 40},
        {x = 160, y = 80, ancho = 40, alto = 40},
        {x = 200, y = 80, ancho = 40, alto = 40},
        {x = 240, y = 80, ancho = 40, alto = 40},
        {x = 280, y = 80, ancho = 40, alto = 40},
        {x = 320, y = 80, ancho = 40, alto = 40},
        {x = 360, y = 80, ancho = 40, alto = 40},
        {x = 400, y = 80, ancho = 40, alto = 40},
        {x = 440, y = 80, ancho = 40, alto = 40},
        {x = 480, y = 80, ancho = 40, alto = 40},
        {x = 520, y = 80, ancho = 40, alto = 40},
        {x = 560, y = 80, ancho = 40, alto = 40},
        {x = 600, y = 80, ancho = 40, alto = 40},
        {x = 640, y = 80, ancho = 40, alto = 40},
        {x = 680, y = 80, ancho = 40, alto = 40},
        {x = 720, y = 80, ancho = 40, alto = 40},
        {x = 760, y = 80, ancho = 40, alto = 40},
        {x = 800, y = 80, ancho = 40, alto = 40},

        {x = 0, y = 120, ancho = 40, alto = 40},
        {x = 40, y = 120, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 120, ancho = 40, alto = 40}, 
        {x = 120, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 120, ancho = 40, alto = 40},
        {x = 200, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 120, ancho = 40, alto = 40},
        {x = 280, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 120, ancho = 40, alto = 40},
        {x = 360, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 120, ancho = 40, alto = 40},
        {x = 440, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 120, ancho = 40, alto = 40},
        {x = 520, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 120, ancho = 40, alto = 40},
        {x = 600, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 120, ancho = 40, alto = 40},
        {x = 680, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 120, ancho = 40, alto = 40},
        {x = 760, y = 120, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 120, ancho = 40, alto = 40},

        {x = 0, y = 160, ancho = 40, alto = 40}, 
        {x = 40, y = 160, ancho = 40, alto = 40}, 
        {x = 80, y = 160, ancho = 40, alto = 40}, 
        {x = 120, y = 160, ancho = 40, alto = 40},
        {x = 160, y = 160, ancho = 40, alto = 40},
        {x = 200, y = 160, ancho = 40, alto = 40},
        {x = 240, y = 160, ancho = 40, alto = 40},
        {x = 280, y = 160, ancho = 40, alto = 40},
        {x = 320, y = 160, ancho = 40, alto = 40},
        {x = 360, y = 160, ancho = 40, alto = 40},
        {x = 400, y = 160, ancho = 40, alto = 40},
        {x = 440, y = 160, ancho = 40, alto = 40},
        {x = 480, y = 160, ancho = 40, alto = 40},
        {x = 520, y = 160, ancho = 40, alto = 40},
        {x = 560, y = 160, ancho = 40, alto = 40},
        {x = 600, y = 160, ancho = 40, alto = 40},
        {x = 640, y = 160, ancho = 40, alto = 40},
        {x = 680, y = 160, ancho = 40, alto = 40},
        {x = 720, y = 160, ancho = 40, alto = 40},
        {x = 760, y = 160, ancho = 40, alto = 40},
        {x = 800, y = 160, ancho = 40, alto = 40},
        
        {x = 0, y = 200, ancho = 40, alto = 40}, 
        {x = 40, y = 200, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 200, ancho = 40, alto = 40}, 
        {x = 120, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 200, ancho = 40, alto = 40},
        {x = 200, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 200, ancho = 40, alto = 40},
        {x = 280, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 200, ancho = 40, alto = 40},
        {x = 360, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 200, ancho = 40, alto = 40},
        {x = 440, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 200, ancho = 40, alto = 40},
        {x = 520, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 200, ancho = 40, alto = 40},
        {x = 600, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 200, ancho = 40, alto = 40},
        {x = 680, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 200, ancho = 40, alto = 40},
        {x = 760, y = 200, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 200, ancho = 40, alto = 40},
        
        {x = 0, y = 240, ancho = 40, alto = 40}, 
        {x = 40, y = 240, ancho = 40, alto = 40}, 
        {x = 80, y = 240, ancho = 40, alto = 40}, 
        {x = 120, y = 240, ancho = 40, alto = 40},
        {x = 160, y = 240, ancho = 40, alto = 40},
        {x = 200, y = 240, ancho = 40, alto = 40},
        {x = 240, y = 240, ancho = 40, alto = 40},
        {x = 280, y = 240, ancho = 40, alto = 40},
        {x = 320, y = 240, ancho = 40, alto = 40},
        {x = 360, y = 240, ancho = 40, alto = 40},
        {x = 400, y = 240, ancho = 40, alto = 40},
        {x = 440, y = 240, ancho = 40, alto = 40},
        {x = 480, y = 240, ancho = 40, alto = 40},
        {x = 520, y = 240, ancho = 40, alto = 40},
        {x = 560, y = 240, ancho = 40, alto = 40},
        {x = 600, y = 240, ancho = 40, alto = 40},
        {x = 640, y = 240, ancho = 40, alto = 40},
        {x = 680, y = 240, ancho = 40, alto = 40},
        {x = 720, y = 240, ancho = 40, alto = 40},
        {x = 760, y = 240, ancho = 40, alto = 40},
        {x = 800, y = 240, ancho = 40, alto = 40},
        
        {x = 0, y = 280, ancho = 40, alto = 40}, 
        {x = 40, y = 280, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 280, ancho = 40, alto = 40}, 
        {x = 120, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 280, ancho = 40, alto = 40},
        {x = 200, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 280, ancho = 40, alto = 40},
        {x = 280, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 280, ancho = 40, alto = 40},
        {x = 360, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 280, ancho = 40, alto = 40},
        {x = 440, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 280, ancho = 40, alto = 40},
        {x = 520, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 280, ancho = 40, alto = 40},
        {x = 600, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 280, ancho = 40, alto = 40},
        {x = 680, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 280, ancho = 40, alto = 40},
        {x = 760, y = 280, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 280, ancho = 40, alto = 40},
        
        {x = 0, y = 320, ancho = 40, alto = 40}, 
        {x = 40, y = 320, ancho = 40, alto = 40}, 
        {x = 80, y = 320, ancho = 40, alto = 40}, 
        {x = 120, y = 320, ancho = 40, alto = 40},
        {x = 160, y = 320, ancho = 40, alto = 40},
        {x = 200, y = 320, ancho = 40, alto = 40},
        {x = 240, y = 320, ancho = 40, alto = 40},
        {x = 280, y = 320, ancho = 40, alto = 40},
        {x = 320, y = 320, ancho = 40, alto = 40},
        {x = 360, y = 320, ancho = 40, alto = 40},
        {x = 400, y = 320, ancho = 40, alto = 40},
        {x = 440, y = 320, ancho = 40, alto = 40},
        {x = 480, y = 320, ancho = 40, alto = 40},
        {x = 520, y = 320, ancho = 40, alto = 40},
        {x = 560, y = 320, ancho = 40, alto = 40},
        {x = 600, y = 320, ancho = 40, alto = 40},
        {x = 640, y = 320, ancho = 40, alto = 40},
        {x = 680, y = 320, ancho = 40, alto = 40},
        {x = 720, y = 320, ancho = 40, alto = 40},
        {x = 760, y = 320, ancho = 40, alto = 40},
        {x = 800, y = 320, ancho = 40, alto = 40},
        
        {x = 0, y = 360, ancho = 40, alto = 40}, 
        {x = 40, y = 360, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 360, ancho = 40, alto = 40}, 
        {x = 120, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 360, ancho = 40, alto = 40},
        {x = 200, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 360, ancho = 40, alto = 40},
        {x = 280, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 360, ancho = 40, alto = 40},
        {x = 360, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 360, ancho = 40, alto = 40},
        {x = 440, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 360, ancho = 40, alto = 40},
        {x = 520, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 360, ancho = 40, alto = 40},
        {x = 600, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 360, ancho = 40, alto = 40},
        {x = 680, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 360, ancho = 40, alto = 40},
        {x = 760, y = 360, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 360, ancho = 40, alto = 40},
        
        {x = 0, y = 400, ancho = 40, alto = 40}, 
        {x = 40, y = 400, ancho = 40, alto = 40}, 
        {x = 80, y = 400, ancho = 40, alto = 40}, 
        {x = 120, y = 400, ancho = 40, alto = 40},
        {x = 160, y = 400, ancho = 40, alto = 40},
        {x = 200, y = 400, ancho = 40, alto = 40},
        {x = 240, y = 400, ancho = 40, alto = 40},
        {x = 280, y = 400, ancho = 40, alto = 40},
        {x = 320, y = 400, ancho = 40, alto = 40},
        {x = 360, y = 400, ancho = 40, alto = 40},
        {x = 400, y = 400, ancho = 40, alto = 40},
        {x = 440, y = 400, ancho = 40, alto = 40},
        {x = 480, y = 400, ancho = 40, alto = 40},
        {x = 520, y = 400, ancho = 40, alto = 40},
        {x = 560, y = 400, ancho = 40, alto = 40},
        {x = 600, y = 400, ancho = 40, alto = 40},
        {x = 640, y = 400, ancho = 40, alto = 40},
        {x = 680, y = 400, ancho = 40, alto = 40},
        {x = 720, y = 400, ancho = 40, alto = 40},
        {x = 760, y = 400, ancho = 40, alto = 40},
        {x = 800, y = 400, ancho = 40, alto = 40},
        
        {x = 0, y = 440, ancho = 40, alto = 40}, 
        {x = 40, y = 440, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 440, ancho = 40, alto = 40}, 
        {x = 120, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 440, ancho = 40, alto = 40},
        {x = 200, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 440, ancho = 40, alto = 40},
        {x = 280, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 440, ancho = 40, alto = 40},
        {x = 360, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 440, ancho = 40, alto = 40},
        {x = 440, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 440, ancho = 40, alto = 40},
        {x = 520, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 440, ancho = 40, alto = 40},
        {x = 600, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 440, ancho = 40, alto = 40},
        {x = 680, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 440, ancho = 40, alto = 40},
        {x = 760, y = 440, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 440, ancho = 40, alto = 40},
        
        {x = 0, y = 480, ancho = 40, alto = 40}, 
        {x = 40, y = 480, ancho = 40, alto = 40}, 
        {x = 80, y = 480, ancho = 40, alto = 40}, 
        {x = 120, y = 480, ancho = 40, alto = 40},
        {x = 160, y = 480, ancho = 40, alto = 40},
        {x = 200, y = 480, ancho = 40, alto = 40},
        {x = 240, y = 480, ancho = 40, alto = 40},
        {x = 280, y = 480, ancho = 40, alto = 40},
        {x = 320, y = 480, ancho = 40, alto = 40},
        {x = 360, y = 480, ancho = 40, alto = 40},
        {x = 400, y = 480, ancho = 40, alto = 40},
        {x = 440, y = 480, ancho = 40, alto = 40},
        {x = 480, y = 480, ancho = 40, alto = 40},
        {x = 520, y = 480, ancho = 40, alto = 40},
        {x = 560, y = 480, ancho = 40, alto = 40},
        {x = 600, y = 480, ancho = 40, alto = 40},
        {x = 640, y = 480, ancho = 40, alto = 40},
        {x = 680, y = 480, ancho = 40, alto = 40},
        {x = 720, y = 480, ancho = 40, alto = 40},
        {x = 760, y = 480, ancho = 40, alto = 40},
        {x = 800, y = 480, ancho = 40, alto = 40},
        
        {x = 0, y = 520, ancho = 40, alto = 40}, 
        {x = 40, y = 520, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 520, ancho = 40, alto = 40}, 
        {x = 120, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 520, ancho = 40, alto = 40},
        {x = 200, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 520, ancho = 40, alto = 40},
        {x = 280, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 520, ancho = 40, alto = 40},
        {x = 360, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 520, ancho = 40, alto = 40},
        {x = 440, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 520, ancho = 40, alto = 40},
        {x = 520, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 520, ancho = 40, alto = 40},
        {x = 600, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 520, ancho = 40, alto = 40},
        {x = 680, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 520, ancho = 40, alto = 40},
        {x = 760, y = 520, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 800, y = 520, ancho = 40, alto = 40},
        
        {x = 0, y = 560, ancho = 40, alto = 40}, 
        {x = 40, y = 560, ancho = 40, alto = 40}, 
        {x = 80, y = 560, ancho = 40, alto = 40}, 
        {x = 120, y = 560, ancho = 40, alto = 40},
        {x = 160, y = 560, ancho = 40, alto = 40},
        {x = 200, y = 560, ancho = 40, alto = 40},
        {x = 240, y = 560, ancho = 40, alto = 40},
        {x = 280, y = 560, ancho = 40, alto = 40},
        {x = 320, y = 560, ancho = 40, alto = 40},
        {x = 360, y = 560, ancho = 40, alto = 40},
        {x = 400, y = 560, ancho = 40, alto = 40},
        {x = 440, y = 560, ancho = 40, alto = 40},
        {x = 480, y = 560, ancho = 40, alto = 40},
        {x = 520, y = 560, ancho = 40, alto = 40},
        {x = 560, y = 560, ancho = 40, alto = 40},
        {x = 600, y = 560, ancho = 40, alto = 40},
        {x = 640, y = 560, ancho = 40, alto = 40},
        {x = 680, y = 560, ancho = 40, alto = 40},
        {x = 720, y = 560, ancho = 40, alto = 40},
        {x = 760, y = 560, ancho = 40, alto = 40},
        {x = 800, y = 560, ancho = 40, alto = 40},
        
        {x = 0, y = 600, ancho = 40, alto = 40}, 
        {x = 40, y = 600, ancho = 40, alto = 40, tipo = "indestructible"}, 
        {x = 80, y = 600, ancho = 40, alto = 40}, 
        {x = 120, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 160, y = 600, ancho = 40, alto = 40},
        {x = 200, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 240, y = 600, ancho = 40, alto = 40},
        {x = 280, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 320, y = 600, ancho = 40, alto = 40},
        {x = 360, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 400, y = 600, ancho = 40, alto = 40},
        {x = 440, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 480, y = 600, ancho = 40, alto = 40},
        {x = 520, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 560, y = 600, ancho = 40, alto = 40},
        {x = 600, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 640, y = 600, ancho = 40, alto = 40},
        {x = 680, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},
        {x = 720, y = 600, ancho = 40, alto = 40},
        {x = 760, y = 600, ancho = 40, alto = 40, tipo = "indestructible"},

        {x = 0, y = 640, ancho = 40, alto = 40},
        {x = 40, y = 640, ancho = 40, alto = 40},
        {x = 80, y = 640, ancho = 40, alto = 40},
        {x = 120, y = 640, ancho = 40, alto = 40},
        {x = 160, y = 640, ancho = 40, alto = 40},
        {x = 200, y = 640, ancho = 40, alto = 40},
        {x = 240, y = 640, ancho = 40, alto = 40},
        {x = 280, y = 640, ancho = 40, alto = 40},
        {x = 320, y = 640, ancho = 40, alto = 40},
        {x = 360, y = 640, ancho = 40, alto = 40},
        {x = 400, y = 640, ancho = 40, alto = 40},
        {x = 440, y = 640, ancho = 40, alto = 40},
        {x = 480, y = 640, ancho = 40, alto = 40},
        {x = 520, y = 640, ancho = 40, alto = 40},
        {x = 560, y = 640, ancho = 40, alto = 40},
        {x = 600, y = 640, ancho = 40, alto = 40},
        {x = 640, y = 640, ancho = 40, alto = 40},
        {x = 680, y = 640, ancho = 40, alto = 40},
        {x = 720, y = 640, ancho = 40, alto = 40},
    }
end

-- Función para detectar colisiones entre rectángulos
function checkCollision(a, b)
    return a.x < b.x + b.ancho and
           a.x + a.ancho > b.x and
           a.y < b.y + b.alto and
           a.y + a.alto > b.y
end

function love.update(dt)
    -- Guarda la posición anterior del personaje
    local lastX = personaje.x
    local lastY = personaje.y

    -- Movimiento con las flechas del teclado
    if love.keyboard.isDown('right') then
        personaje.x = personaje.x + (personaje.velocidad * dt)
    end
    if love.keyboard.isDown('left') then
        personaje.x = personaje.x - (personaje.velocidad * dt)
    end
    if love.keyboard.isDown('down') then
        personaje.y = personaje.y + (personaje.velocidad * dt)
    end
    if love.keyboard.isDown('up') then
        personaje.y = personaje.y - (personaje.velocidad * dt)
    end

    -- Mantener el personaje dentro de la ventana
    personaje.x = math.max(0, math.min(personaje.x, love.graphics.getWidth() - personaje.ancho))
    personaje.y = math.max(0, math.min(personaje.y, love.graphics.getHeight() - personaje.alto))

    -- Revisar colisiones con muros
    local colision = false
    for _, muro in ipairs(muros) do
        if checkCollision(personaje, muro) then
            colision = true
            break
        end
    end

    -- Revisar colisiones con bombas
    if not colision then
        for _, bomba in ipairs(bombas) do
            -- Actualizar el tiempo hasta que sea sólida
            bomba.tiempoSolido = bomba.tiempoSolido - dt
            
            -- Solo verificar colisión si la bomba ya es sólida
            if bomba.tiempoSolido <= 0 then
                local bombRect = {
                    x = bomba.x,
                    y = bomba.y,
                    ancho = 40,
                    alto = 40
                }
                if checkCollision(personaje, bombRect) then
                    colision = true
                    break
                end
            end
        end
    end
    
    -- Si hay colisión, regresar a la posición anterior
    if colision then
        personaje.x = lastX
        personaje.y = lastY
    end
    -- Actualizar bombas
    for i = #bombas, 1, -1 do
        bombas[i].tiempo = bombas[i].tiempo - dt
        if bombas[i].tiempo <= 0 then
            -- Crear explosión
            local exp = {
                x = bombas[i].x,
                y = bombas[i].y,
                tiempo = tiempoExplosion,
            }
            
            table.insert(explosiones, exp)
            -- Destruir muros en cruz
            local explosionX = bombas[i].x
            local explosionY = bombas[i].y
            for j = #muros, 1, -1 do
                local muro = muros[j]
                if muro.tipo ~= "indestructible" then  -- Solo destruir si no es indestructible
                    -- Verificar colisión en horizontal
                    if muro.y == explosionY and 
                       ((muro.x >= explosionX - rangoExplosion and muro.x <= explosionX) or
                        (muro.x <= explosionX + rangoExplosion and muro.x >= explosionX)) then
                        table.remove(muros, j)
                    -- Verificar colisión en vertical
                    elseif muro.x == explosionX and
                           ((muro.y >= explosionY - rangoExplosion and muro.y <= explosionY) or
                            (muro.y <= explosionY + rangoExplosion and muro.y >= explosionY)) then
                        table.remove(muros, j)
                    end
                end
            end
            table.remove(bombas, i)
        end
    end

    -- Actualizar explosiones
    for i = #explosiones, 1, -1 do
        explosiones[i].tiempo = explosiones[i].tiempo - dt
        if explosiones[i].tiempo <= 0 then
            table.remove(explosiones, i)
        end
    end
end

function love.keypressed(key)
    if key == 'z' then
        teclaPresionada = true
        time = 0
        local copiaSonido = sonidobomba:clone()
        local bombaX = math.floor(personaje.x / 40) * 40
        local bombaY = math.floor(personaje.y / 40) * 40
        local puedePoner = true
        copiaSonido:play()
        for _, bomba in ipairs(bombas) do
            if bomba.x == bombaX and bomba.y == bombaY then
                puedePoner = false
                break
            end
        end
        
        if puedePoner then
            table.insert(bombas, {
                x = bombaX,
                y = bombaY,
                tiempo = tiempoBomba,
                tiempoSolido = 0.5,  -- La bomba será sólida después de 1 segundo
            })
        end
    end
end

function love.draw()
    -- Dibuja el fondo
    love.graphics.setBackgroundColor(60/255, 123/255, 0/255)
    
    tipo_muro = muro_destructible

    -- Dibuja los muros
    for _, muro in ipairs(muros) do
        if muro.tipo == "indestructible" then
            tipo_muro = muro_indestructible
        else
            tipo_muro = muro_destructible
        end
        love.graphics.draw(tipo_muro, muro.x, muro.y)
    end

    -- Dibuja las bombas
    love.graphics.setColor(0, 0, 0)  -- Negro
    for _, bomba in ipairs(bombas) do
        love.graphics.rectangle('fill', bomba.x, bomba.y, 40, 40)
    end
    
    -- Dibuja las explosiones
    love.graphics.setColor(1, 0.5, 0)  -- Naranja
    for _, explosion in ipairs(explosiones) do
        -- Centro de la explosión
        love.graphics.rectangle('fill', explosion.x, explosion.y, 40, 40)
        -- Cruz de la explosión
        love.graphics.rectangle('fill', explosion.x - rangoExplosion, explosion.y, rangoExplosion, 40)
        love.graphics.rectangle('fill', explosion.x + 40, explosion.y, rangoExplosion, 40)
        love.graphics.rectangle('fill', explosion.x, explosion.y - rangoExplosion, 40, rangoExplosion)
        love.graphics.rectangle('fill', explosion.x, explosion.y + 40, 40, rangoExplosion)
    end
    
    -- Dibuja el personaje
    love.graphics.setColor(1, 0, 0)  -- Rojo
    love.graphics.rectangle('fill', personaje.x, personaje.y, personaje.ancho, personaje.alto)

    -- Muestra la posición del personaje
    love.graphics.setColor(1, 1, 1)  -- Blanco
    love.graphics.print("Posición: " .. math.floor(personaje.x) .. ", " .. math.floor(personaje.y), 10, 10)
end
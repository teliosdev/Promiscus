function love.conf(t)
    t.title = "Promiscus"
    t.author = "Ac1dL3ak"
    t.identity = "promiscus"
    t.version = "0.8.0"
    t.console = false
    t.release = false
    t.screen.fullscreen = false
    t.screen.vsync = true
    t.screen.fsaa = 1
    t.modules.joystick = false
    t.modules.audio = true
    t.modules.keyboard = true
    t.modules.event = true
    t.modules.image = true
    t.modules.graphics = true   -- Enable the graphics module (boolean)
    t.modules.timer = true
    t.modules.mouse = false
    t.modules.sound = true
    t.modules.physics = false
end
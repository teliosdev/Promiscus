function love.conf(t)
  t.title = "Promiscus"
  t.author = "Jeremy Rodi"
  t.url = nil                 -- no website :(
  t.identity = "promiscus"
  t.version = "0.8.0"
  t.console = true
  t.release = false
  t.screen.width = 800
  t.screen.height = 600
  t.screen.fullscreen = false
  t.screen.vsync = true
  t.screen.fsaa = 0
  t.modules.joystick = false
  t.modules.physics = false
  t.modules.audio = true
  t.modules.keyboard = true
  t.modules.event = true
  t.modules.image = true
  t.modules.graphics = true
  t.modules.timer = true
  t.modules.mouse = true
  t.modules.sound = true
end
; key-state ; the keycode 38 is the 'a' key on my keyboard ; under X11 see xev(1)
(mul (sin-osc ar 800 0) (key-state kr 38 0 0.1 0.5))

-- hypot ; object travels 200 meters in 6 secs (=120kph) passing 10 meters from the listener
let x = 10
    y = lfSaw kr (1 / 6) 0 * 100
    d = hypot x y
    a = 10 / (squared d)
    v = slope d
    r = (344 - v) / 344 -- the speed of sound is 344 meters/sec
in fSinOsc ar (1000 * r) 0 * a

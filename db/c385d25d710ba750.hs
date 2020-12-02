-- integrator ; a triangle wave is the integration of square wave
let f = mouseX KR 440 8800 Exponential 0.2
    o = pulse AR f 0.5
in integrator o 0.99 * 0.05

-- pause
let f = control kr "f" 440
    g = control kr "g" 1
in mrg [sinOsc ar f 0 * 0.1,pause g 1001]

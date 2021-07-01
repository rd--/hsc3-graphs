-- hypot
let x = mouseX kr 0 0.1 Linear 0.1
    y = mouseY kr 0 0.1 Linear 0.1
in sinOsc ar 440 0 * hypot x y

-- cuspL ; mouse-controlled parameters
let x = mouseX kr 0.9 1.1 Linear 0.1
    y = mouseY kr 1.8 2.0 Linear 0.1
in cuspL ar (sampleRate / 4) x y 0 * 0.1

-- cuspL ; mouse-controlled parameters
let x = mouseX KR 0.9 1.1 Linear 0.1
    y = mouseY KR 1.8 2.0 Linear 0.1
in cuspL AR (sampleRate / 4) x y 0 * 0.1

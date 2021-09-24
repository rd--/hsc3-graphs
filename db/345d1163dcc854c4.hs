-- convolution ; warning=feedback
let k = pinkNoise ar * 0.1
    i = soundIn 0
in convolution i k 2048

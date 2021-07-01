-- convolution ; warning=feedback
let k = pinkNoiseId 'α' ar * 0.1
    i = soundIn 0
in convolution i k 2048

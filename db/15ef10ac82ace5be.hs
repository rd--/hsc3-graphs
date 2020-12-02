-- convolution ; warning=feedback
let k = pinkNoise 'α' AR * 0.1
    i = soundIn 0
in convolution AR i k 2048

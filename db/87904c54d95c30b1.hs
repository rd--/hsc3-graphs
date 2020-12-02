-- bpf
let n = whiteNoise 'α' AR
    x = mouseX KR 220 440 Exponential 0.1
    y = mouseY KR 0.01 0.2 Linear 0.1
in bpf n (mce [x, 550 - x]) y

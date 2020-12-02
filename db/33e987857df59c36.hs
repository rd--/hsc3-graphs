-- sinOscFB
let y = mouseY KR 10 1000 Exponential 0.2
    x = mouseX KR (pi/2) pi Linear 0.2
in sinOscFB AR y x * 0.1

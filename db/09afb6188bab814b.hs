-- lagUD
let x = mouseX KR 0.0 (1/100) Linear 0.2
    y = mouseY KR 0.0 (3/100) Linear 0.2
in lagUD (lfPulse AR 50 0 0.25) x y * 0.1

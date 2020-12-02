-- MiBraids ; scanning
let timb = lfNoise1 'α' KR 0.3 * 0.5 + 0.5
    color = lfNoise1 'β' KR 0.3 * 0.5 + 0.5
    pit = mouseY KR 33 73 Linear 0.2
    model = mouseX KR 0 47 Linear 0.2
in X.miBraids AR pit timb color model 0 0 0 0 0 * 0.1

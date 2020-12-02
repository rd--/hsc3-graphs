-- whiteNoise ; speaker balance
let x = mouseX KR 0.1 2 Linear 0.2
    y = mouseY KR (-90) (-30) Linear 0.2
    l = sinOsc KR x 0
    n = whiteNoise 'α' AR
in pan2 n l (dbAmp y)

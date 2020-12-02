-- freeVerb2 ; mouse control
let i = impulse AR 1 0
    c = lfCub AR 1200 0
    s = decay i 0.25 * c * 0.1
    x = mouseX KR 0 1 Linear 0.1
    y = mouseY KR 0 1 Linear 0.1
in freeVerb s y x 0.5

-- pv_BinShift ; mouse control
let z = soundIn 0
    x = mouseX KR (-10) 100 Linear 0.1 -- shift
    y = mouseY KR 1 4 Linear 0.1 -- stretch
    b = mouseButton KR 0 1 0.2
    pv = pv_BinShift (ffta 'β' 2048 z 0.5 0 1 0) y x b
in ifft' pv * 0.25

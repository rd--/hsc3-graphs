-- ay ; mouse control
let tonea = mouseY kr 10 3900 Exponential 0.2
    toneb = mouseX kr 10 3900 Exponential 0.2
    ctl = 3
    vola = 14
    volb = 14
    volc = 0
    s = X.ay ar tonea toneb 1555 1 ctl vola volb volc 4 1 0
in pan2 s 0 0.25

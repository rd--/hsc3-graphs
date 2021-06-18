-- tgrn (rd) ; requires=buf
let b = namedcontrol "buf" 0
    trate = mousey 2 120 exponential 0.1
    dur = 1.2 / trate
    clk = impulse trate 0
    pos = mousex 0 (bufdur b) linear 0.1
    pan = whitenoise () * 0.6
    n = round (whitenoise () * 3) 1
    rate = shiftleft 1.2 n
in tgrains 2 clk b rate pos dur pan 0.5 2

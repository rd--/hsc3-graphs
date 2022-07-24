-- tgrn (rd) ; requires=buf
let b = ctl "buf" 0
    trate = MouseY 2 120 exponential 0.1
    dur = 1.2 / trate
    clk = Impulse trate 0
    pos = MouseX 0 (BufDur b) linear 0.1
    pan = WhiteNoise () * 0.6
    n = Round (WhiteNoise () * 3) 1
    rate = ShiftLeft 1.2 n
in TGrains 2 clk b rate pos dur pan 0.5 2

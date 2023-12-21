-- tGrains ; sync oscillator ; requires=buf
--         ; http://sc-users.bham.ac.narkive.com/sj4Tw3ub/sync-osc#post5 (jmcc)
--         ; "A wavetable windowed sync oscillator could be written.
--         ;  You can actually do a version of this with TGrains."
let b = control kr "buf" 100
    freq = 100
    dur = 2 / freq
    clk = impulse ar freq 0
    x = mouseX kr 0.5 16 Exponential 0.2
in tGrains 2 clk b x (0.3 * bufDur kr b) dur 0 0.1 2

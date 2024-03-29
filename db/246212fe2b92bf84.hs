-- analog bubbles (jmcc) #1 ; C-cC-v c.f. hsc3-ui-region
let f1 = control_m kr "f1" 0.4 (0.1,16,"exp")
    f2 = control_m kr "f2" 8.0 (0.1,16,"exp")
    dt = control_m kr "dt" 0.90375 (0.5,2,"lin")
    o = lfSaw kr (mce2 f2 (f2 * dt)) 0 * 3 + 80
    f = lfSaw kr f1 0 * 24 + o
    s = sinOsc ar (midiCps f) 0 * 0.04
in combN s 0.2 0.2 4

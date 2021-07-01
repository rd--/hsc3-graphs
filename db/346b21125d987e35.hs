-- lfSaw ; mixed with sin, then with distortions
let f = xLine kr 220 440 10 DoNothing
    o1 = sinOsc ar (f + mce2 0 0.7) 0
    o2 = lfSaw ar (f + mce2 0 0.7) 0 * 0.3
    o3 = o1 + o2
    o4 = cubed (distort (log (distort o3)))
in o4 * 0.05

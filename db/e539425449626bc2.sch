-- analog bubbles (jmcc)
let o = LFSaw [8, 7.23] 0 * 3 + 80
    f = LFSaw 0.4 0 * 24 + o
    s = SinOsc (MidiCps f) 0 * 0.05
in CombN s 0.2 0.2 4 * 0.5

-- dseq ; rather than MCE expansion at tr, it can be clearer to view tr as a functor
let tr = impulse kr (mce [2,3,5]) 0
    f (z,t) = demand t 0 (dseqId z dinf (mce [60,63,67,69]))
    m = mce_map_ix f tr
    o = sinOsc ar (midiCps m) 0 * 0.1
in splay o 1 1 0 True

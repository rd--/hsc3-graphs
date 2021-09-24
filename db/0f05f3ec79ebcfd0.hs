-- dseq ; the SC2 Sequencer UGen is somewhat like the sequ function below
let sequId e s tr = demand tr 0 (dseqId e dinf (mce s))
    t = impulse ar 6 0
    n0 = sequId 'α' [60,62,63,58,48,55] t
    n1 = sequId 'β' [63,60,48,62,55,58] t
in lfSaw ar (midiCps (mce2 n0 n1)) 0 * 0.05

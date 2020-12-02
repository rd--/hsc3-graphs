-- dseq ; the SC2 Sequencer UGen is somewhat like the sequ function below
let sequ e s tr = demand tr 0 (dseq e dinf (mce s))
    t = impulse AR 6 0
    n0 = sequ 'α' [60,62,63,58,48,55] t
    n1 = sequ 'β' [63,60,48,62,55,58] t
in lfSaw AR (midiCPS (mce2 n0 n1)) 0 * 0.05

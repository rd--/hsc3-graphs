-- spe (jmcc)
let rapf i = allpassN i 0.05 (X.rRandN 2 0 0.05) 4
    src = let t = impulse kr 9 0
              e = envGen kr t 0.1 0 1 DoNothing (envPerc 0.1 1)
              s = mce [00,03,02,07
                      ,08,32,16,18
                      ,00,12,24,32]
              f = midiCps (demand t 0 (dseq dinf s) + 32)
              rq = midiCps (lfNoise1 kr 1 * 36 + 110)
          in rlpf (lfSaw ar f 0 * e) rq 0.1
in iter 4 rapf src

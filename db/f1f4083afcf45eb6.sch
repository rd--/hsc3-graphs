-- https://sccode.org/1-590 (dm)
let shiftregister n tr x =
      let buf = localbuf 1 n
          count = pulsecount tr 0
      in mrg2
         (demand tr 0 (mcereverse (dbufrd buf (map (+ count) [1 .. n]) loop)))
         (demand tr 0 (dbufwr buf count x loop))
    amp = 0.1
    ip = impulse (1/16) 0
    rt = tchoose ip [3,5,10]
    trs = tchoose ip [0,2,-2,7,-5]
    tr1 = trig1 (cuspl (rt * 3) 1 1.9 0.0) 0.001
    tr4 = pulsedivider tr1 4 0
    oct = demand tr4 0 (drand dinf [12,-12])
    note = demand tr1 0 (dseq dinf (map (+ trs) [42,46,51,54,59,63,66]) + oct)
    chord = shiftregister 5 tr1 (midicps note)
    sig = pmosc
          (vibrato chord 6 0.02 0 0 0.04 0.1 0.0 0.0)
          (linlin (lfpulse (1/8) 0 0.5) 0 1 1.01 2.01 * chord)
          (envgen tr1 1 0 1 donothing (env [3,3,0] [0.01, 0.2] [-4,-4] (-1) (-1)))
          0
    cmp = mix (sig * amp)
in xfade2
   [cmp, cmp]
   (gverb (bpf cmp (midicps 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300)
   0.2
   1

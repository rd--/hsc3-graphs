-- https://sccode.org/1-590 (dm)
let shiftRegister n tr x =
      let buf = LocalBuf 1 n
          count = PulseCount tr 0
      in Mrg2
         (Demand tr 0 (reverse (Dbufrd buf (map (+ count) [1 .. n]) loop)))
         (Demand tr 0 (Dbufwr buf count x loop))
    amp = 0.1
    ip = Impulse (1/16) 0
    rt = TChoose ip [3, 5, 10]
    trs = TChoose ip [0, 2, -2, 7, -5]
    tr1 = Trig1 (CuspL (rt * 3) 1 1.9 0.0) 0.001
    tr4 = PulseDivider tr1 4 0
    oct = Demand tr4 0 (Drand inf [12, -12])
    note = Demand tr1 0 (Dseq inf (map (+ trs) [42, 46, 51, 54, 59, 63, 66]) + oct)
    chord = shiftRegister 5 tr1 (MidiCps note)
    sig = PmOsc
          (Vibrato chord 6 0.02 0 0 0.04 0.1 0.0 0.0)
          (LinLin (LfPulse (1/8) 0 0.5) 0 1 1.01 2.01 * chord)
          (EnvGen tr1 1 0 1 doNothing (Env [3, 3, 0] [0.01,  0.2] [-4, -4] (-1) (-1)))
          0
    cmp = Mix (sig * amp)
in XFade2
   [cmp, cmp]
   (GVerb (Bpf cmp (MidiCps 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300)
   0.2
   1

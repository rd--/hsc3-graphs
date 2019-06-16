import Sound.SC3 {- hsc3 -}

shift_register_f :: UGen -> UGen -> UGen -> UGen
shift_register_f n tr x =
  let buf = localBuf 'α' 1 n
      count = pulseCount tr 0
  in mrg2
     (demand tr 0 (mceReverse (dbufrd 'γ' buf (mceMap (+ count) (mce [1 .. n])) Loop)))
     (demand tr 0 (dbufwr 'β' buf count x Loop))

shift_register :: UGen
shift_register =
  let amp = 0.1
      ip = impulse KR (1/16) 0
      rt = tChoose 'δ' ip (mce [3,5,40])
      trs = tChoose 'ε' ip (mce [0,12,-2,7,-15])
      tr = trig1 (cuspL AR (rt * 12) 1 1.9 0.0) 0.001
      tr4 = pulseDivider tr 4 0
      oct = demand tr4 0 (drand 'ζ' dinf (mce [12,-12]))
      note = demand tr 0 (dseq 'η' dinf (mceMap (+ trs) (mce [42,46,51,54,59,63,66])) + oct) -- scramble
      chord = shift_register_f 5 tr note
      chord_cps = midiCPS chord
      sig = pmOsc AR
            (vibrato 'θ' AR (k2a chord_cps) 6 0.02 0 0 0.04 0.1 0.0 0.0)
            (urange 1.01 2.01 (lfPulse KR (1/8) 0 0.5) * chord_cps)
            (envGen KR tr 1 0 1 DoNothing (envelope [3,3,0] [0, 0.2] [EnvNum (-4)]))
            0
      cmp = mix (sig * ampCompA KR chord_cps 0 0.32 1 * amp)
  in xFade2
     (mce2 cmp cmp)
     (gVerb (bpf cmp (midiCPS 90) 1) 50 8 0.5 0.5 15 0 0.7 0.5 300)
     0.2
     1

main :: IO ()
main = audition (out 0 shift_register)
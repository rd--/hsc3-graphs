-- zizle (jmcc) #SC3d1.5 ; event control
let f c (g,x,y,z,o,_,_,_,_,_) =
      let a e f0 = let fm = mce2 (tRand (e,'α') 0.7 1.3 g) 1
                       ph = mce2 (tRand (e,'β') 0 two_pi g) (tRand (e,'γ') 0 two_pi g)
                   in mix (sinOsc AR (f0 * fm) ph)
          a1 = max (a (c,'δ') (tExpRand (c,'ε') 0.3 8 g)) 0
          a2 = abs (a (c,'ζ') (tExpRand (c,'η') 6 24 g))
          sig = sinOsc AR (midiCPS (x * 84 + 24)) (tRand 'ι' 0 two_pi g)
      in pan2 (sig * a1 * a2) (o * 2 - 1) (z * lagUD g (y * 0.01) (y * 2))
in mix (rEventVoicer 16 f) * control KR "gain" 1

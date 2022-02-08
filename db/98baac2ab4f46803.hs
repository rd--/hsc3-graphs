-- zizle (jmcc) #SC3d1.5 ; event control ; id
let f (c,g,x,y,z,o,_,_,_,_,_) =
      let a e f0 = let fm = mce2 (tRandId (e,'α') 0.7 1.3 g) 1
                       ph = mce2 (tRandId (e,'β') 0 two_pi g) (tRandId (e,'γ') 0 two_pi g)
                   in mix (sinOsc ar (f0 * fm) ph)
          a1 = max (a (c,'δ') (tExpRandId (c,'ε') 0.3 8 g)) 0
          a2 = abs (a (c,'ζ') (tExpRandId (c,'η') 6 24 g))
          sig = sinOsc ar (midiCps (x * 84 + 24)) (tRandId 'ι' 0 two_pi g)
      in pan2 (sig * a1 * a2) (o * 2 - 1) (z * lagUD g (y * 0.01) (y * 2))
in mix (eventVoicer 16 f) * control kr "gain" 1

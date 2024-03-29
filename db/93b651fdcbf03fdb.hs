-- http://sccode.org/1-4Q6 (f0)
let f (_,g,_,y,z,o,_,_,p,px,_) =
      let normalise x = map (/ (maximum x)) x
          amps = normalise [1,0.67,1,1.8,2.67,1.67,1.46,1.33,1.33,1,1.33]
          durs = [1,0.9,0.65,0.55,0.325,0.35,0.25,0.2,0.15,0.1,0.075]
          frqs = [0.56,0.56,0.92,0.92,1.19,1.7,2,2.74,3,3.76,4.07]
          dets = [0,1,0,1.7,0,0,0,0,0,0,0]
          fn i =
            let shp = let cv = EnvNum (-4.5)
                      in envPerc_c 0.005 ((y + 1) * 6 * durs!!i) (amps!!i) (cv,cv)
                env = envGen ar g (latch z g) 0 1 DoNothing shp
            in sinOsc ar (midiCps (p * 127 + px) * frqs!!i + dets!!i) 0 * env * g
      in pan2 (mixFill 11 fn) (o * 2 - 1) 1
in mix (voicer 16 f) * control kr "gain" 0.75

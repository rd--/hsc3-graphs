-- stkMoog ; event control
let f (_,g,_,y,z,o,rx,ry,p,px,_) =
      let freq = midiCps (p * 127 + px)
          filterQ = y * 128
          sweeprate = rx * 16
          vibfreq = y * 64
          vibgain = ry * 4
          gain = linLin z 0 1 16 96
          sig = X.stkMoog ar freq filterQ sweeprate vibfreq vibgain gain 1
      in pan2 sig (o * 2 - 1) (lagUD g 0.01 0.25)
in mix (voicer 16 f) * control kr "gain" 1

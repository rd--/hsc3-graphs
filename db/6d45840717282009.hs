-- MiBraids ; 28:PLUCKED ; event control
let f (_,g,x,y,_,o,rx,_,_,_,_) =
      let tr = trig1 g controlDur
          pit = x * 24 + 45
          timb = latch y tr * 0.5 + 0.25
          color = latch rx tr * 0.25 + 0.65
          md = X.miBraids_mode "PLUCKED"
      in pan2 (X.miBraids ar pit timb color md tr 0 0 0 0) (o * 2 - 1) (trig1 g 16 * 0.1)
in mix (voicer 16 f) * control kr "gain" 1

-- miElements ; model=0=MODAL ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig1 g controlDur
          pit = x * 24 + 56
          stre = ry * 0.5 + 0.25
          cont = y
          flo = o
          geo = 0.15 + (latch y tr * 0.35)
          bri = 0.5 - y * 0.35
          dmp = 1 - x * 0.25
          pos = o * 0.5
          spc = 0.5 - y * 0.5
          md = 0
      in X.miElements ar 0 0 g pit stre cont 0 z 0 flo 0.5 0.5 (0.25 + rx * 0.5) 0.5 geo bri dmp pos spc md 0 * 0.25
in mix (eventVoicer 6 f) * control kr "gain" 1

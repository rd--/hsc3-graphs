-- dwgClarinet3 ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCPS (x * 25 + 42)
          vib = sinOsc kr (y * 4) 0 * (z * 0.005) + 1
          amp = linLin z 0 1 0.65 1
          pm = k2a (amp * g)
          pc = linLin y 0 1 0.25 0.85
          m = linLin rx 0 1 0.4 1.25
          c1 = ry
          c3 = linLin o 0 1 5 9
          signal = X.dwgClarinet3 ar (freq * vib) pm pc m 1 0.01 c1 c3
      in pan2 (hpf signal 200) (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 0.25

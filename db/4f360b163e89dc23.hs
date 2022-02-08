-- rSmplrIndex ; event control ; mono ; requires=tbl,b0 data table and loaded sample data
let f (_,g,x,y,z,o,_,_,_,_,_) =
      let tbl = control kr "tbl" 0
          lhs = bufRd 1 kr tbl 0 NoLoop NoInterpolation
          rhs = bufRd 1 kr tbl (bufFrames kr tbl - 1) NoLoop NoInterpolation
          mnn = x * (rhs - lhs) + lhs
          mnn0 = latch mnn g
          rt = midiRatio ((mnn - mnn0) * y)
          (buf,rt0) = unmce2 (X.rSmplrIndex kr tbl (bufFrames kr tbl) mnn0)
          b0 = control kr "b0" 100
          sig = playBuf 1 ar (b0 + buf) (bufRateScale kr (b0 + buf) * rt0 * rt) g 0 NoLoop DoNothing
      in pan2 sig (o * 2 - 1) (z * lagUD g 0.01 0.01)
in mix (eventVoicer 16 f) * control kr "gain" 8

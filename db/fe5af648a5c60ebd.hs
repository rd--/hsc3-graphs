-- rSmplrIndex ; event control ; stereo ; requires data table and loaded sample data
let f _ (g,x,y,z,_,_,_,_) =
      let tbl = control KR "tbl" 0
          lhs = bufRd 1 KR tbl 0 NoLoop NoInterpolation
          rhs = bufRd 1 KR tbl (bufFrames KR tbl - 1) NoLoop NoInterpolation
          mnn = x * (rhs - lhs) + lhs
          mnn0 = latch mnn g
          rt = midiRatio ((mnn - mnn0) * y)
          (buf,rt0) = unmce2 (X.rSmplrIndex KR tbl (bufFrames KR tbl) mnn0)
          b0 = control KR "b0" 100
          sig = playBuf 2 AR (b0 + buf) (bufRateScale KR (b0 + buf) * rt0 * rt) g 0 NoLoop DoNothing
      in sig * z * lagUD g 0 4
in mix (rEventVoicer 16 f) * control KR "gain" 1

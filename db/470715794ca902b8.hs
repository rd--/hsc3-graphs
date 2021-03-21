-- rSmplrIndex ; event control ; stereo ; requires loaded bosendorfer (or equivalent) sample data
let f _ (g,x,y,z,_,_,_,_,_,_) =
      let s_mnn = [21,23,24,26,28,29,31,33,35,36,38,40,41,43,45,47,48,50,52,53,55,57,59
                  ,60,62,64,65,67,69,71,72,74,76,77,79,81,83,84,86,88,89,91,93,95,96,98
                  ,100,101,103,105,107,108]
          tbl = asLocalBuf 'α' s_mnn
          mnn = x * 88 + 21
          mnn0 = latch mnn g
          rt = midiRatio ((mnn - mnn0) * y)
          (buf,rt0) = unmce2 (X.rSmplrIndex KR tbl (bufFrames KR tbl) mnn0)
          b0 = control KR "b0" 100
          sig = playBuf 2 AR (b0 + buf) (bufRateScale KR (b0 + buf) * rt0 * rt) g 0 NoLoop DoNothing
      in sig * z * lagUD g 0 4
in mix (rEventVoicer 16 f) * control KR "gain" 1

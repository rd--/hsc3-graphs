-- mix ; mixing stereo signals (mce) ; sums left with left and right with right
mix (mce2 (sinOsc ar (mce2 440 441) 0) (sinOsc ar (mce2 220 221) 0)) * 0.1

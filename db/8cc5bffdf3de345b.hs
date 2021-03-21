-- mix ; mixing stereo signals (pan) ; sums left with left and right with right
mix (mce2 (pan2 (sinOsc AR 440 0) (-1) 0.1) (pan2 (sinOsc AR 441 0) 1 0.1))

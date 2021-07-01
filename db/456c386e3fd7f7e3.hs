-- lfSaw
let f = sinOsc kr (mce [0.16,0.33,0.41]) 0 * 10 + mce [1,1.1,1.5,1.78,2.45,6.7,8] * 220
in mix (lfSaw ar f 0) * 0.1

-- lfSaw
let f = sinOsc KR (mce [0.16,0.33,0.41]) 0 * 10 + mce [1,1.1,1.5,1.78,2.45,6.7,8] * 220
in mix (lfSaw AR f 0) * 0.1

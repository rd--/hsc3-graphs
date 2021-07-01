-- lfSaw ; ln 2021-04-08 https://lukasnowok.github.io/spectrology/ ; ~= [0.1,0.15,0.225,0.3375]
let o = lfSaw ar (lfSaw ar (mce (take 4 (iterate (* 1.5) 0.1))) 0 * 5000) 0 * 500
in mix (sinOsc ar (1000 + o) 0) * 1/4 * 0.1

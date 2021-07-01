-- random sine waves (jmcc) #1 ; texture=overlap,2,5,12,inf
let o = fSinOsc ar (rand 0 2000) 0 * 0.02
in pan2 o (rand2 1) 1

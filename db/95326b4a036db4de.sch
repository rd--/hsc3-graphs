-- random sine waves (jmcc) #1 ; texture=overlap,2,5,12,inf
let o = FSinOsc (Rand 0 2000) 0 * 0.02
in Pan2 o (rand2 1) 1

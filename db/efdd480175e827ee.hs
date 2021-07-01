-- select ; i-rate
let a = mce [rand 110 220,rand 220 440,rand 440 880]
in sinOsc ar (select (rand 0 3) a) 0 * 0.1

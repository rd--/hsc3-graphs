-- select ; i-rate
let a = mce [rand 'α' 110 220,rand 'β' 220 440,rand 'γ' 440 880]
in sinOsc AR (select (rand 'δ' 0 3) a) 0 * 0.1

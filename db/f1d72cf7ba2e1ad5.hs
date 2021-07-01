-- select ; i-rate ; id
let a = mce [randId 'α' 110 220,randId 'β' 220 440,randId 'γ' 440 880]
in sinOsc ar (select (randId 'δ' 0 3) a) 0 * 0.1

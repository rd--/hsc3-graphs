-- div ; integer division
let d f = (sinOsc kr 0.25 0 * 200 + 500) `f` 17
in sinOsc ar (midiCps (mce2 (d div) (d (/)) * 3)) 0 * mce2 0.1 0.05

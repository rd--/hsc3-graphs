-- mrg2 ; defines a node indicating a multiple root graph.
let l = out 0 (sinOsc ar 300 0 * 0.1)
    r = out 1 (sinOsc ar 900 0 * 0.1)
in mrg2 l r

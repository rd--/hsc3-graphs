-- mrg2 ; defines a node indicating a multiple root graph.
let l = out 0 (sinOsc AR 300 0 * 0.1)
    r = out 1 (sinOsc AR 900 0 * 0.1)
in mrg2 l r

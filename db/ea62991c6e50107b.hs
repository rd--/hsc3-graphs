-- rlpf
let ctl = rlpf (saw AR 5 * 0.1) 25 0.03
in sinOsc AR (ctl * 200 + 400) 0 * 0.1

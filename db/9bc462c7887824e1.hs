-- rlpf
let ctl = rlpf (saw ar 5 * 0.1) 25 0.03
in sinOsc ar (ctl * 200 + 400) 0 * 0.1

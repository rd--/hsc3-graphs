-- trig1 ; if duration is set to zero it is reset to one frame (at AR & KR) ; 3.11.2
let env = decay2 (trig1 (mce2 (sinOsc KR 10 0) (sinOsc AR 9 0)) 0) 0.01 0.2
in sinOsc AR (mce2 440 441) 0 * env * 0.1

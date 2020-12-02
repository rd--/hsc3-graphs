-- lag3 ; written out
let x = mouseX KR 0.0 0.01 Linear 0.2
in lag (lag (lag (lfPulse AR 100 0 0.5 * 0.2) x) x) x

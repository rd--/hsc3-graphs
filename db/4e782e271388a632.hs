-- lpcAnalyzer
let x = mouseX KR 1 128 Linear 0.2
in X.lpcAnalyzer (soundIn 0) (impulse AR 440 0 * 0.2) 128 x 0 0.999 0
